import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';

class AnimationImageBPMComponent extends StatelessWidget {
  const AnimationImageBPMComponent(this.args, {super.key});

  final BloodPressureEntity args;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * .67),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                child: LottieBuilder.asset(
                  "assets/lottie/NOHUjMzKaB.json",
                  animate: true,
                  fit: BoxFit.cover,
                  height: size.height * .3,
                ),
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      args.measurementValue.toString(),
                      style: AppStyleDesign.fontStyleInter(
                        context: context,
                        size: size.height * .04,
                        fontWeight: FontWeight.bold 
                      ),
                    ),
                    Text(
                      args.unity,
                      style: AppStyleDesign.fontStyleInter(
                        context: context,
                        size: size.height * .03,
                        fontWeight: FontWeight.bold 
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
