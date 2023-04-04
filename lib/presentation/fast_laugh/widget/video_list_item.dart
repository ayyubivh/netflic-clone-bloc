// import 'package:flutter/material.dart';
// import 'package:netflix_clone/core/colors/colors.dart';
// import 'package:netflix_clone/presentation/search/widget/search_result.dart';

// class VideoListItemInheritedWidget extends InheritedWidget {
//   final Widget widget;
//   final Downloads movieData;

//   const VideoListItemInheritedWidget(
//       {super.key, required this.widget, required this.movieData})
//       : super(child: widget);

//   @override
//   bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
//     return oldWidget.movieData != movieData;
//   }

//   static VideoListItemInheritedWidget? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
//   }
// }

// class Downloads {}

// class VideoListItem extends StatelessWidget {
//   const VideoListItem({super.key, required this.index});
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final posterPath =
//         VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
//     final videoUrl = Colors.accents[index % Colors.accents.length];
//     return Stack(
//       children: [
//         // FastLaughVideoPlayer(
//         //   videoUrl: videoUrl,
//         //   onStateChange: (bool) {},
//         // ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 //left side
//                 CircleAvatar(
//                   radius: 26,
//                   backgroundColor: Colors.black.withOpacity(.5),
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.volume_up_outlined,
//                       color: kWhite,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 //right side
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 13),
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage:
//                             posterPath == null ? null : NetworkImage(imageurl),
//                       ),
//                     ),
//                     // ValueListenableBuilder(
//                     // valueListenable: likedVideoIdsNotifier,
//                     // builder: (context, Set<int> newLikedListIds, Widget? _) {
//                     //   final _index = index;
//                     //   if (newLikedListIds.contains(_index)) {
//                     //     return GestureDetector(
//                     // onTap: () {
//                     // BlocProvider.of<FastLaughBloc>(context)
//                     //     .add(UnlikedVideo(id: _index));
//                     // likedVideoIdsNotifier.value.remove(_index);
//                     // likedVideoIdsNotifier.notifyListeners();
//                     // },
//                     // child: const VideoActionsWidget(
//                     //   icon: Icons.favorite,
//                     //   title: "Liked",
//                     //   ),
//                     // );
//                     //     // }
//                     //     return GestureDetector(
//                     //       onTap: () {
//                     //         // BlocProvider.of<FastLaughBloc>(context)
//                     //         //     .add(LikedVideo(id: _index));
//                     //         // likedVideoIdsNotifier.value.add(_index);
//                     //         // likedVideoIdsNotifier.notifyListeners();
//                     //       },
//                     //       child: const VideoActionsWidget(
//                     //         icon: Icons.emoji_emotions,
//                     //         title: "LoL",
//                     //       ),
//                     //     );
//                     //   },
//                     // ),
//                     // const VideoActionsWidget(
//                     //   icon: Icons.add,
//                     //   title: "My List",
//                     // ),
//                     GestureDetector(
//                       onTap: () {
//                         // final movieName =
//                         //     VideoListItemInheritedWidget.of(context)
//                         //         ?.movieData
//                         //         .posterPath;
//                         // if (movieName != null) {
//                         //   // Share.share(movieName);
//                         // }
//                       },
//                       child: const VideoActionsWidget(
//                         icon: Icons.send_outlined,
//                         title: "Share",
//                       ),
//                     ),
//                     const VideoActionsWidget(
//                       icon: Icons.play_arrow,
//                       title: "Play",
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class VideoActionsWidget extends StatelessWidget {
//   const VideoActionsWidget(
//       {super.key, required this.icon, required this.title});
//   final IconData icon;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: Column(
//         children: [
//           Icon(
//             icon,
//             color: kWhite,
//             size: 30,
//           ),
//           Text(
//             title,
//             style: const TextStyle(color: kWhite, fontSize: 16),
//           )
//         ],
//       ),
//     );
//   }
// }

// // class FastLaughVideoPlayer extends StatefulWidget {
// //   final String videoUrl;
// //   final void Function(bool isPlaying) onStateChange;
// //   const FastLaughVideoPlayer(
// //       {super.key, required this.videoUrl, required this.onStateChange});

// //   @override
// //   State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
// // }

// // class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
//   // late VideoPlayerController _videoPlayerController;

//   // @override
//   // void initState() {
//   //   _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
//   //   _videoPlayerController.initialize().then((value) {
//   //     setState(() {
//   //       _videoPlayerController.play();
//   //     });
//   //   });
//   //   super.initState();
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return SizedBox(
//   //     height: double.infinity,
//   //     width: double.infinity,
//   //     child: _videoPlayerController.value.isInitialized
//   //         ? AspectRatio(
//   //             aspectRatio: _videoPlayerController.value.aspectRatio,
//   //             child: VideoPlayer(_videoPlayerController),
//   //           )
//   //         : const Center(
//   //             child: CircularProgressIndicator(
//   //               strokeWidth: 2,
//   //             ),
//   //           ),
//   //   );
//   // }

//   // @override
//   // void dispose() {
//   //   _videoPlayerController.dispose();
//   //   super.dispose();
//   // }

