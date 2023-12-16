import 'package:dio/dio.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/consts.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/remote/remote_config.dart';

class DioRequest {
  Future<Response<dynamic>?> request(RequestType requestType, String url,
      {Map<String, dynamic>? body}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    switch (requestType) {
      case RequestType.get:
        return await locator<RemoteConfig>().getRequest(url);
      case RequestType.post:
        return await locator<RemoteConfig>().postRequest(url, body);
      case RequestType.patch:
        return await locator<RemoteConfig>().patchRequest(url, body);
      case RequestType.put:
        return await locator<RemoteConfig>().putRequest(url, body);
      default:
        return null;
    }
  }
}
