
import 'package:flutter/material.dart';

abstract class BaseApiServices {
  Future<dynamic> getModelApiResponse(String apiURl,String apiKey,BuildContext context);
  Future<dynamic> getPostApiResponse(String apiURl,dynamic body,dynamic header,BuildContext context);
}