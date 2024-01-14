import 'package:chatbot/Providers/messeges.dart';
import 'package:chatbot/Repository/models_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GptmodelsViewModel {
  final _gptModelRepo = ModelsRepository();

  Future<void> fetchGPTModel(BuildContext context) async {
    await _gptModelRepo.fetchModels(context);
  }

  Future<void> fecthGptREply(BuildContext context) async {
    final messages = Provider.of<Messages>(context, listen: false);
    await _gptModelRepo.fetchchatGptReply(context).then((value) {
      messages.setTyping(false);
    }).onError((error, stackTrace) {
      messages.setTyping(false);
    });
  }
}
