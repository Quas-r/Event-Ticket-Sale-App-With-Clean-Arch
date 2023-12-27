// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/events/data/datasource/events_datasource.dart' as _i3;
import '../../features/events/data/datasource/events_datasource_impl.dart'
    as _i4;
import '../../features/events/data/repository/events_repository_impl.dart'
    as _i6;
import '../../features/events/domain/repository/events_repository.dart' as _i5;
import '../../features/events/domain/usecase/get_event_details_usecase.dart'
    as _i7;
import '../../features/events/presentation/logic_holder/events_logic_holder.dart'
    as _i15;
import '../../features/home/data/datasource/home_datasource.dart' as _i8;
import '../../features/home/data/datasource/home_datasource_impl.dart' as _i9;
import '../../features/home/data/repository/home_repository_impl.dart' as _i11;
import '../../features/home/domain/repository/home_repository.dart' as _i10;
import '../../features/home/domain/usecase/get_events_usecase.dart' as _i16;
import '../../features/home/presentation/logic_holder/home_logic_holder/home_screen_logic_holder.dart'
    as _i17;
import '../../features/home/presentation/logic_holder/main_logic_holder.dart/main_logic_holder.dart'
    as _i12;
import '../remote/remote_config.dart' as _i14;
import '../usecase/usecase_template.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.EventsDataSource>(() => _i4.EventsDataSourceImpl());
  gh.factory<_i5.EventsRepository>(
      () => _i6.EventsRepositoryImpl(gh<_i3.EventsDataSource>()));
  gh.factory<_i7.GetEventDetailsUsecase>(
      () => _i7.GetEventDetailsUsecase(gh<_i5.EventsRepository>()));
  gh.factory<_i8.HomeDataSource>(() => _i9.HomeDataSourceImpl());
  gh.factory<_i10.HomeRepository>(
      () => _i11.HomeRepositoryImpl(gh<_i8.HomeDataSource>()));
  gh.factory<_i12.MainLogicHolder>(() => _i12.MainLogicHolder());
  gh.factory<_i13.NoParams>(() => _i13.NoParams());
  gh.singleton<_i14.RemoteConfig>(_i14.RemoteConfig());
  gh.factory<_i15.EventsLogicHolder>(
      () => _i15.EventsLogicHolder(gh<_i7.GetEventDetailsUsecase>()));
  gh.factory<_i16.GetEventsUsecase>(
      () => _i16.GetEventsUsecase(gh<_i10.HomeRepository>()));
  gh.factory<_i17.HomeScreenLogicHolder>(
      () => _i17.HomeScreenLogicHolder(gh<_i16.GetEventsUsecase>()));
  return getIt;
}
