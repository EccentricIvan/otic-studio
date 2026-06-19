import 'package:flutter/material.dart';

import '../../ai_core/llama/fllama_engine.dart';
import '../../ai_core/llama/llama_model_manager.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/responsive.dart';

class LlamaTestScreen extends StatefulWidget {
  const LlamaTestScreen({super.key});

  @override
  State<LlamaTestScreen> createState() => _LlamaTestScreenState();
}

class _LlamaTestScreenState extends State<LlamaTestScreen> {
  final _manager = LlamaModelManager();
  final _engine = FllamaEngine();
  final _urlController = TextEditingController();
  final _promptController = TextEditingController();

  LlamaModelInfo? _modelInfo;
  bool _checking = true;
  bool _downloading = false;
  bool _loadingModel = false;
  bool _generating = false;
  double? _downloadProgress;
  double? _loadProgress;
  String _response = '';
  String? _error;

  @override
  void initState() {
    super.initState();
    _refreshModelInfo();
  }

  @override
  void dispose() {
    _urlController.dispose();
    _promptController.dispose();
    _engine.dispose();
    super.dispose();
  }

  Future<void> _refreshModelInfo() async {
    setState(() {
      _checking = true;
      _error = null;
    });
    final info = await _manager.checkModel();
    if (!mounted) return;
    _urlController.text = info.sourceUrl ?? _urlController.text;
    setState(() {
      _modelInfo = info;
      _checking = false;
    });
  }

  Future<void> _downloadModel() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _downloading = true;
      _downloadProgress = null;
      _error = null;
    });

    try {
      final info = await _manager.downloadModel(
        _urlController.text,
        onProgress: (progress) {
          if (!mounted) return;
          setState(() => _downloadProgress = progress.fraction);
        },
      );
      if (!mounted) return;
      setState(() => _modelInfo = info);
    } on LlamaModelDownloadException catch (e) {
      if (!mounted) return;
      setState(() => _error = e.message);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'Download failed: $e');
    } finally {
      if (mounted) {
        setState(() {
          _downloading = false;
          _downloadProgress = null;
        });
      }
    }
  }

  Future<void> _sendPrompt() async {
    final prompt = _promptController.text.trim();
    final info = _modelInfo;
    if (prompt.isEmpty || info == null || !info.isReady) return;

    FocusScope.of(context).unfocus();
    setState(() {
      _loadingModel = !_engine.isLoaded;
      _generating = true;
      _loadProgress = null;
      _response = '';
      _error = null;
    });

    try {
      await _engine.loadModel(
        info.path,
        onProgress: (progress) {
          if (!mounted) return;
          setState(() => _loadProgress = progress);
        },
      );
      if (!mounted) return;
      setState(() => _loadingModel = false);

      await _engine.generate(
        prompt: prompt,
        onToken: (token) {
          if (!mounted) return;
          setState(() => _response += token);
        },
      );
    } on FllamaEngineException catch (e) {
      if (!mounted) return;
      setState(() => _error = e.message);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'Inference failed: $e');
    } finally {
      if (mounted) {
        setState(() {
          _loadingModel = false;
          _generating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = _modelInfo;
    final ready = info?.isReady ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Llama Test')),
      body: MaxWidth(
        maxWidth: 820,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _StatusPanel(
              checking: _checking,
              info: info,
              isLoaded: _engine.isLoaded,
            ),
            const SizedBox(height: 16),
            _DownloadPanel(
              controller: _urlController,
              ready: ready,
              downloading: _downloading,
              progress: _downloadProgress,
              onDownload: _downloadModel,
              onRefresh: _refreshModelInfo,
            ),
            const SizedBox(height: 16),
            _PromptPanel(
              controller: _promptController,
              enabled: ready && !_downloading && !_generating && !_loadingModel,
              generating: _generating,
              loadingModel: _loadingModel,
              loadProgress: _loadProgress,
              response: _response,
              onSend: _sendPrompt,
            ),
            if (_error != null) ...[
              const SizedBox(height: 16),
              _ErrorPanel(message: _error!),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusPanel extends StatelessWidget {
  const _StatusPanel({
    required this.checking,
    required this.info,
    required this.isLoaded,
  });

  final bool checking;
  final LlamaModelInfo? info;
  final bool isLoaded;

  @override
  Widget build(BuildContext context) {
    final status = checking
        ? 'Checking'
        : switch (info?.status) {
            LlamaModelStatus.ready => isLoaded ? 'Loaded' : 'Downloaded',
            LlamaModelStatus.corrupted => 'Incomplete',
            _ => 'Missing',
          };
    final color = switch (info?.status) {
      LlamaModelStatus.ready => AppColors.teachColor,
      LlamaModelStatus.corrupted => Colors.orange,
      _ => AppColors.textSecondary,
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(Icons.psychology_alt_outlined, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Llama 3.2 1B GGUF',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  [
                    status,
                    if (info?.sizeBytes != null) _formatBytes(info!.sizeBytes!),
                  ].join(' - '),
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DownloadPanel extends StatelessWidget {
  const _DownloadPanel({
    required this.controller,
    required this.ready,
    required this.downloading,
    required this.progress,
    required this.onDownload,
    required this.onRefresh,
  });

  final TextEditingController controller;
  final bool ready;
  final bool downloading;
  final double? progress;
  final VoidCallback onDownload;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'GGUF download URL',
              hintText: 'https://huggingface.co/.../resolve/main/model.gguf',
              prefixIcon: Icon(Icons.link),
            ),
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.done,
            enabled: !downloading,
          ),
          const SizedBox(height: 12),
          if (downloading) ...[
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 12),
          ],
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  icon: Icon(ready ? Icons.download_done : Icons.download),
                  label: Text(ready ? 'Download again' : 'Download model'),
                  onPressed: downloading ? null : onDownload,
                ),
              ),
              const SizedBox(width: 12),
              IconButton.outlined(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: downloading ? null : onRefresh,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PromptPanel extends StatelessWidget {
  const _PromptPanel({
    required this.controller,
    required this.enabled,
    required this.generating,
    required this.loadingModel,
    required this.loadProgress,
    required this.response,
    required this.onSend,
  });

  final TextEditingController controller;
  final bool enabled;
  final bool generating;
  final bool loadingModel;
  final double? loadProgress;
  final String response;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: controller,
            minLines: 2,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Prompt',
              prefixIcon: Icon(Icons.chat_bubble_outline),
            ),
            enabled: enabled,
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            icon: generating
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: Text(loadingModel ? 'Loading model' : 'Send'),
            onPressed: enabled ? onSend : null,
          ),
          if (loadingModel) ...[
            const SizedBox(height: 12),
            LinearProgressIndicator(value: loadProgress),
          ],
          const SizedBox(height: 16),
          Container(
            constraints: const BoxConstraints(minHeight: 180),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: SelectableText(
              response.isEmpty
                  ? generating
                      ? ''
                      : 'Response'
                  : response,
              style: TextStyle(
                color: response.isEmpty
                    ? AppColors.textHint
                    : AppColors.textPrimary,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorPanel extends StatelessWidget {
  const _ErrorPanel({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatBytes(int bytes) {
  const gib = 1024 * 1024 * 1024;
  const mib = 1024 * 1024;
  if (bytes >= gib) return '${(bytes / gib).toStringAsFixed(2)} GB';
  return '${(bytes / mib).toStringAsFixed(0)} MB';
}
