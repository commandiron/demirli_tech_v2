import 'package:demirli_tech_v2/app_text.dart';
import 'package:demirli_tech_v2/vision.dart';
import 'package:demirli_tech_v2/vision_item.dart';
import 'package:flutter/material.dart';

import 'demirli_tech_logo.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  bool _showInfo = false;
  double _opacity = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          _opacity = 1;
        });
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(text: "Vizyon ve Uygulamalar", color: Colors.white, fontSize: 32,),
              Expanded(child: SizedBox()),
              DemirliTechLogo(),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 64),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: Vision.items.map(
                    (item) => VisionItem(
                      title: item,
                      onTap: () {
                        setState(() {
                          _showInfo = true;
                        });
                      },
                    )
                  ).toList()
                )
              ],
            ),
          ),
        ),
        if(_showInfo)
          Center(
            child: InfoCard(
              onClose: () {
                setState(() {
                  _showInfo = false;
                });
              },
            )
          )
      ],
    );
  }
}

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key, this.onClose}) : super(key: key);

  final void Function()? onClose;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {

  double _height = 0;
  double _width = 250 ;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          _height = 500;
          _width = 500;
        });
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.basic,
          child: GestureDetector(
            onTap: widget.onClose,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Card(
          elevation: 32,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: _height,
            width: _width,
            alignment: Alignment.center,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: widget.onClose,
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.error,
                    )
                  )
                ),
                const Text("Info Card"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

