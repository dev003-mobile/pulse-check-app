import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/profile_store.dart';
import '../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/utils/constants/app_image_constants.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/info_profile_data_widget.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/providers/module_providers/profile_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  ProfileScreen({super.key});

  final ProfileStore _store = GetIt.I.get<ProfileStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(buttonEndSessionStateProvider);
    return SizedBox(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * .04),
                    child: CircleAvatar(
                      radius: size.height * .035,
                      backgroundImage: AssetImage(AppImageConstants.meImage),
                    ),
                  ),
                ),
                Gap(size.height * .015),
                SizedBox(
                  child: Text(
                    "Wagner Coche",
                    style: AppStyleDesign.fontStyleInter(
                      context: context,
                      size: size.height * .02,
                      fontWeight: FontWeight.w700,
                      color: AppThemeDesign.defaulTheme.colorScheme.background 
                    ),
                  ),
                ),
                Gap(size.height * .04),
                Container(
                  width: size.width,
                  height: size.height * .001,
                  color: AppThemeDesign.defaulTheme.colorScheme.onBackground,
                ),
                Gap(size.height * .04),
                const SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InfoProfileDataWidget(),
                      InfoProfileDataWidget()
                    ],
                  ),
                ),
                Gap(size.height * .04),
                TextFieldDefaultWidget(
                  hintText: AppNameConstant.emailText,
                ),
                Gap(size.height * .04),
                TextFieldDefaultWidget(
                  hintText: AppNameConstant.emailText,
                ),
                Gap(size.height * .04),
                TextFieldDefaultWidget(
                  hintText: AppNameConstant.emailText,
                ),
                Gap(size.height * .04),
                SizedBox(
                  child: ButtonOpacityWidget(
                    textButton: AppNameConstant.signOutText,
                    provider: buttonUdpdateUserStateProvider,
                    onTap: () async {
                      ref.read(buttonEndSessionStateProvider.notifier).state = true;
                      await widget._store.endSession().then((_) => Get.offAllNamed(AppNameRoute.signInScreen));
                      ref.read(buttonEndSessionStateProvider.notifier).state = false;
                    },
                    backgroundColor: AppThemeDesign.defaulTheme.colorScheme.error,
                    isLoading: ref.read(buttonEndSessionStateProvider.notifier).state,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}