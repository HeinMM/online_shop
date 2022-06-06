import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';

class CarousalSlider extends StatefulWidget {
  const CarousalSlider({Key? key}) : super(key: key);

  @override
  _CarousalSliderState createState() => _CarousalSliderState();
}

class _CarousalSliderState extends State<CarousalSlider> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          
          height: 200,
          width: double.infinity,
          child: Carousel(
            dotSize: 4,
            dotSpacing: 15,
            dotColor: Colors.white12,
            dotIncreasedColor: Colors.pink,
            indicatorBgPadding: 5,
            dotBgColor: Colors.transparent,
            dotVerticalPadding: 5.0,
            dotPosition: DotPosition.bottomRight,
            autoplay: false,
            images: [
              Image.asset(
                'assets/images/NatureRe1.jpg',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/innisfree2.jpg',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/innisfree1.jpg',
                fit: BoxFit.fill,
              ),
            ],
          ),
        )
      ],
    );
  }
}
