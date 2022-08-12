import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryBox(
                title: "Romance",
                emote: "😍",
                id: '10749',
              ),
              CategoryBox(
                title: "Comedy",
                emote: "😁",
                id: '35',
              ),
              CategoryBox(
                title: "Horror",
                emote: "😱",
                id: '27',
              ),
              CategoryBox(
                title: "Drama",
                emote: "😚",
                id: '18',
              ),
              //😍😁😱😚
            ],
          )
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required this.emote,
    required this.title,
    required this.id,
  }) : super(key: key);

  final String emote, title, id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'genre', arguments: {'name': title, 'idGenre': id},);
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                emote,
                style: const TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
