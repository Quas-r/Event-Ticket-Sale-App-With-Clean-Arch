import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/data/datasource/home_datasource.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeDataSource dataSource;
  HomeRepositoryImpl(this.dataSource);
  @override
  Future<Either<String, List<EventEntity>>> getEvents() async {
    var result = await dataSource.getEvents();
    if (result.isRight()) {
      return Right(result.getOrElse(() => []));
    } else {
      String message = "";
      result.fold((l) => message = l, (r) => null);
      return Left(message);
    }
  }
}
