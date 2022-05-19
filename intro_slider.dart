// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:kpro/login.dart';
import 'package:kpro/views/home.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget {
  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "Pelatihan Sertifikasi BNSP",
        description:
            "Berisi pelatihan yang telah diakui oleh BNSP (Badan Nasional Standar Profesi)",
        pathImage: "assets/bnsp.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Pelatihan Soft Skill",
        description: "Berisi pelatihan yang dapat mengembangkan soft skill dalam berbagai bidang yang sobat inginkan",
        pathImage: "assets/softskill.png",
        backgroundColor: Color.fromARGB(255, 0, 4, 255),
      ),
    );
    slides.add(
      new Slide(
        title: "Lainnya",
        description: "Berisi berbagai macam kegiatan yang dapat soat ikuti. Mulai dari webinar, bootcamp dan masih banyak lagi",
        pathImage: "assets/lainnya.png",
        backgroundColor: Color.fromARGB(255, 0, 4, 255),
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    currentSlide.pathImage.toString(), 
                    matchTextDirection: true,
                    height: 250,
                    width: 250,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    currentSlide.title.toString(),
                    style: TextStyle(color: Color.fromARGB(255, 0, 21, 255), fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      height: 1.5,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Color.fromARGB(255, 255, 255, 255),
      renderSkipBtn: Text("Skip"),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(color: Color.fromARGB(255, 62, 109, 236)),
      ),
      renderDoneBtn: Text(
        "Login",
        style: TextStyle(color: Color.fromARGB(255, 0, 4, 255)),
      ),
      colorActiveDot: Color.fromARGB(255, 254, 0, 0),
      sizeDot: 10.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      ),
    );
  }
}
