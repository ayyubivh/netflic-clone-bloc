import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';

import '../widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);

  final _widgetList = [
    const Section1(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: ((context, index) => _widgetList[index]),
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 30,
                )),
            itemCount: _widgetList.length));
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: btnColorBlue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          kHeight,
          MaterialButton(
            color: kWhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          textAlign: TextAlign.center,
          'Introducing Downloads for You',
          style: TextStyle(
              color: kWhite, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          textAlign: TextAlign.center,
          'We\'ll download a personalised selection of \nmovies and shows for you,so there\'s\n always something to watch on your \ndevice.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        kHeight,
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: size.width * 0.383,
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
            DownloadsImageWidget(
              imageList:
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/1EnBjTJ5utgT1OXYBZ8YwByRCzP.jpg',
              margin: const EdgeInsets.only(left: 170, top: 50),
              angle: 25,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImageWidget(
              imageList:
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/1EnBjTJ5utgT1OXYBZ8YwByRCzP.jpg',
              margin: const EdgeInsets.only(right: 170, top: 50),
              angle: -20,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImageWidget(
              imageList:
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/1EnBjTJ5utgT1OXYBZ8YwByRCzP.jpg',
              margin: const EdgeInsets.only(bottom: 35, top: 50),
              size: Size(size.width * 0.4, size.width * 0.6),
              radius: 8,
            )
          ],
        ),
        //           );
        //         },
        // ),
      ],
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings_outlined,
          color: kWhite,
        ),
        kWidth,
        Text(
          'Smart Downloads',
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    this.angle = 0,
    required this.imageList,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}
