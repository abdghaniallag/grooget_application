import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../presentation/main/cart/cart_page_viewmodel.dart';
import '../../presentation/product_detal/product_detal_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/usecase/cart_usecase.dart';
import '../domain/usecase/product_search_usecase.dart';
import '../app/app_preferences.dart';
import '../data/data_source/local_data_source.dart';
import '../data/data_source/remot_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository.dart';
import '../domain/usecase/forgot_password_usecase.dart';
import '../domain/usecase/homePageUsecase.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../presentation/forgot_password/forgot_password_view_model.dart';
import '../presentation/login/login_viewmodel.dart';
import '../presentation/main/categories/categories_page_viewmodel.dart';
import '../presentation/main/home/home_page_viewmodel.dart';
import '../presentation/register/registerViewModel.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // Shared Preferences
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // App Preferences
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  // Network Info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // Dio
  instance.registerLazySingleton<DioFactoy>(() => DioFactoy(instance()));
  // App Service Client
  final Dio dio = await instance<DioFactoy>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(dio, baseUrl: dio.options.baseUrl));
  // Remot Data Source
  instance.registerLazySingleton<RemotDataSource>(
      () => RemotDataSourceImpilenter(instance()));
  // local Data Source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplimenter(instance()));
  // RepositoryImpl
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initHomeModule() async {
  await initCategoryModule();
  await initProductModule();
  await initCartModule();
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));

    instance.registerFactory<HomePageViewModel>(
        () => HomePageViewModel(instance(),instance()));
  }
}

initCategoryModule() {
  if (!GetIt.I.isRegistered<CategoryUseCase>()) {
    instance
        .registerFactory<CategoryUseCase>(() => CategoryUseCase(instance()));

    instance.registerFactory<CategoriesPageViewModel>(
        () => CategoriesPageViewModel(instance()));
  }
}

initCartModule() {
  initProductModule();
  if (!GetIt.I.isRegistered<CartUseCase>()) {
    instance.registerFactory<CartUseCase>(() => CartUseCase(instance()));

    instance.registerFactory<CartPageViewModel>(
        () => CartPageViewModel(instance()));
  }
}

initProductModule() {
  if (!GetIt.I.isRegistered<ProductSearchUseCase>()) {
    instance.registerFactory<ProductSearchUseCase>(
        () => ProductSearchUseCase(instance()));
    if (GetIt.I.isRegistered<ProductDetailUseCase>()) {
      instance.registerFactory<ProductDetailViewModel>(
          () => ProductDetailViewModel(instance()));
    }
  }
  if (!GetIt.I.isRegistered<ProductDetailUseCase>()) {
    instance.registerFactory<ProductDetailUseCase>(
        () => ProductDetailUseCase(instance()));
    if (GetIt.I.isRegistered<ProductSearchUseCase>()) {
      instance.registerFactory<ProductDetailViewModel>(
          () => ProductDetailViewModel(instance()));
    }
  }
}
