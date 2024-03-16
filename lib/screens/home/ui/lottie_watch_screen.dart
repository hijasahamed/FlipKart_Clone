import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidgetScreen extends StatelessWidget {
  final Size size;
  const LottieWidgetScreen({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height/4.5,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: .5)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('New Arrivals',style: TextStyle(fontFamily: 'hijas',fontSize: 18,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic,color: Colors.white),),
                SizedBox(height:size.height/50,),
                const Text('Smart Watches',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),),              
                const Text('Flat 50% OFF',style: TextStyle(color: Colors.white),),
                const Text('Launching On 25th March',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w800,color: Colors.white),),
                const Text('Notify me >',style: TextStyle(color: Colors.white),)
              ],
            ),
            LottieBuilder.asset('assets/animations/Animation - 1710567675058.json',height: size.height/4.5,width: size.width/1.5,repeat: true,reverse: true,)
          ],
        ),
      ),
    );
  }
}