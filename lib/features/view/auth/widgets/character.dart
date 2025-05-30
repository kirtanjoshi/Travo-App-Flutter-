import 'package:flutter/material.dart';

// / Custom painter for character illustrations
class CharacterPainter extends CustomPainter {
  final CharacterType type;

  CharacterPainter({this.type = CharacterType.standing});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    switch (type) {
      case CharacterType.standing:
        _drawStandingCharacter(canvas, size, paint);
        break;
      case CharacterType.pointing:
        _drawPointingCharacter(canvas, size, paint);
        break;
      case CharacterType.celebrating:
        _drawCelebratingCharacter(canvas, size, paint);
        break;
      case CharacterType.thinking:
        _drawThinkingCharacter(canvas, size, paint);
        break;
    }
  }

  void _drawStandingCharacter(Canvas canvas, Size size, Paint paint) {
    // Head
    paint.color = Color(0xFFFFDBCC);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.22),
      size.width * 0.18,
      paint,
    );

    // Hair
    paint.color = Color(0xFF8B4513);
    Path hairPath = Path();
    hairPath.addOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.15),
        width: size.width * 0.32,
        height: size.width * 0.25,
      ),
    );
    canvas.drawPath(hairPath, paint);

    // Eyes
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.42, size.height * 0.19),
      size.width * 0.03,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.58, size.height * 0.19),
      size.width * 0.03,
      paint,
    );

    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(size.width * 0.42, size.height * 0.19),
      size.width * 0.015,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.58, size.height * 0.19),
      size.width * 0.015,
      paint,
    );

    // Smile
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = Color(0xFF8B4513);
    Path smilePath = Path();
    smilePath.addArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.24),
        width: size.width * 0.15,
        height: size.width * 0.08,
      ),
      0,
      3.14159,
    );
    canvas.drawPath(smilePath, paint);

    paint.style = PaintingStyle.fill;

    // Neck
    paint.color = Color(0xFFFFDBCC);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.45,
          size.height * 0.35,
          size.width * 0.1,
          size.height * 0.08,
        ),
        Radius.circular(5),
      ),
      paint,
    );

    // Body (shirt)
    paint.color = Color(0xFFFF6B35);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.28,
          size.height * 0.4,
          size.width * 0.44,
          size.height * 0.35,
        ),
        Radius.circular(12),
      ),
      paint,
    );

    // Shirt details
    paint.color = Color(0xFFE55A2B);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.45,
          size.height * 0.45,
          size.width * 0.1,
          size.height * 0.2,
        ),
        Radius.circular(3),
      ),
      paint,
    );

    // Arms
    paint.color = Color(0xFFFFDBCC);
    // Left arm
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.15,
          size.height * 0.42,
          size.width * 0.15,
          size.height * 0.25,
        ),
        Radius.circular(8),
      ),
      paint,
    );
    // Right arm
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.7,
          size.height * 0.42,
          size.width * 0.15,
          size.height * 0.25,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    // Hands
    canvas.drawCircle(
      Offset(size.width * 0.22, size.height * 0.65),
      size.width * 0.06,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.65),
      size.width * 0.06,
      paint,
    );

    // Pants
    paint.color = Color(0xFF2D3748);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.32,
          size.height * 0.72,
          size.width * 0.36,
          size.height * 0.2,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    // Legs
    // Left leg
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.35,
          size.height * 0.88,
          size.width * 0.12,
          size.height * 0.1,
        ),
        Radius.circular(6),
      ),
      paint,
    );
    // Right leg
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.53,
          size.height * 0.88,
          size.width * 0.12,
          size.height * 0.1,
        ),
        Radius.circular(6),
      ),
      paint,
    );

    // Shoes
    paint.color = Colors.black;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.32,
          size.height * 0.95,
          size.width * 0.18,
          size.height * 0.05,
        ),
        Radius.circular(3),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.5,
          size.height * 0.95,
          size.width * 0.18,
          size.height * 0.05,
        ),
        Radius.circular(3),
      ),
      paint,
    );
  }

  void _drawPointingCharacter(Canvas canvas, Size size, Paint paint) {
    // Similar structure but with pointing gesture
    // Head
    paint.color = Color(0xFFFFDBCC);
    canvas.drawCircle(
      Offset(size.width * 0.45, size.height * 0.22),
      size.width * 0.18,
      paint,
    );

    // Hair
    paint.color = Color(0xFF8B4513);
    Path hairPath = Path();
    hairPath.addOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.45, size.height * 0.15),
        width: size.width * 0.32,
        height: size.width * 0.25,
      ),
    );
    canvas.drawPath(hairPath, paint);

    // Eyes looking towards pointing direction
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.37, size.height * 0.19),
      size.width * 0.03,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.53, size.height * 0.19),
      size.width * 0.03,
      paint,
    );

    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(size.width * 0.39, size.height * 0.19),
      size.width * 0.015,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.55, size.height * 0.19),
      size.width * 0.015,
      paint,
    );

    // Body
    paint.color = Color(0xFF3B82F6);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.25,
          size.height * 0.4,
          size.width * 0.4,
          size.height * 0.35,
        ),
        Radius.circular(12),
      ),
      paint,
    );

    // Pointing arm (extended)
    paint.color = Color(0xFFFFDBCC);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.65,
          size.height * 0.35,
          size.width * 0.25,
          size.height * 0.12,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    // Pointing finger
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.85,
          size.height * 0.38,
          size.width * 0.12,
          size.height * 0.06,
        ),
        Radius.circular(4),
      ),
      paint,
    );

    // Other arm
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.08,
          size.height * 0.45,
          size.width * 0.18,
          size.height * 0.22,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    // Legs
    paint.color = Color(0xFF2D3748);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.3,
          size.height * 0.72,
          size.width * 0.3,
          size.height * 0.25,
        ),
        Radius.circular(8),
      ),
      paint,
    );
  }

  void _drawCelebratingCharacter(Canvas canvas, Size size, Paint paint) {
    // Head
    paint.color = Color(0xFFFFDBCC);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.25),
      size.width * 0.16,
      paint,
    );

    // Hair
    paint.color = Color(0xFF8B4513);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.18),
      size.width * 0.18,
      paint,
    );

    // Excited eyes
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.42, size.height * 0.22),
      size.width * 0.035,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.58, size.height * 0.22),
      size.width * 0.035,
      paint,
    );

    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(size.width * 0.42, size.height * 0.22),
      size.width * 0.02,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.58, size.height * 0.22),
      size.width * 0.02,
      paint,
    );

    // Big smile
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = Color(0xFF8B4513);
    Path smilePath = Path();
    smilePath.addArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.27),
        width: size.width * 0.2,
        height: size.width * 0.12,
      ),
      0,
      3.14159,
    );
    canvas.drawPath(smilePath, paint);
    paint.style = PaintingStyle.fill;

    // Body
    paint.color = Color(0xFF10B981);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.3,
          size.height * 0.4,
          size.width * 0.4,
          size.height * 0.3,
        ),
        Radius.circular(12),
      ),
      paint,
    );

    // Arms raised up (celebrating)
    paint.color = Color(0xFFFFDBCC);
    // Left arm up
    canvas.save();
    canvas.translate(size.width * 0.25, size.height * 0.45);
    canvas.rotate(-0.8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width * 0.15, size.height * 0.25),
        Radius.circular(8),
      ),
      paint,
    );
    canvas.restore();

    // Right arm up
    canvas.save();
    canvas.translate(size.width * 0.75, size.height * 0.45);
    canvas.rotate(0.8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width * 0.15, size.height * 0.25),
        Radius.circular(8),
      ),
      paint,
    );
    canvas.restore();

    // Hands
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.25),
      size.width * 0.05,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.25),
      size.width * 0.05,
      paint,
    );

    // Confetti effect
    paint.color = Color(0xFFFF6B35);
    for (int i = 0; i < 6; i++) {
      canvas.drawCircle(
        Offset(size.width * (0.1 + i * 0.15), size.height * 0.1),
        size.width * 0.02,
        paint,
      );
    }

    // Legs
    paint.color = Color(0xFF2D3748);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.33,
          size.height * 0.68,
          size.width * 0.34,
          size.height * 0.28,
        ),
        Radius.circular(8),
      ),
      paint,
    );
  }

  void _drawThinkingCharacter(Canvas canvas, Size size, Paint paint) {
    // Head
    paint.color = Color(0xFFFFDBCC);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.25),
      size.width * 0.18,
      paint,
    );

    // Hair
    paint.color = Color(0xFF8B4513);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.18),
      size.width * 0.2,
      paint,
    );

    // Contemplative eyes
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.42, size.height * 0.23),
      size.width * 0.03,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.58, size.height * 0.23),
      size.width * 0.03,
      paint,
    );

    paint.color = Colors.black;
    // Eyes looking up (thinking)
    canvas.drawCircle(
      Offset(size.width * 0.42, size.height * 0.225),
      size.width * 0.015,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.58, size.height * 0.225),
      size.width * 0.015,
      paint,
    );

    // Body
    paint.color = Color(0xFF8B5CF6);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.28,
          size.height * 0.42,
          size.width * 0.44,
          size.height * 0.32,
        ),
        Radius.circular(12),
      ),
      paint,
    );

    // Hand on chin (thinking pose)
    paint.color = Color(0xFFFFDBCC);
    // Left arm
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.15,
          size.height * 0.45,
          size.width * 0.15,
          size.height * 0.2,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    // Hand near chin
    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.32),
      size.width * 0.06,
      paint,
    );

    // Right arm relaxed
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.7,
          size.height * 0.48,
          size.width * 0.15,
          size.height * 0.22,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    // Right hand
    canvas.drawCircle(
      Offset(size.width * 0.77, size.height * 0.68),
      size.width * 0.05,
      paint,
    );

    // Thought bubble
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.15),
      size.width * 0.12,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.68, size.height * 0.22),
      size.width * 0.04,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.63, size.height * 0.26),
      size.width * 0.02,
      paint,
    );

    paint.style = PaintingStyle.fill;
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.15),
      size.width * 0.12,
      paint,
    );

    // Question mark in thought bubble
    paint.color = Color(0xFF8B5CF6);
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '?',
        style: TextStyle(
          color: Color(0xFF8B5CF6),
          fontSize: size.width * 0.15,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * 0.72, size.height * 0.1));

    // Legs
    paint.color = Color(0xFF2D3748);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.32,
          size.height * 0.72,
          size.width * 0.36,
          size.height * 0.25,
        ),
        Radius.circular(8),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Enum for different character types
enum CharacterType { standing, pointing, celebrating, thinking }
