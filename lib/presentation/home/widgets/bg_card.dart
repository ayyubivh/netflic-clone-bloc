// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_clone/core/colors/colors.dart';

import '../../../core/debounce/constants.dart';
import 'custom_btn.dart';

class BgCard extends StatelessWidget {
  final String img;
  const BgCard({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          )),
        ),
        Positioned(
          left: 0,
          bottom: 7,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomBtnWidget(icon: Icons.add, title: 'My List'),
                _playBtn(),
                const CustomBtnWidget(title: 'info', icon: Icons.info_outline)
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playBtn() {
    return TextButton.icon(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(kWhite)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kBlack,
        ),
        label: const Text(
          'Play',
          style: TextStyle(
            fontSize: 20,
            color: kBlack,
          ),
        ));
  }
}
