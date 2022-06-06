import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyBanner extends StatefulWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  _MyBannerState createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  List? images = ['assets/images/banner1.jpg', 'assets/images/banner2.jpg'];
  

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: EdgeInsets.all(15),
  child: CarouselSlider.builder(
    itemCount: images!.length,
    options: CarouselOptions(
      enlargeCenterPage: true,
      height: 250,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      reverse: false,
      aspectRatio: 5.0,
    ),
    itemBuilder: (context, i, id){
      //for onTap to redirect to another screen
      return GestureDetector(
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white,)
        ),
          //ClipRRect for image border radius
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              images![i],
            width: 500,
            fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: (){
          var url = images![i];
          print(url.toString());
        },
      );
    },
  ),
);
  }
}
