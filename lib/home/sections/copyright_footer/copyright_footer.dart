import 'package:flutter/material.dart';

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.2
        )
      ),
    );
  }
}
