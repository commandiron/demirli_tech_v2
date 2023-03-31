import 'package:flutter/material.dart';

class DemirliTechLogo extends StatelessWidget {
  const DemirliTechLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 42,
          child: Text("from", style: TextStyle(color: Colors.grey, fontSize: 16),)
        ),
        Image.asset("assets/images/demirli_tech_text_logo_white.png"),
        const SizedBox(width: 42,),
      ],
    );
  }
}
