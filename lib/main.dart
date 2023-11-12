import 'package:alpha_system/domain/models/farm_list/farm_list.dart';
import 'package:alpha_system/presentation/core/app.dart';
import 'package:alpha_system/presentation/core/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(FarmListAdapter());
  runApp(const AppBuilder());
}
