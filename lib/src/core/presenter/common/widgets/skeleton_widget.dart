import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../design/app_theme_design.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .03),
      child: SizedBox(
        width: size.width,
        height: size.height * .12,
        child: Row(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width * .3,
              decoration: BoxDecoration(
                color: AppThemeDesign.defaulTheme.colorScheme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
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
            ),
            Gap(size.width * .02),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height * .018,
                    decoration: BoxDecoration(
                      color: AppThemeDesign.defaulTheme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                  ),
                  Container(
                    width: size.width,
                    height: size.height * .018,
                    decoration: BoxDecoration(
                      color: AppThemeDesign.defaulTheme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                  ),
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: size.height * .018,
                            decoration: BoxDecoration(
                              color: AppThemeDesign.defaulTheme.colorScheme.surface,
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                          ),
                        ),
                        Gap(size.width * .02),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: size.height * .018,
                            decoration: BoxDecoration(
                              color: AppThemeDesign.defaulTheme.colorScheme.surface,
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}
