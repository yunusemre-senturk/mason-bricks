// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i7;
import 'package:dio/dio.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i10;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:network_info_plus/network_info_plus.dart' as _i20;
import 'package:package_info_plus/package_info_plus.dart' as _i21;
import 'package:{{projectName.snakeCase()}}/app/data/repository/auth_repository.dart' as _i36;
import 'package:{{projectName.snakeCase()}}/app/data/repository/feedback_repository.dart' as _i42;
import 'package:{{projectName.snakeCase()}}/app/data/repository/file_manager_repository.dart' as _i44;
import 'package:{{projectName.snakeCase()}}/app/data/repository/great_ideas_repository.dart' as _i14;
import 'package:{{projectName.snakeCase()}}/app/data/repository/pdks_repository.dart' as _i62;
import 'package:{{projectName.snakeCase()}}/app/data/repository/school_recommendation_repository.dart'
    as _i23;
import 'package:{{projectName.snakeCase()}}/app/data/repository/vacations_repository.dart' as _i32;
import 'package:{{projectName.snakeCase()}}/app/data/service/api_service.dart' as _i3;
import 'package:{{projectName.snakeCase()}}/app/page/app/app_vm.dart' as _i34;
import 'package:{{projectName.snakeCase()}}/app/page/auth/forgot/forgot_password_vm.dart' as _i47;
import 'package:{{projectName.snakeCase()}}/app/page/auth/login/login_vm.dart' as _i54;
import 'package:{{projectName.snakeCase()}}/app/page/auth/register/register_vm.dart' as _i65;
import 'package:{{projectName.snakeCase()}}/app/page/auth/validation/validation_vm.dart' as _i75;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/add_document/add_document_vm.dart'
    as _i76;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/add_folder_to_center/add_folder_to_center.vm.dart'
    as _i77;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/file_manager_vm.dart' as _i45;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/manager/document/document_vm.dart'
    as _i55;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/manager/template/template_vm.dart'
    as _i19;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/template/detail/detail_vm.dart'
    as _i73;
import 'package:{{projectName.snakeCase()}}/app/page/file_manager/template/template_vm.dart' as _i74;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/comment/great_ideas_comment_vm.dart'
    as _i48;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/create_or_update/great_ideas_create_or_update.vm.dart'
    as _i15;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/details/details_idea_page.vm.dart'
    as _i51;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/filtered/filtered_ideas.vm.dart'
    as _i46;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/great_ideas/great_ideas.vm.dart'
    as _i49;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/search_idea/search_idea.vm.dart'
    as _i25;
import 'package:{{projectName.snakeCase()}}/app/page/great_ideas/the_sound_of_the_field/the_sound_of_the_field.vm.dart'
    as _i31;
import 'package:{{projectName.snakeCase()}}/app/page/home/home_vm.dart' as _i50;
import 'package:{{projectName.snakeCase()}}/app/page/koctas_apps/koctas_app.vm.dart' as _i17;
import 'package:{{projectName.snakeCase()}}/app/page/{{projectName.snakeCase()}}/{{projectName.snakeCase()}}.vm.dart' as _i63;
import 'package:{{projectName.snakeCase()}}/app/page/school_recommendation/admin/filter/filter_vm.dart'
    as _i67;
import 'package:{{projectName.snakeCase()}}/app/page/school_recommendation/admin/form_detail/form_detail_vm.dart'
    as _i66;
import 'package:{{projectName.snakeCase()}}/app/page/school_recommendation/admin/list/list_vm.dart'
    as _i22;
