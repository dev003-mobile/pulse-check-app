import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_stores/profile_store.dart';
import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_image_constants.dart';

class HeaderComponent extends ConsumerStatefulWidget {
  HeaderComponent({super.key});

  final ProfileStore _store = GetIt.I.get<ProfileStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends ConsumerState<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .04),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: size.height * .035,
              backgroundImage: AssetImage(AppImageConstants.meImage),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () async => await widget._store.endSession().then((_) => 
                  Get.offAllNamed(AppNameRoute.signInScreen)
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(size.height * .008),
                  child: Icon(
                    LucideIcons.logOut,
                    size: size.height * .025,
                    color: AppThemeDesign.defaulTheme.colorScheme.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}