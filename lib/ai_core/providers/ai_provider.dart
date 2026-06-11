import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../inference/inference_engine.dart';
import '../inference/mock_engine.dart';
import '../model/model_manager.dart';
import '../tutor/tutor_pipeline.dart';
import '../tutor/tutor_response.dart';

// ── Model status ────────────────────────────────────────────────────────────

final modelManagerProvider = Provider<ModelManager>((ref) => ModelManager());

final modelInfoProvider = FutureProvider<ModelInfo>((ref) {
  return ref.watch(modelManagerProvider).checkModel();
});

// ── Engine lifecycle ─────────────────────────────────────────────────────────

final inferenceEngineProvider = Provider<InferenceEngine>((ref) {
  // Use platform engine when model is present; mock for dev.
  return MockEngine(); // replaced by platform engine after model loads
});

final engineLoadedProvider = FutureProvider<InferenceEngine>((ref) async {
  final modelInfo = await ref.watch(modelInfoProvider.future);
  if (!modelInfo.isReady) {
    // No model file — return mock so the UI still works
    final mock = MockEngine();
    await mock.loadModel('');
    return mock;
  }

  final engine = createPlatformEngine();
  await engine.loadModel(modelInfo.path!);
  ref.onDispose(engine.dispose);
  return engine;
});

// ── Tutor pipeline ───────────────────────────────────────────────────────────

final tutorPipelineProvider = FutureProvider<TutorPipeline>((ref) async {
  final engine = await ref.watch(engineLoadedProvider.future);
  return TutorPipeline(engine: engine);
});

// ── Chat state ───────────────────────────────────────────────────────────────

class ChatState {
  const ChatState({
    this.messages = const [],
    this.isGenerating = false,
    this.streamingText = '',
  });

  final List<ChatMessage> messages;
  final bool isGenerating;
  final String streamingText;

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isGenerating,
    String? streamingText,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isGenerating: isGenerating ?? this.isGenerating,
      streamingText: streamingText ?? this.streamingText,
    );
  }
}

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.isUser,
    this.stage,
    this.followUp,
  });

  final String text;
  final bool isUser;
  final TutorStage? stage;
  final String? followUp;
}

class ChatNotifier extends AsyncNotifier<ChatState> {
  @override
  Future<ChatState> build() async {
    return const ChatState();
  }

  Future<void> send(String message) async {
    final pipeline = await ref.read(tutorPipelineProvider.future);
    final current = state.valueOrNull ?? const ChatState();

    // Add user message
    state = AsyncData(current.copyWith(
      messages: [...current.messages, ChatMessage(text: message, isUser: true)],
      isGenerating: true,
      streamingText: '',
    ));

    String streamed = '';
    try {
      final response = await pipeline.respond(
        studentMessage: message,
        onToken: (token) {
          streamed += token;
          state = AsyncData(state.requireValue.copyWith(streamingText: streamed));
        },
      );

      final msgs = List<ChatMessage>.from(state.requireValue.messages)
        ..add(ChatMessage(
          text: response.text,
          isUser: false,
          stage: response.stage,
          followUp: response.followUpPrompt,
        ));

      state = AsyncData(state.requireValue.copyWith(
        messages: msgs,
        isGenerating: false,
        streamingText: '',
      ));
    } catch (e) {
      state = AsyncData(state.requireValue.copyWith(
        isGenerating: false,
        streamingText: '',
      ));
    }
  }

  void reset() {
    state = const AsyncData(ChatState());
  }
}

final chatProvider = AsyncNotifierProvider<ChatNotifier, ChatState>(ChatNotifier.new);
