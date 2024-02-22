import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../_stores/profile_store.dart';
import '../../../../../core/presenter/providers/global_providers.dart';
import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class HeaderComponent extends ConsumerStatefulWidget {
  HeaderComponent({super.key});

  final ProfileStore _store = GetIt.I.get<ProfileStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HeaderComponentState();
}

class _HeaderComponentState extends ConsumerState<HeaderComponent> {
  @override
  void initState() {
    super.initState();
    widget._store.data = widget._store.getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(currentIndexProvider);
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .04),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Visibility(
              visible: widget._store.data.profileUrl != null,
              replacement: Container(
                height: size.height * .1,
                width: size.width * .15,
                decoration: BoxDecoration(
                  color: AppThemeDesign.defaulTheme.colorScheme.primary.withOpacity(.2),
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
                imageUrl: widget._store.data.profileUrl ?? "",
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () async => await widget._store.endSession().then((_) {
                  ref.read(currentIndexProvider.notifier).state = 0;
                  Get.offAllNamed(AppNameRoute.signInScreen);
                }),
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
