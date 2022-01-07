import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              margin: const EdgeInsets.all(10),
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            title: Text(title),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: 3);
  }
}
