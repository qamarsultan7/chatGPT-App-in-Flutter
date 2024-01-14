
import 'package:chatbot/Providers/messeges.dart';
import 'package:chatbot/Utils/Routes/route.dart';
import 'package:chatbot/Utils/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
     
        ChangeNotifierProvider(
          create: (_) => Messages(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: RouteName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
