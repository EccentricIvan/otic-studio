import 'dart:math' as math;
import 'package:flutter/material.dart';

class ConfettiBurst extends StatefulWidget {
  const ConfettiBurst({super.key, this.particleCount = 30});
  final int particleCount;

  @override
  State<ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<ConfettiBurst>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..forward();

  late final List<_Particle> _particles = List.generate(
    widget.particleCount,
    (_) => _Particle(),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _ConfettiPainter(
              progress: _controller.value,
              particles: _particles,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _Particle {
  static final _rng = math.Random();

  final double angle = _rng.nextDouble() * 2 * math.pi;
  final double speed = 80 + _rng.nextDouble() * 200;
  final double size = 4 + _rng.nextDouble() * 6;
  final Color color = _colors[_rng.nextInt(_colors.length)];
  final double rotationSpeed = (_rng.nextDouble() - 0.5) * 8;

  static const _colors = [
    Color(0xFFF59E0B),
    Color(0xFF10B981),
    Color(0xFF0EA5E9),
    Color(0xFFEC4899),
    Color(0xFF4F46E5),
    Color(0xFFF97316),
    Color(0xFF8B5CF6),
  ];
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter({required this.progress, required this.particles});
  final double progress;
  final List<_Particle> particles;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    for (final p in particles) {
      final opacity = (1.0 - progress).clamp(0.0, 1.0);
      if (opacity <= 0) continue;

      final distance = p.speed * progress;
      final gravity = 120 * progress * progress;
      final x = centerX + math.cos(p.angle) * distance;
      final y = centerY + math.sin(p.angle) * distance + gravity;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.rotationSpeed * progress * math.pi);

      final paint = Paint()
        ..color = p.color.withValues(alpha: opacity)
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.6),
          const Radius.circular(1),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.progress != progress;
}
