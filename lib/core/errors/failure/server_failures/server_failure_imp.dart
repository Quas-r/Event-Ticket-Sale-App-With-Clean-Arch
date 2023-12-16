
import 'package:event_ticket_sale_app_with_clean_arch/core/errors/failure/server_failures/server_failures.dart';

class ServerFailureImpl extends ServerFailure{
  const ServerFailureImpl(super.code, super.error);
}