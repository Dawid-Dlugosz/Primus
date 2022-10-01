import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primus/widgets/swiper/swiper_card.dart';

class SwiperWrapper extends StatefulWidget {
  const SwiperWrapper({
    required this.childrens,
    this.countLenght = 3,
    this.maxWidth = 300,
    this.scale = 50,
    this.offset = 50,
    Key? key,
  }) : super(key: key);

  final List<Widget> childrens;
  // Lenght of list
  final int countLenght;
  // Width first card
  final double maxWidth;
  // How much to reduce with single card
  final double scale;
  // As long as you move the next card
  final double offset;
  @override
  State<SwiperWrapper> createState() => _SwiperWrapperState();
}

class _SwiperWrapperState extends State<SwiperWrapper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('dawdadawda'),
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.countLenght,
                  itemBuilder: ((context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: SwiperCard(
                        width: widget.maxWidth - widget.scale * index,
                        child: Positioned(
                          top: widget.offset * index,
                          child: widget.childrens[index],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
