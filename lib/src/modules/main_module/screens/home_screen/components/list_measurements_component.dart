import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'list_data_component.dart';
import 'list_empty_component.dart';
import 'list_loading_component.dart';
import '../../../_stores/home_store.dart';
import '../../../../../core/domain/entities/blood_pressuse_entity.dart';

class ListMeasurementsComponent extends ConsumerStatefulWidget {
  ListMeasurementsComponent({super.key});

  final HomeStore _store = GetIt.I.get<HomeStore>(); 

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListMeasurementsComponentState();
}

class _ListMeasurementsComponentState extends ConsumerState<ListMeasurementsComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder<List<BloodPressureEntity>>(
        future: widget._store.allMeasurements(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ListLoadingComponent();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const ListEmptyComponent();
          } else {
            return ListDataComponent(snapshot);
          }
        }
      )
    );
  }
}