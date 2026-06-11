import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

enum ModelStatus {
  /// Model file found and ready to load.
  ready,
  /// No model file present — user must transfer via USB.
  notInstalled,
  /// Model file exists but is corrupted (wrong size / bad header).
  corrupted,
}

class ModelInfo {
  const ModelInfo({
    required this.status,
    this.path,
    this.sizeBytes,
    this.platform,
  });

  final ModelStatus status;
  final String? path;
  final int? sizeBytes;
  final String? platform;

  bool get isReady => status == ModelStatus.ready;
}

/// Locates the Gemma 3 1B model file on the device.
///
/// Expected locations (checked in order):
///   Android  → <externalStorage>/OTIC/gemma-3-1b.bin
///              → <appFiles>/models/gemma-3-1b.bin
///   Windows  → <appDocuments>\OTIC\gemma-3-1b-q4_k_m.gguf
///   Linux    → <appDocuments>/OTIC/gemma-3-1b-q4_k_m.gguf
class ModelManager {
  static const _androidModelName = 'gemma-3-1b.bin';
  static const _desktopModelName = 'gemma-3-1b-q4_k_m.gguf';
  // Minimum sane file size — reject obvious truncations
  static const _minSizeBytes = 200 * 1024 * 1024; // 200 MB

  Future<ModelInfo> checkModel() async {
    final candidates = await _candidatePaths();
    for (final path in candidates) {
      final file = File(path);
      if (!await file.exists()) continue;
      final size = await file.length();
      if (size < _minSizeBytes) {
        return ModelInfo(
          status: ModelStatus.corrupted,
          path: path,
          sizeBytes: size,
          platform: _platformLabel,
        );
      }
      return ModelInfo(
        status: ModelStatus.ready,
        path: path,
        sizeBytes: size,
        platform: _platformLabel,
      );
    }
    return const ModelInfo(status: ModelStatus.notInstalled);
  }

  Future<List<String>> _candidatePaths() async {
    final paths = <String>[];

    if (defaultTargetPlatform == TargetPlatform.android) {
      // External storage (USB-accessible)
      try {
        final ext = await getExternalStorageDirectory();
        if (ext != null) {
          paths.add(p.join(ext.parent.parent.parent.parent.path, 'OTIC', _androidModelName));
        }
      } catch (_) {}
      // App-internal files dir
      final appFiles = await getApplicationDocumentsDirectory();
      paths.add(p.join(appFiles.path, 'models', _androidModelName));
    } else {
      // Windows / Linux — Documents/OTIC/
      final docs = await getApplicationDocumentsDirectory();
      paths.add(p.join(docs.path, 'OTIC', _desktopModelName));
      // Also check next to the executable (dev convenience)
      paths.add(p.join(Directory.current.path, 'models', _desktopModelName));
    }
    return paths;
  }

  String get _platformLabel {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'Android (LiteRT-LM)';
      case TargetPlatform.windows:
        return 'Windows (llama.cpp)';
      case TargetPlatform.linux:
        return 'Linux (llama.cpp)';
      default:
        return 'Unknown';
    }
  }

  /// Where to tell the user to put the model file.
  Future<String> installInstructions() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'Transfer the model file to your phone:\n'
          '  USB → Internal Storage/OTIC/$_androidModelName\n\n'
          'Model: gemma-3-1b-it-gpu-int4.bin (~900 MB)\n'
          'Source: Download from Google AI Edge on a PC,\n'
          'then copy to the phone via USB cable.';
    }
    final docs = await getApplicationDocumentsDirectory();
    final dir = p.join(docs.path, 'OTIC');
    return 'Copy the model file to:\n'
        '  $dir\\$_desktopModelName\n\n'
        'Model: gemma-3-1b-q4_k_m.gguf (~800 MB)\n'
        'Source: Download from Hugging Face (bartowski/gemma-3-1B-it-GGUF)\n'
        'on a device with internet, then transfer via USB.';
  }
}
