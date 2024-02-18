import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/profile_store.dart';
import 'components/header_component.dart';
import 'components/display_name_component.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/loading_card_widget.dart';
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
  void initState() {
    super.initState();
    widget._store.data = widget._store.getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(buttonEndSessionStateProvider);
    ref.watch(buttonUpdateUserStateProvider);
    return SizedBox(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderComponent(),
                Gap(size.height * .015),
                DisplayNameAndEmailComponent(),
                Gap(size.height * .04),
                Container(
                  width: size.width,
                  height: size.height * .001,
                  color: AppThemeDesign.defaulTheme.colorScheme.onBackground,
                ),
                Gap(size.height * .04),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FutureBuilder(
                        future: widget._store.getTotalBPM(widget._store.data.uid!),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const LoadingCardWidget();
                          } else {
                            return InfoProfileDataWidget(
                              value: snapshot.data.toString(),
                              description: AppNameConstant.totalBPM,
                            );
                          }
                        }
                      ),
                      FutureBuilder(
                        future: widget._store.getCountMeasurement(widget._store.data.uid!),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const LoadingCardWidget();
                          } else {
                            return InfoProfileDataWidget(
                              value: snapshot.data.toString(),
                              description: AppNameConstant.measurementsText,
                            );
                          }
                        }
                      )
                    ],
                  ),
                ),
                Gap(size.height * .04),
                TextFieldDefaultWidget(
                  readOnly: true,
                  hintText: widget._store.data.name ?? "",
                ),
                Gap(size.height * .04),
                TextFieldDefaultWidget(
                  readOnly: true,
                  hintText: widget._store.data.email ?? "",
                ),
                Gap(size.height * .04),
                TextFieldDefaultWidget(
                  readOnly: true,
                  hintText: widget._store.data.uid ?? "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}