import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';

class HeaderHomeComponent extends StatefulWidget {
  const HeaderHomeComponent(this._store, {super.key});

  final UserEntity? _store;

  @override
  State<HeaderHomeComponent> createState() => _HeaderHomeComponentState();
}

class _HeaderHomeComponentState extends State<HeaderHomeComponent> {
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
                    Visibility(
                      visible: widget._store?.profileUrl != null,
                      replacement: Container(
                        height: size.height * .1,
                        width: size.width * .15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LucideIcons.user,
                          size: size.height * .03,
                        ),
                      ),
                      child: CachedNetworkImage(
                        maxHeightDiskCache: 200,
                        imageBuilder: (_, imageProvider) => Container(
                          height: size.height * .1,
                          width: size.width * .15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        fadeOutCurve: Curves.fastEaseInToSlowEaseOut,
                        imageUrl: widget._store?.profileUrl ?? "",
                      )
                    ),
                    Gap(size.width * .02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            widget._store?.name ?? "",
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
