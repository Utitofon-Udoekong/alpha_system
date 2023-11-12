import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:flutter/material.dart';

/// Hero Image widget
class HeroImage extends StatelessWidget {
  ///Constructor
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              minWidth:  180,
              maxWidth: getMaxWidth(context),
            ),
            alignment: Alignment.center,
            child: Image.asset(Images.logo),
          ),
        ),
      ],
    );
  }

  /// CALCULATES THE MAXIMUM WIDTH THE IMAGE SHOULD OCCUPY
  /// BASED ON SCREEN SIZE
  double getMaxWidth(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    if(width > 600){
      return 300;
    }else if(width > 400){
      return 250;
    }else{
      return 180;
    }
  }
}