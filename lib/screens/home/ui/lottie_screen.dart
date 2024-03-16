import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidgetScreen extends StatelessWidget {
  const LottieWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Container(
      height: size.height/4.5,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: .5)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
             const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('New Arrivals',style: TextStyle(fontFamily: 'hijas',fontSize: 18,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic,color: Colors.white),),
                SizedBox(height: 20,),
                Text('Smart Watches',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),),              
                Text('Flat 50% OFF',style: TextStyle(color: Colors.white),),
                Text('Launching On 25th March',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w800,color: Colors.white),),
                Text('Notify me >',style: TextStyle(color: Colors.white),)
              ],
            ),
            LottieBuilder.asset('assets/animations/Animation - 1710567675058.json',height: size.height/4.5,width: size.width/1.5,repeat: true,reverse: true,)
          ],
        ),
      ),
    );
  }
}