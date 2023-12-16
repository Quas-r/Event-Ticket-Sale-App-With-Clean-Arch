import 'package:event_ticket_sale_app_with_clean_arch/core/errors/failure/Failure.dart';

abstract class ServerFailure extends Failure{
  final int code;
  final String error;

  const ServerFailure(this.code, this.error) : super(error);
}