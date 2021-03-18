import 'package:get_it/get_it.dart';
import 'package:temur_tuzuklari/services/storage_service_impl.dart';
import 'storage_service.dart';

  GetIt locator = GetIt.instance;

  setupServiceLocator() {
    locator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  }
