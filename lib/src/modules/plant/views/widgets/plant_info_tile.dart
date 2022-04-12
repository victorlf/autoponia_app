import 'package:flutter/material.dart';

class PlantInfoTile extends StatelessWidget {
  final String title;
  final String content;
  const PlantInfoTile({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: ListTile(
        tileColor: Colors.grey,
        leading: Text('$title:'),
        title: Text(content),
      ),
    );
  }
}
