import 'package:dimplom/screens/homescreen/data/model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.topJopa, {super.key});
  final HomeModelTopics topJopa;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topJopa.title),
      ),
      body: Column(
        children: [
          Text(
            topJopa.category,
            style: const TextStyle(),
          ),
          Container(),
        ],
      ),
    );
  }
}
