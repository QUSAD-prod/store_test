import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_test/my_app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final talker = TalkerFlutter.init();
      GetIt.I.registerSingleton(talker);
      GetIt.I<Talker>().debug('Talker started...');

      Bloc.observer = TalkerBlocObserver(
        talker: GetIt.I<Talker>(),
        settings: const TalkerBlocLoggerSettings(),
      );

      FlutterError.onError = (details) {
        GetIt.I<Talker>().handle(details.exception, details.stack);
      };

      await Hive.initFlutter();
      return const MyApp();
    },
    (error, stackTrace) {
      GetIt.I<Talker>().handle(error, stackTrace);
    },
  );
}
