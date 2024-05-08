import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String img;
  String title;
  String desc;

  CategoryCard(
      {super.key, required this.img, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 160,
              width: MediaQuery.of(context).size.width,
              child: Image.network(img),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
