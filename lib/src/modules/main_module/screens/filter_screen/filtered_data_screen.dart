import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/presenter/common/widgets/list_empty_widget.dart';
import 'components/list_data_component.dart';
import 'components/description_filter_component.dart';
import '../../../../core/domain/entities/blood_pressuse_entity.dart';

class FilteredDataScreen extends StatefulWidget {
  const FilteredDataScreen({super.key});

  @override
  State<FilteredDataScreen> createState() => _FilteredDataScreenState();
}

class _FilteredDataScreenState extends State<FilteredDataScreen> {
  final _args = Get.arguments as List<BloodPressureEntity>;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .03,
            horizontal: size.width * .04
          ),
          child: Column(
            children: <Widget>[
              const Expanded(
                flex: 0,
                child: DescriptionFilterComponent(
                  firstWord: "Lista de medições ",
                  secondWord: "filtradas",
                )
              ),
              Gap(size.height * .02),
              Expanded(
                flex: 1,
                child: Visibility(
                  visible: _args.isEmpty,
                  replacement: ListFilterDataComponent(_args),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * .15),
                    child: const ListEmptyWidget(),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
