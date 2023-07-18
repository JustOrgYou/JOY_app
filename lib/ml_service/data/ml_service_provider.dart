import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/ml_service/data/ml_service_v0.dart';
import 'package:todo_app/ml_service/domain/ml_service.dart';
import 'package:todo_app/network/data/network_providers.dart';
import 'package:todo_app/shared/data/config_providers.dart';

// part 'ml_service_provider.g.dart';

final mlServiceProvider = Provider<MlService>((ref) {
  final appConfig = ref.watch(appConfigProvider);
  final dio = Dio(
    ref.watch(dioProvider).options.copyWith(
          baseUrl: appConfig.mlUrl,
        ),
  );
  return MlServiceV0(dio: dio);
});
