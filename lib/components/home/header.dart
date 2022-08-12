import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome, Dhimas 👋",
              style: TextStyle(color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Let's relax and watch a movie !",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('lib/assets/profile.JPG'),
        ),
      ],
    );
  }
}
