import 'package:chatbot/Model/Data/Network/base_api_service.dart';
import 'package:chatbot/Model/Data/Network/network_api_services.dart';
import 'package:chatbot/Model/models.dart';
import 'package:chatbot/Model/response.dart';
import 'package:chatbot/Providers/messeges.dart';
import 'package:chatbot/Resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelsRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<GptModel> fetchModels(BuildContext context) async {
    try {
      dynamic response = await _apiServices.getModelApiResponse(
          ApiUrls.gptModelUrl, ApiUrls.apikey,context);

      var gh = GptModel.fromJson(response);
      for (var model in gh.data!) {
        modelsList.add(model.id);
      }
      return gh;
    } catch (e) {
      rethrow;
    }
  }

  Future<GptResponseModel> fetchchatGptReply(BuildContext context) async {

    final messages = Provider.of<Messages>(context, listen: false);
    dynamic header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${ApiUrls.apikey}"
    };
    dynamic body = {
      "model": messages.modelName,
      "messages": [
        {"role": "system", "content": messages.question},
      ]
    };
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          ApiUrls.gptResponseUrl, body, header,context);
      var modelespone = GptResponseModel.fromJson(response);
      Msg newmsg=Msg(index: 1, messag: modelespone.choices![0].message!.content.toString());
      messages.addQuestionTochatMsg(newmsg);
      print(modelespone.choices![0].message!.content);
      return modelespone;
    } catch (e) {
      print('Error while hitting $e');
      rethrow;
    }
  }
}
