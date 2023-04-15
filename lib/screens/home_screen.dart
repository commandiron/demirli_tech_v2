import 'package:demirli_tech_v2/widgets/demirli_tech_logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController _controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: _controller,
              slivers: [
                SliverAppBar(
                  pinned: false,
                  snap: true,
                  floating: true,
                  toolbarHeight: 100,
                  backgroundColor: Colors.white,
                  leading:  AppLogo(),
                  leadingWidth: 300,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextButton(text: "About"),
                      AppTextButton(text: "Products"),
                      AppTextButton(text: "Our Vision"),
                      AppTextButton(text: "Contact us"),
                    ],
                  ),
                  actions: [
                    SizedBox(width: 300,)
                  ],
                ),
                SliverToBoxAdapter(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //Welcome
                      Container(
                        height: 720,
                        color: Colors.purple,
                        child: Center(child: Text("Welcome"),),
                      ),
                      //About
                      Container(
                        height: 360,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: Center(child: Text("About"),),
                      ),
                      //Products
                      Container(
                        height: 720,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Center(child: Text("Products"),),
                      ),
                      //Our Vision
                      Container(
                        height: 360,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: Center(child: Text("Our Vision"),),
                      ),
                      //Contact Us
                      Container(
                        height: 360,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Center(child: Text("Contact Us"),),
                      ),
                    ]
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}

class AppTextButton extends StatefulWidget {
  const AppTextButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {

  bool _isOnHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () {
          if(widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        onHover: (value) {
          setState(() {
            _isOnHover = value;
          });
        },
        hoverColor: Colors.transparent,
        child: IntrinsicWidth(
          child: Column(
            children: [
              if(_isOnHover)
                Divider(color: Colors.transparent),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              if(_isOnHover)
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,)
            ],
          ),
        )
      ),
    );
  }
}




