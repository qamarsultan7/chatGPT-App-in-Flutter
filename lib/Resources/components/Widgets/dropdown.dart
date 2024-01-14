import 'package:chatbot/Providers/messeges.dart';
import 'package:chatbot/Resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownModel extends StatefulWidget {
  const DropdownModel({Key? key}) : super(key: key);

  @override
  State<DropdownModel> createState() => _DropdownModelState();
}

class _DropdownModelState extends State<DropdownModel> {
  final ValueNotifier<String> selected =
      ValueNotifier<String>(modelsList.first!);
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<Messages>(context);

    return ValueListenableBuilder<String>(
      valueListenable: selected,
      builder: (__, val, _) => DropdownButton(
        value: selected.value,
        items: getModelItem(),
        onChanged: (value) {
          selected.value = value.toString();

          modelProvider.setModel(selected.value.toString());
        },
      ),
    );
  }
}

List<DropdownMenuItem<String>> getModelItem() {
  List<DropdownMenuItem<String>> modelsLists =
      List<DropdownMenuItem<String>>.generate(
          modelsList.length,
          (index) => DropdownMenuItem(
                value: modelsList[index],
                child: Text(modelsList[index].toString()),
              ));
  return modelsLists;
}
