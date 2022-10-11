import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:primus/model/word.dart';

class SwiperTinder extends StatefulWidget {
  const SwiperTinder({required this.words, Key? key}) : super(key: key);

  final List<Widget> words;
  @override
  State<SwiperTinder> createState() => _SwiperTinderState();
}

class _SwiperTinderState extends State<SwiperTinder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Align(
        alignment: Alignment.topCenter,
        child: Swiper(
          loop: true,
          outer: true,
          containerWidth: double.infinity,
          layout: SwiperLayout.TINDER,
          itemCount: widget.words.length,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 200,
          itemBuilder: (context, index) {
            return widget.words[index];
          },
        ),
      ),
    );
  }
}
