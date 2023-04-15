import 'package:demirli_tech_v2/config/constants.dart';
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
                  toolbarHeight: Constants.appBarHeight,
                  backgroundColor: Colors.white,
                  leading:  AppLogo(),
                  leadingWidth: 300,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: BodySection.getItems(context).where((item) => item.showButton == true).map(
                      (e) => AppTextButton(
                        text: e.title,
                        onPressed: () {
                          _controller.animateTo(
                            e.offset + Constants.appBarHeight,
                            duration: Duration(milliseconds: e.offset.toInt()),
                            curve: Curves.ease
                          );
                        },
                      ),
                    ).toList()
                  ),
                  actions: [
                    SizedBox(width: 300,)
                  ],
                ),
                SliverToBoxAdapter(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: BodySection.getItems(context).map(
                      (item)  {
                        return Container(
                          height: item.screenHeight,
                          color: item.color,
                          child: Center(child: Text(item.title),),
                        );
                      }
                    ).toList()
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
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: IntrinsicWidth(
          child: Column(
            children: [
              const Divider(color: Colors.transparent),
              Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              AnimatedOpacity(
                opacity: _isOnHover ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,)
              )
            ],
          ),
        )
      ),
    );
  }
}

class BodySection{
  BodySection(
    {
      required this.title,
      required this.screenHeight,
      required this.offset,
      required this.color,
      this.showButton = true,
    }
  );

  final String title;
  final double screenHeight;
  final double offset;
  final Color color;
  final bool showButton;
  
  static List<BodySection> getItems(BuildContext context) {
    return [
      BodySection(title: "Welcome", screenHeight: 960, offset: 0, color: Colors.purple, showButton: false),
      BodySection(title: "About", screenHeight: 360, offset: 960, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Products", screenHeight: 960, offset: 960+360, color: Theme.of(context).colorScheme.secondaryContainer),
      BodySection(title: "Our Vision", screenHeight: 720, offset: 960+360+960, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Contact us", screenHeight: 360, offset: 960+360+960+720, color: Theme.of(context).colorScheme.secondaryContainer),
      BodySection(title: "Copyright Footer", screenHeight: 45, offset: 960+360+960+720+360, color: Theme.of(context).colorScheme.primaryContainer, showButton: false),
    ];
  }
}