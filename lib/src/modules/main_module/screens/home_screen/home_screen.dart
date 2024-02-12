import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presenter/common/design/app_theme_design.dart';
import 'components/card_date_component.dart';
import 'components/header_home_component.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Column(
            children: <Widget>[
              const HeaderHomeComponent(),
              Gap(size.height * .04),
              const CardDateComponent(),
              Gap(size.height * .02),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 20,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: size.height * .02),
                  itemBuilder: (_, index) => Container(
                    width: size.width,
                    height: size.height * .11,
                    margin: EdgeInsets.only(bottom: size.height * .02),
                    decoration: BoxDecoration(
                      color: AppThemeDesign.defaulTheme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.05)
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 10,
                          color: AppThemeDesign.defaulTheme.colorScheme.onBackground.withOpacity(.02)
                        )
                      ]
                    ), 
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
