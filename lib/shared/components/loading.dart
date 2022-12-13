import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paypee/shared/constants/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      color: background,
      child: Center(
        child: LoadingAnimationWidget.discreteCircle(
         color: textColor100,
         secondRingColor: primaryColor,
         thirdRingColor: red100,
          size: 60),
      ),
    );
  }
}
