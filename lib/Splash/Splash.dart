    import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:freelance2/Registration/Login.dart';
import 'package:freelance2/Splash/Login&Registrationpage.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  SwiperController _controller = SwiperController();

  int _currentIndex = 0;
  final List<String> titles = [
    "WELLCOME TO LAYBULL",
    "Explore Items Uploaded Daily",
    "Guaranteed Authentic ",
    "Our Locations",
  ];
  final List<String> subtitles = [
    "The Middle East's marketplace for buying & selling the most sought-after fashion items",
    "Shop the latest and rarest items new & used. ",
    "All items are sent to Laybull's authentication team before being shipped to you",
    "United Arab Emirates, Saudi Arabia, Oman, India, Bahrain, Kuwait, Lebanon, Jordan & Israel",
  ];
  final List<String> image=
  [
    'Page1.png',
    'page2.png',
    'page3.png',
    'page4.png',
  ];
  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  final _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            //   child: Card(
            //     elevation: 4,
            //     child: Container(
            //       height: 50,
            //       width: MediaQuery.of(context).size.width,
            //       color: Colors.black,
            //       child: Center(
            //         child: Text(
            //           'Get Started',
            //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: InkWell(
                onTap: ()
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => LoginPage()));
                },
                child: Card(
                  elevation: 4,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white10,
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: true,
            autoplay: true,

            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.black,
                activeSize: 8.0,

              ),
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return IntroItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: colors[index],
                imageUrl: "assets/"+image[index],
              );
            },
          ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: FlatButton(
          //     child: Text("Skip"),
          //     onPressed: () {},
          //   ),
          // ),

        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bg;
  final String imageUrl;

  const IntroItem(
      {Key key, @required this.title, this.subtitle, this.bg, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              //const SizedBox(height: 40.0),
              Container(
                height: 350,
                // margin: const EdgeInsets.only(bottom: 170),
                width: 400,

                decoration: BoxDecoration(
                  // color: Colors.green.withOpacity(.5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Container(
//                    height: 50,
//                    width: 50,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          image: AssetImage(
                            imageUrl,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/1.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Center(
                    child: Text(
                      title,
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          wordSpacing: 1,
                          fontSize: 26.0,
                          color: Colors.black87),
                    ),
                  ),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      subtitle,
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}