// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:chatbot/Model/Data/Network/base_api_service.dart';
import 'package:chatbot/Model/Data/Response/exceptions.dart';
import 'package:chatbot/Utils/Services/services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getModelApiResponse(apiURl, apiKey, context) async {
    dynamic responseJason;
    try {
      final response = await http
          .get(Uri.parse(apiURl), headers: {"Authorization": "Bearer $apiKey"});
      responseJason = retruJasonResponse(
        response,
      );
    } catch (e) {
      throw Services.ShowSnakBar(context, 'No internet Connection');
    }
    return responseJason;
  }

  @override
  Future getPostApiResponse(apiURl, body, header, context) async {
    dynamic responseJason;
    try {
      final response = await http.post(Uri.parse(apiURl),
          headers: header, body: jsonEncode(body));
      responseJason = retruJasonResponse(response);
    } catch (e) {
      if (e is Exception) {
        Services.ShowSnakBar(context, e.toString());
      } else {
        Services.ShowSnakBar(context, 'Unexpected Error Occurs');
      }
    }
    return responseJason;
  }

  dynamic retruJasonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jasonresonse = jsonDecode(response.body);
        return jasonresonse;
      case 400:
        throw BadrequestException(response.statusCode.toString());
      case 404:
        throw UnauthorizedExceptions(response.statusCode.toString());
      default:
        throw FetchDataExceptions(
            'Error Occured while connecting to the serevr ${response.statusCode}');
    }
  }
}
