import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_stores/profile_store.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class DisplayNameAndEmailComponent extends ConsumerStatefulWidget {
  DisplayNameAndEmailComponent({super.key});

  final ProfileStore _store = GetIt.I.get<ProfileStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DisplayNameAndEmailComponentState();
}

class _DisplayNameAndEmailComponentState extends ConsumerState<DisplayNameAndEmailComponent> {
  @override
  void initState() {
    super.initState();
    widget._store.data = widget._store.getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  SizedBox(
      child: Column(
        children: [
          SizedBox(
            child: Text(
              widget._store.data.name ?? "",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .02,
                fontWeight: FontWeight.w700,
                color: AppThemeDesign.defaulTheme.colorScheme.background 
              ),
            ),
          ),
          Gap(size.height * .005),
          SizedBox(
            child: Text(
              widget._store.data.email ?? "",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .014,
                fontWeight: FontWeight.w400,
                color: AppThemeDesign.defaulTheme.colorScheme.background 
              ),
            ),
          ),
        ],
      ),
    );
  }
}