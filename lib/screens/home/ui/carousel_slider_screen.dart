import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderScreen extends StatelessWidget {
  final Size size;
  const CarouselSliderScreen({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items:  [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .5,color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://www.apple.com/v/iphone-13/j/images/meta/iphone-13_specs__bpr60apdzuaa_og.png?202311230325')
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .5,color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://www.jagranimages.com/images/newimg/06012023/06_01_2023-best_nike_shoes_23285450.jpg')
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .5,color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://www.91-cdn.com/hub/wp-content/uploads/2022/07/Top-laptop-brands-in-India.jpg')
              )
            ),
          ),
        ],
        options: CarouselOptions(
          height: size.height/4.8,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 900),
          viewportFraction: 1,
        ));
  }
}
