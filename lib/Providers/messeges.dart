import 'package:flutter/material.dart';

class Messages with ChangeNotifier {
  String _modelName = "gpt-3.5-turbo";
  String? _question;
  bool _istyping = false;
  String get modelName => _modelName;
  String? get question => _question;
  bool get istyping => _istyping;
  setQuestion(String ques) {
    _question = ques;
    notifyListeners();
  }

  List<Msg> chatmsgs = [];
  addQuestionTochatMsg(Msg data) {
    chatmsgs.insert(0, data);
    chatmsgs.reversed.toList();
    notifyListeners();
  }

  setTyping(bool typing) {
    _istyping = typing;
    notifyListeners();
  }

  setModel(String modle) {
    _modelName = modle;
    notifyListeners();
  }
}

class Msg {
  String messag;
  int index;
  Msg({required this.index, required this.messag});
}
