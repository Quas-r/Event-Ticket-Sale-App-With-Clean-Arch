import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/consts.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/urls/urls.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/remote/dio_request.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/data/datasource/events_datasource.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/data/model/event_details_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EventsDataSource)
class EventsDataSourceImpl implements EventsDataSource {
  @override
  Future<Either<String, EventDetailsModel>> getEventDetails(String id) async {
    try {
      var response = await DioRequest().request(RequestType.get, Urls.getEventDetails.replaceFirst("{id}", id));
      if (response?.statusCode == 200) {
        Map<String, dynamic> data;
        if (response?.data['eventDetails'] == null) {
          data = {};
        } else {
          data = response?.data['eventDetails'];
        }
        return Right(EventDetailsModel.fromJson(data));
      } else {
        return Left(response?.data['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
  
}
