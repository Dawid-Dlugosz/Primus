import 'package:flutter/material.dart';

class SwiperCard extends StatelessWidget {
  const SwiperCard({
    required this.child,
    required this.width,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: width,
      child: child,
    );
  }
}
