import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';

class MainPageBot extends StatefulWidget {
  const MainPageBot({super.key});

  @override
  State<MainPageBot> createState() => _MainPageBotState();
}

class _MainPageBotState extends State<MainPageBot> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              ListTile(
                title: Lottie.asset('assets/images/120064-shape-animation.json'),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: LikeButton(
                    size: 20,
                    circleColor: const CircleColor(
                        start: Colors.red,
                        end: Colors.red),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 20,
                      );
                    },
                    likeCount: 0,
                  ),
                ),
              ),
              ListTile(
                title: Lottie.asset('assets/images/120240-geometrical-animation.json'),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: LikeButton(
                    size: 20,
                    circleColor: const CircleColor(
                        start: Colors.red,
                        end: Colors.red),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 20,
                      );
                    },
                    likeCount: 0,
                  ),
                ),
              ),
              ListTile(
                title: Lottie.asset("assets/images/121969-ball-circular-motion.json"),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: LikeButton(
                    size: 20,
                    circleColor: const CircleColor(
                        start: Colors.red,
                        end: Colors.red),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 20,
                      );
                    },
                    likeCount: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}