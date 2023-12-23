import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/data/model/event_dates_model.dart';
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

  @override
  Future<Either<String, EventDatesModel>> getEventDates(String id) async {
    try {
      var response = await DioRequest().request(RequestType.get, Urls.getEventDates.replaceFirst("{id}", id));
      if (response?.statusCode == 200) {
        Map<String, dynamic> data;
        if (response?.data['dates'] == null) {
          data = {};
        } else {
          data = response?.data['dates'];
        }
        print(data);
        return Right(EventDatesModel.fromJson(data));
      } else {
        return Left(response?.data['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
