import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var Slideritems = ["A", "B", "C"];
var Sliderimages = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg"
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("Home")],
                ),
                SliderView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);
    List<Widget> Sliders = new List<Widget>();

    for (int x = 0; x < Slideritems.length; x++) {
      var Slideview = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                Sliderimages[x],
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      );
      Sliders.add(Slideview);
    }
    return Container(
      width: screenWidth,
      height: screenHeight * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: Sliders,
      ),
    );
  }
}
