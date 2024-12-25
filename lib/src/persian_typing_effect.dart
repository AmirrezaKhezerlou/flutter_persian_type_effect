import 'dart:async';
import 'package:flutter/material.dart';


class PersianTypeEffect extends StatefulWidget {
  final String text;
  final Duration duration;

   const PersianTypeEffect({super.key, required this.text, this.duration = const Duration(seconds: 3)});

  @override
  // ignore: library_private_types_in_public_api
  _PersianTypeEffectState createState() => _PersianTypeEffectState();
}

class _PersianTypeEffectState extends State<PersianTypeEffect> {
  String displayedText = '';
  int charIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    int charDuration = (widget.duration.inMilliseconds /widget.text.length).round();

    timer = Timer.periodic(Duration(milliseconds: charDuration), (Timer t) {
      if (charIndex < widget.text.length) {
        setState(() {
          displayedText += widget.text[charIndex];
          charIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextDirection textDirection = widget.text.isArabicOrFarsi()
        ? TextDirection.rtl
        : TextDirection.ltr;

    return Directionality(
      textDirection: textDirection,
      child: Text(
        displayedText,
        style:const TextStyle(fontSize: 20),
      ));
  }
}

extension StringExtensions on String {
  bool isArabicOrFarsi() {
    final arabicFarsiRegEx = RegExp(r'[\u0600-\u06FF]');
    return arabicFarsiRegEx.hasMatch(this);
  }
}
