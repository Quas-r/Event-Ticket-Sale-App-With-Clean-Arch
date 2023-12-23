// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/datasource/home_datasource.dart' as _i3;
import '../../features/home/data/datasource/home_datasource_impl.dart' as _i4;
import '../../features/home/data/repository/home_repository_impl.dart' as _i6;
import '../../features/home/domain/repository/home_repository.dart' as _i5;
import '../../features/home/domain/usecase/get_event_dates_usecase.dart'
    as _i14;
import '../../features/home/domain/usecase/get_events_usecase.dart' as _i15;
import '../../features/home/presentation/logic_holder/home_logic_holder/home_screen_logic_holder.dart'
    as _i17;
import '../../features/home/presentation/logic_holder/main_logic_holder.dart/main_logic_holder.dart'
    as _i7;
import '../../features/my_tickets/data/datasource/explore_datasource_impl.dart'
    as _i9;
import '../../features/my_tickets/data/datasource/my_tickets_datasource.dart'
    as _i8;
import '../../features/my_tickets/data/repository/my_tickets_repository_impl.dart'
    as _i11;
import '../../features/my_tickets/domain/repository/my_tickets_repository.dart'
    as _i10;
import '../../features/my_tickets/domain/usecase/get_my_tickets_usecase.dart'
    as _i16;
import '../../features/my_tickets/presentation/logic_holder/my_tickets_logic_holder.dart'
    as _i18;
import '../remote/remote_config.dart' as _i13;
import '../usecase/usecase_template.dart' as _i12;

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
  gh.factory<_i3.HomeDataSource>(() => _i4.HomeDataSourceImpl());
  gh.factory<_i5.HomeRepository>(
      () => _i6.HomeRepositoryImpl(gh<_i3.HomeDataSource>()));
  gh.factory<_i7.MainLogicHolder>(() => _i7.MainLogicHolder());
  gh.factory<_i8.MyTicketsDataSource>(() => _i9.ExploreDataSourceImpl());
  gh.factory<_i10.MyTicketsRepository>(
      () => _i11.MyTicketsRepositoryImpl(gh<_i8.MyTicketsDataSource>()));
  gh.factory<_i12.NoParams>(() => _i12.NoParams());
  gh.singleton<_i13.RemoteConfig>(_i13.RemoteConfig());
  gh.factory<_i14.GetEventDatesUsecase>(
      () => _i14.GetEventDatesUsecase(gh<_i5.HomeRepository>()));
  gh.factory<_i15.GetEventsUsecase>(
      () => _i15.GetEventsUsecase(gh<_i5.HomeRepository>()));
  gh.factory<_i16.GetMyTicketsUsecase>(
      () => _i16.GetMyTicketsUsecase(gh<_i10.MyTicketsRepository>()));
  gh.factory<_i17.HomeScreenLogicHolder>(() => _i17.HomeScreenLogicHolder(
        gh<_i15.GetEventsUsecase>(),
        gh<_i14.GetEventDatesUsecase>(),
      ));
  gh.factory<_i18.MyTicketsLogicHolder>(
      () => _i18.MyTicketsLogicHolder(gh<_i16.GetMyTicketsUsecase>()));
  return getIt;
}
