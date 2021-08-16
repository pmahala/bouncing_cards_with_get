import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String urlImage;
  final String subtitle;
  final Color color;

  CardWidget(
      {required this.color,
      required this.title,
      required this.urlImage,
      required this.subtitle,
      required this.description});

  Widget buildImage() {
    return Image.asset(
      urlImage,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget buildText() {
    return Container(
      padding: EdgeInsets.all(16),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: StadiumBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: buildImage(),
            ),
            Expanded(
              child: buildText(),
            ),
          ],
        ),
      ),
    );
  }
}
