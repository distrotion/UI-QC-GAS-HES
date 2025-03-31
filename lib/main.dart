import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//--------------------------------------

import 'bloc/Observe/appBlocObserver.dart';
import 'bloc/cubit/Rebuild.dart';
import 'mainBody.dart';
import 'dart:html' as html;

//--------------------------------------

Map<String, String>? initialQueryParameters;
String hashs = '';
void main() {
  hashs = html.window.location.toString();
  print("1111");
  print(hashs);

  // if (hash.contains('?')) {
  //   // Extract query parameters: "xxx=123"
  //   final queryString = hash.split('?')[1];

  //   // Parse into a map
  //   final params = Uri.splitQueryString(queryString);
  //   print(params['xxx']); // "123"
  // }
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BlocPageRebuild>(
        create: (BuildContext context) =>
            BlocPageRebuild(), //For rebuild only page inside without app bar/left menu
      ),
    ], child: const MainContext());
  }
}

class MainContext extends StatelessWidget {
  const MainContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return MaterialApp(
          title: 'UI QC GAS HES',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) {
              List<String> dataout = [];
              String out = '';
              if (hashs.contains("/#/")) {
                dataout = hashs.split("/#/");
              }
              if (dataout.length > 0) {
                out = dataout[1];
              }
              print(out);
              return MainBlocRebuild(
                login: out,
              );
            },
          },
          // home: MainBlocRebuild(),
        );
      },
    );
  }
}
