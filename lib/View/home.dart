
import 'package:chatbot/Utils/Services/services.dart';
import 'package:chatbot/ViewModel/gptModel.dart';
import 'package:chatbot/Providers/messeges.dart';
import 'package:chatbot/Resources/components/Widgets/chatwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TextEditingController promptController;
  GptmodelsViewModel fextModels = GptmodelsViewModel();
  late AnimationController contrr;

  @override
  void initState() {
    promptController = TextEditingController();
    contrr = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    fetchmodel();
    super.initState();
  }

  fetchmodel() async {
    await fextModels.fetchGPTModel(context);
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ChatGPT'),
          actions: [
            IconButton(
                onPressed: () {
                  Services.showBottomModel(context);
                },
                icon: const Icon(Icons.more_vert)),
            const SizedBox(
              width: 4,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        body: SafeArea(
            child: Column(
          children: [
            Flexible(
              child: Consumer<Messages>(
                builder: (__, val, _) => ListView.builder(
                    // reverse: true,
                    itemCount: val.chatmsgs.length,
                    itemBuilder: (context, index) {
                      if (val.chatmsgs.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return ChatWidget(
                        label: val
                            .chatmsgs[(val.chatmsgs.length - 1) - index].messag
                            .toString(),
                        chatIndex: int.parse(val
                            .chatmsgs[(val.chatmsgs.length - 1) - index].index
                            .toString()),
                      );
                    }),
              ),
            ),
            Consumer<Messages>(builder: (__, value, _) {
              if (value.istyping) {
                return SpinKitSpinningLines(
                  color: Colors.white,
                  size: 35.0,
                  controller: contrr,
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            const SizedBox(
              height: 5,
            ),
            Material(
              color: const Color.fromARGB(255, 88, 87, 87),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: promptController,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration.collapsed(
                            hintText: 'How Can I help You?'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            messages.setTyping(true);
                            messages.setQuestion(promptController.text);
                            fextModels.fecthGptREply(context);
                            FocusScope.of(context).requestFocus(FocusNode());
                            Msg newmsg =
                                Msg(index: 0, messag: promptController.text);

                            messages.addQuestionTochatMsg(newmsg);
                            promptController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_upward,
                          size: 30,
                          color: Colors.green,
                        ))
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
