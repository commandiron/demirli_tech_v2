import 'package:flutter/material.dart';

import '../widgets/app_text.dart';
import '../widgets/demirli_tech_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      AppText(text: "Uygulamalarımız", fontSize: 32,),
                      SizedBox(height: 16,),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          ApplicationItem(),
                          ApplicationItem(),
                          ApplicationItem(),
                          ApplicationItem(),
                          ApplicationItem(),
                          ApplicationItem(),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Expanded(
                        child: Container(
                          width: 600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AppText(text: "İletişim", fontSize: 16,),
                            SizedBox(height: 16,),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                ContactItem(),
                                ContactItem(),
                                ContactItem(),
                                ContactItem(),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AppLogo(width: 120,),
                        ),
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: 50,
        height: 50,
      ),
    );
  }
}


class ApplicationItem extends StatelessWidget {
  const ApplicationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}

