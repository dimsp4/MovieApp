import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 50,
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white24,
          ),
          filled: true,
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.white24),
          fillColor: Colors.white10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        onSubmitted: (value) {
          Navigator.pushNamed(context, 'search', arguments: {'movie': value});
        },
      ),
    );
  }
}