import 'package:{{projectName.snakeCase()}}/app/page/school_recommendation/form/form_vm.dart' as _i68;
import 'package:{{projectName.snakeCase()}}/app/page/school_recommendation/list/list_vm.dart' as _i24;
import 'package:{{projectName.snakeCase()}}/app/page/settings/feedback/feedback.vm.dart' as _i43;
import 'package:{{projectName.snakeCase()}}/app/page/settings/settings.vm.dart' as _i69;
import 'package:{{projectName.snakeCase()}}/app/page/splash/splash_vm.dart' as _i26;
import 'package:{{projectName.snakeCase()}}/app/page/vacation/vacation.vm.dart' as _i33;
import 'package:{{projectName.snakeCase()}}/core/di/module.dart' as _i78;
import 'package:{{projectName.snakeCase()}}/core/manager/geo_manager.dart' as _i12;
import 'package:{{projectName.snakeCase()}}/core/source/app_config_remote.dart' as _i6;
import 'package:{{projectName.snakeCase()}}/core/source/encrypt_storage.dart' as _i41;
import 'package:{{projectName.snakeCase()}}/core/source/local_data_source.dart' as _i18;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/data/repository/store_employee_repository.dart'
    as _i27;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/data/service/store_employee_service.dart'
    as _i5;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/appointing_a_proxy/appointin_a_proxy_vm.dart'
    as _i35;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/home/home_vm.dart'
    as _i9;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/job_add_delay/job_add_delay_vm.dart'
    as _i52;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/my_works/deadlineRequest/deadline_request_vm.dart'
    as _i37;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/my_works/my_works_vm.dart'
    as _i59;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/notification/notification_vm.dart'
    as _i39;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/store_search/store_search.vm.dart'
    as _i30;
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/page/stores/stores_vm.dart'
    as _i40;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/data/repository/store_job_repository.dart'
    as _i28;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/data/repository/store_repository.dart'
    as _i29;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/data/service/store_api_service.dart'
    as _i4;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/deadline/deadline_vm.dart'
    as _i38;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/deadline/possible_deadline_change/possible_deadline_change_vm.dart'
    as _i64;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/general_works/general_works_vm.dart'
    as _i56;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/job_delay/job_delay_vm.dart'
    as _i16;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/job_postponing/job_postponing_vm.dart'
    as _i53;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/notification/notification_vm.dart'
    as _i61;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/shutdown_processes/shutdown_processes_vm.dart'
    as _i70;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/store_add_or_update/store_add_or_update_vm.dart'
    as _i71;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/store_new_and_update_works/new_works/new_works_vm.dart'
    as _i60;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/store_new_and_update_works/store_new_works_vm.dart'
    as _i72;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/store_works/store_works_vm.dart'
    as _i57;
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/page/stores/stores_vm.dart'
    as _i58;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiService>(() => appModule.injectApiService);
    gh.lazySingleton<_i4.ApiServiceStoreOpeningSystem>(
        () => appModule.injectApiStoreService);
    gh.lazySingleton<_i5.ApiServiceStoreOpeningSystemEmployee>(
        () => appModule.injectApiStoreServiceEmployee);
    gh.lazySingleton<_i6.AppConfigRemote>(
      () => _i6.TestAppRemoteConfigImpl(),
      registerFor: {_test},
    );
    gh.factory<_i7.DeviceInfoPlugin>(() => appModule.deviceInfo);
    gh.lazySingleton<_i8.Dio>(
      () => appModule.injectRetrofitAPI,
      registerFor: {
        _dev,
        _prod,
        _test,
      },
    );
    gh.factory<_i9.EmployeeHomePageViewModel>(
        () => _i9.EmployeeHomePageViewModel());
    await gh.factoryAsync<_i10.FirebaseApp>(
      () => appModule.initializeApp,
      registerFor: {
        _dev,
        _prod,
      },
      preResolve: true,
    );
    await gh.factoryAsync<_i11.FirebaseRemoteConfig>(
      () => appModule.remoteConfigService,
      registerFor: {
        _dev,
        _prod,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i12.GeoManager>(() => _i12.GeoManager());
    await gh.factoryAsync<_i13.GetStorage>(
      () => appModule.initializeGetStorage,
      registerFor: {
        _dev,
        _prod,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i14.GreatIdeasRepository>(
      () => _i14.GreatIdeasRepositoryImpl(gh<_i3.ApiService>()),
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.factory<_i15.IdeasCreateOrUpdateVievModel>(() =>
        _i15.IdeasCreateOrUpdateVievModel(gh<_i14.GreatIdeasRepository>()));
    gh.factory<_i16.JobDelayViewModel>(() => _i16.JobDelayViewModel());
    gh.factory<_i17.KoctasAppsViewModel>(() => _i17.KoctasAppsViewModel());
    gh.lazySingleton<_i18.LocalDataSource>(
      () => _i18.TestLocalDataSourceImpl(),
      registerFor: {_test},
    );
    gh.factory<_i19.ManagerTemplateViewModel>(
        () => _i19.ManagerTemplateViewModel());
    gh.factory<_i20.NetworkInfo>(() => appModule.networkInfo);
    await gh.factoryAsync<_i21.PackageInfo>(
      () => appModule.packageInfo,
      registerFor: {
        _prod,
        _dev,
      },
      preResolve: true,
    );
    gh.factory<_i22.SchoolFormListAdminPageViewModel>(
        () => _i22.SchoolFormListAdminPageViewModel());
    gh.lazySingleton<_i23.SchoolRecommendationRepository>(
      () => _i23.SchoolRecommendationRepositoryImpl(gh<_i3.ApiService>()),
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.factory<_i24.SchoolRecommendationViewModel>(() =>
        _i24.SchoolRecommendationViewModel(
            gh<_i23.SchoolRecommendationRepository>()));
    gh.factory<_i25.SearchIdeaViewModel>(() => _i25.SearchIdeaViewModel(
          gh<_i14.GreatIdeasRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i26.SplashViewModel>(() => _i26.SplashViewModel(
          gh<_i18.LocalDataSource>(),
          gh<_i7.DeviceInfoPlugin>(),
        ));
    gh.lazySingleton<_i27.StoreEmployeeRepository>(
        () => _i27.StoreEmployeeRepositoryImpl(
              gh<_i5.ApiServiceStoreOpeningSystemEmployee>(),
              gh<_i18.LocalDataSource>(),
            ));
    gh.lazySingleton<_i28.StoreJobRepository>(() =>
        _i28.StoreJobRepositoryImpl(gh<_i4.ApiServiceStoreOpeningSystem>()));
    gh.lazySingleton<_i29.StoreRepository>(
        () => _i29.StoreRepositoryImpl(gh<_i4.ApiServiceStoreOpeningSystem>()));
    gh.factory<_i30.StoreSearchViewModel>(
        () => _i30.StoreSearchViewModel(gh<_i29.StoreRepository>()));
    gh.factory<_i31.TheSoundOfTheFieldViewModel>(() =>
        _i31.TheSoundOfTheFieldViewModel(gh<_i14.GreatIdeasRepository>()));
    gh.lazySingleton<_i32.VacationRepository>(() => _i32.VacationRepositoryImpl(
          gh<_i3.ApiService>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i33.VacationViewModel>(
        () => _i33.VacationViewModel(gh<_i32.VacationRepository>()));
    gh.lazySingleton<_i6.AppConfigRemote>(
      () => _i6.AppRemoteConfigImpl(gh<_i11.FirebaseRemoteConfig>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i6.AppConfigRemote>(
      () => _i6.DevAppRemoteConfigImpl(gh<_i11.FirebaseRemoteConfig>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i34.AppViewModel>(() => _i34.AppViewModel(
          gh<_i6.AppConfigRemote>(),
          gh<_i18.LocalDataSource>(),
          gh<_i21.PackageInfo>(),
        ));
    gh.factory<_i35.AppointinAProxyViewModel>(() =>
        _i35.AppointinAProxyViewModel(gh<_i27.StoreEmployeeRepository>()));
    gh.lazySingleton<_i36.AuthRepository>(() => _i36.AuthRepositoryImpl(
          gh<_i3.ApiService>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i37.DeadlineRequestViewModel>(
        () => _i37.DeadlineRequestViewModel(
              gh<_i28.StoreJobRepository>(),
              gh<_i27.StoreEmployeeRepository>(),
            ));
    gh.factory<_i38.DeadlineTimeViewModel>(
        () => _i38.DeadlineTimeViewModel(gh<_i29.StoreRepository>()));
    gh.factory<_i39.EmployeeNotificationViewModel>(
        () => _i39.EmployeeNotificationViewModel(
              gh<_i29.StoreRepository>(),
              gh<_i18.LocalDataSource>(),
            ));
    gh.factory<_i40.EmployeeStoresViewModel>(() => _i40.EmployeeStoresViewModel(
          gh<_i27.StoreEmployeeRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.lazySingleton<_i41.EncryptStorage>(
        () => _i41.EncryptStorageImpl(gh<_i13.GetStorage>()));
    gh.lazySingleton<_i42.FeedbackRepository>(() => _i42.FeedbackRepositoryImpl(
          gh<_i3.ApiService>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i43.FeedbackViewModel>(
        () => _i43.FeedbackViewModel(gh<_i42.FeedbackRepository>()));
    gh.lazySingleton<_i44.FileManagerRepository>(
        () => _i44.FileManagerRepositoryImpl(
              gh<_i3.ApiService>(),
              gh<_i18.LocalDataSource>(),
            ));
    gh.factory<_i45.FileManagerViewModel>(
        () => _i45.FileManagerViewModel(gh<_i44.FileManagerRepository>()));
    gh.factory<_i46.FilteredViewModel>(() => _i46.FilteredViewModel(
          gh<_i14.GreatIdeasRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i47.ForgotPasswordViewModel>(
        () => _i47.ForgotPasswordViewModel(gh<_i36.AuthRepository>()));
    gh.factory<_i48.GreatIdeasCommentViewModel>(
        () => _i48.GreatIdeasCommentViewModel(gh<_i14.GreatIdeasRepository>()));
    gh.factory<_i49.GreatIdeasViewModel>(() => _i49.GreatIdeasViewModel(
          gh<_i14.GreatIdeasRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i50.HomeViewModel>(() => _i50.HomeViewModel(
          gh<_i18.LocalDataSource>(),
          gh<_i36.AuthRepository>(),
        ));
    gh.factory<_i51.IdeasDetailsViewModel>(() => _i51.IdeasDetailsViewModel(
          gh<_i14.GreatIdeasRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i52.JobAddDelayViewModel>(
        () => _i52.JobAddDelayViewModel(gh<_i27.StoreEmployeeRepository>()));
    gh.factory<_i53.JobPostponingViewModel>(
        () => _i53.JobPostponingViewModel(gh<_i28.StoreJobRepository>()));
    gh.lazySingleton<_i18.LocalDataSource>(
      () => _i18.LocalDataSourceImpl(gh<_i41.EncryptStorage>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i54.LoginViewModel>(() => _i54.LoginViewModel(
          gh<_i36.AuthRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i55.ManagerDocumentViewModel>(
        () => _i55.ManagerDocumentViewModel(gh<_i44.FileManagerRepository>()));
    gh.factory<_i56.ManagerGeneralWorksViewModel>(
        () => _i56.ManagerGeneralWorksViewModel(gh<_i29.StoreRepository>()));
    gh.factory<_i57.ManagerStoreWorksViewModel>(
        () => _i57.ManagerStoreWorksViewModel(gh<_i29.StoreRepository>()));
    gh.factory<_i58.ManagerStoresViewModel>(
        () => _i58.ManagerStoresViewModel(gh<_i29.StoreRepository>()));
    gh.factory<_i59.MyWorksViewModel>(() => _i59.MyWorksViewModel(
          gh<_i27.StoreEmployeeRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i60.NewWorksViewModel>(
        () => _i60.NewWorksViewModel(gh<_i28.StoreJobRepository>()));
    gh.factory<_i61.NotificationViewModel>(() => _i61.NotificationViewModel(
          gh<_i29.StoreRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.lazySingleton<_i62.PdksRepository>(
      () => _i62.PdksRepositoryImpl(
        gh<_i3.ApiService>(),
        gh<_i18.LocalDataSource>(),
      ),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i63.PdksViewModel>(() => _i63.PdksViewModel(
          gh<_i62.PdksRepository>(),
          gh<_i12.GeoManager>(),
          gh<_i20.NetworkInfo>(),
        ));
    gh.factory<_i64.PossibleDeadlineChangeViewModel>(
        () => _i64.PossibleDeadlineChangeViewModel(
              gh<_i29.StoreRepository>(),
              gh<_i28.StoreJobRepository>(),
            ));
    gh.factory<_i65.RegisterViewModel>(
        () => _i65.RegisterViewModel(gh<_i36.AuthRepository>()));
    gh.factory<_i66.SchoolAdminFromDetailViewModel>(
        () => _i66.SchoolAdminFromDetailViewModel(
              gh<_i23.SchoolRecommendationRepository>(),
              gh<_i18.LocalDataSource>(),
            ));
    gh.factory<_i67.SchoolRecommendationAdminPageViewModel>(
        () => _i67.SchoolRecommendationAdminPageViewModel(
              gh<_i18.LocalDataSource>(),
              gh<_i23.SchoolRecommendationRepository>(),
            ));
    gh.factory<_i68.SchoolRecommendationFormViewModel>(
        () => _i68.SchoolRecommendationFormViewModel(
              gh<_i23.SchoolRecommendationRepository>(),
              gh<_i18.LocalDataSource>(),
            ));
    gh.factory<_i69.SettingsViewmodel>(() => _i69.SettingsViewmodel(
          gh<_i21.PackageInfo>(),
          gh<_i18.LocalDataSource>(),
          gh<_i36.AuthRepository>(),
        ));
    gh.factory<_i70.ShutdownProcessesViewModel>(
        () => _i70.ShutdownProcessesViewModel(gh<_i28.StoreJobRepository>()));
    gh.factory<_i71.StoreAddOrUpdateViewModel>(
        () => _i71.StoreAddOrUpdateViewModel(gh<_i29.StoreRepository>()));
    gh.factory<_i72.StoreNewWorksViewModel>(() => _i72.StoreNewWorksViewModel(
          gh<_i28.StoreJobRepository>(),
          gh<_i29.StoreRepository>(),
        ));
    gh.factory<_i73.TemplateDetailViewModel>(() => _i73.TemplateDetailViewModel(
          gh<_i44.FileManagerRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i74.TemplateViewModel>(
        () => _i74.TemplateViewModel(gh<_i44.FileManagerRepository>()));
    gh.factory<_i75.ValidationViewModel>(
        () => _i75.ValidationViewModel(gh<_i36.AuthRepository>()));
    gh.factory<_i76.AddDocumentViewModel>(() => _i76.AddDocumentViewModel(
          gh<_i44.FileManagerRepository>(),
          gh<_i18.LocalDataSource>(),
        ));
    gh.factory<_i77.AddFolderToCenterViewModel>(
        () => _i77.AddFolderToCenterViewModel(
              gh<_i44.FileManagerRepository>(),
              gh<_i18.LocalDataSource>(),
            ));
    return this;
  }
}

class _$AppModule extends _i78.AppModule {}
