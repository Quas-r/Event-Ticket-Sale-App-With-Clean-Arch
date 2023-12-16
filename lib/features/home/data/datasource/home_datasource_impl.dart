import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/consts.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/remote/dio_request.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/data/model/event_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/consts/urls/urls.dart';
import 'home_datasource.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {

  @override
  Future<Either<String, List<EventModel>>> getEvents() async {
    try {
      var response = await DioRequest().request(RequestType.get, Urls.getEvents);
      if (response?.statusCode == 200) {
        List<dynamic> data = response?.data['events'];
        List<EventModel> eventList = data.map((e) => EventModel.fromJson(e)).toList();
        return Right(eventList);
      } else {
        return const Left('Failed to fetch events');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
