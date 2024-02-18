import 'package:blood_pressure_measurement/src/core/presenter/common/routes/app_name_route.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class ListDataComponent extends StatefulWidget {
  const ListDataComponent(this.snapshot, {super.key});

  final AsyncSnapshot<List<BloodPressureEntity>> snapshot;

  @override
  State<ListDataComponent> createState() => _ListDataComponentState();
}

class _ListDataComponentState extends State<ListDataComponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: widget.snapshot.data!.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: size.height * .02),
      itemBuilder: (_, index) => GestureDetector(
        onTap: () => Get.toNamed(
          AppNameRoute.measurementDetailsScreen,
          arguments: widget.snapshot.data?[index]
        ),
        child: Container(
          width: size.width,
          height: size.height * .1,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          widget.snapshot.data?[index].measurementValue.toString() ?? "",
                          style: AppStyleDesign.fontStyleInter(
                            context: context,
                            size: size.height * .034,
                            fontWeight: FontWeight.bold,
                            color: AppThemeDesign.defaulTheme.colorScheme.background 
                          ),
                        ),
                      ),
                      Gap(size.width * .04),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              LucideIcons.heartPulse,
                              size: size.height * .02,
                              color: AppThemeDesign.defaulTheme.colorScheme.primary,
                            ),
                            Text(
                              widget.snapshot.data?[index].unity ?? "",
                              style: AppStyleDesign.fontStyleInter(
                                context: context,
                                size: size.height * .02,
                                fontWeight: FontWeight.w600,
                                color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.snapshot.data?[index].measurementDescriptionDate ?? "",
                        style: AppStyleDesign.fontStyleInter(
                          context: context,
                          size: size.height * .012,
                          fontWeight: FontWeight.w400,
                          color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                        ),
                      ),
                      Text(
                        widget.snapshot.data?[index].measurementTime ?? "",
                        style: AppStyleDesign.fontStyleInter(
                          context: context,
                          size: size.height * .012,
                          fontWeight: FontWeight.w400,
                          color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .012),
                          child: Text(
                            "última medição",
                            style: AppStyleDesign.fontStyleInter(
                              context: context,
                              size: size.height * .012,
                              fontWeight: FontWeight.w600,
                              color: AppThemeDesign.defaulTheme.colorScheme.background 
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}