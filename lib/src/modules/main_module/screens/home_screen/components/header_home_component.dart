import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../_stores/home_store.dart';
import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../core/presenter/utils/constants/app_image_constants.dart';

class HeaderHomeComponent extends StatefulWidget {
  HeaderHomeComponent({super.key});

  final HomeStore _store = GetIt.I.get<HomeStore>();

  @override
  State<HeaderHomeComponent> createState() => _HeaderHomeComponentState();
}

class _HeaderHomeComponentState extends State<HeaderHomeComponent> {
  @override
  void initState() {
    super.initState();
    widget._store.data = widget._store.getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .03),
        child: SizedBox(
          height: size.height * .05,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        AppImageConstants.meImage
                      ),
                    ),
                    Gap(size.width * .02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            widget._store.data.name ?? "",
                            style: AppStyleDesign.fontStyleInter(
                              context: context,
                              size: size.height * .014,
                              fontWeight: FontWeight.w500,
                              color: AppThemeDesign.defaulTheme.colorScheme.background
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            AppNameConstant.onlineText,
                            style: AppStyleDesign.fontStyleInter(
                              context: context,
                              size: size.height * .014,
                              fontWeight: FontWeight.w500,
                              color: AppThemeDesign.defaulTheme.colorScheme.primary
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                child: InkWell(
                  onTap: () => Get.toNamed(AppNameRoute.filterScreen),
                  splashColor: AppThemeDesign.defaulTheme.colorScheme.primary.withOpacity(.2),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.all(size.height * .007),
                    child: const Icon(
                      LucideIcons.listFilter
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
