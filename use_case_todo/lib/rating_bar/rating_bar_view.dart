import 'package:flutter/material.dart';

class SomeData extends StatelessWidget {
  const SomeData({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SomeData Title')),
      body: const RatingBar(
        onPressed: print,
        ratingBarIcon: RatingBarIcon.heart,
      ),
    );
  }
}

class RatingBar extends StatefulWidget {
  const RatingBar({
    super.key,
    required this.onPressed,
    this.ratingBarIcon = RatingBarIcon.star,
    this.iconSize = 70.0,
    this.initialValue = 1,
    this.direction = Axis.horizontal,
    this.progressColor = const Color(0xFFFFBF00),
    this.backgroundColor = const Color(0xFFC5C5C5),
  }) : assert(initialValue >= 0 && initialValue <= 5);

  final void Function(int index) onPressed;
  final RatingBarIcon ratingBarIcon;
  final int initialValue;
  final Color progressColor;
  final Axis direction;
  final double iconSize;
  final Color backgroundColor;

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  final int size = 5;
  late ValueNotifier<int> selectedRate;

  @override
  void initState() {
    selectedRate = ValueNotifier(widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: size,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: widget.direction,
      itemBuilder: (context, index) => ValueListenableBuilder(
        valueListenable: selectedRate,
        builder: (_, __, ___) => _iconButton(index),
      ),
    );
  }

  IconButton _iconButton(int index) => IconButton(
        icon: widget.ratingBarIcon.icon,
        iconSize: widget.iconSize,
        onPressed: () {
          selectedRate.value = index + 1;
          widget.onPressed.call(selectedRate.value);
        },
        color: index + 1 <= selectedRate.value
            ? widget.progressColor
            : widget.backgroundColor,
      );
}

enum RatingBarIcon { star, heart }

extension RatingBarIconExtension on RatingBarIcon {
  Icon get icon => Icon(index == 0 ? Icons.star : Icons.favorite);
}
