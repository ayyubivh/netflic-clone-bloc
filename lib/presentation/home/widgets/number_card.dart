import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index, required this.imageUrl})
      : super(key: key);

  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 50,
                height: 200,
              ),
              Container(
                width: 130,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: kRadius,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 15,
            bottom: -30,
            child: BorderedText(
              strokeWidth: 4.0,
              strokeColor: kWhite,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 150,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
