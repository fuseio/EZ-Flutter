import 'package:ez_flutter/src/model/EzSettings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bloc/BlocBase.dart';
import 'bloc/BlocProvider.dart';
import 'bloc/EzGlobalBloc.dart';
import 'bloc/blocs/EzMessageBloc.dart';

///
/// The class for starting a EZ Flutter app.
///
/// It call the runApp method with a [MaterialApp] or [CupertinoApp]
///
/// [blocs] are custom BLOCs that can be added to the [GlobalBloc] to be accessable within the app.
/// [cupertino] defines if the runner should use [CupertinoApp] instead of [MaterialApp].
/// [locales] are the supported languages. The default is 'en'.
///
class EzRunner {
  static void run(Widget app,
      {Map<Type, BlocBase> blocs,
      bool cupertino = false,
      List<Locale> locales = const [Locale('en')],
      String envPath,
      String customPath}) async {
    Widget wrapper;
    if (cupertino) {
      wrapper = getCupertinoWrapper(app);
    } else {
      wrapper = getMaterialWrapper(app);
    }
    if (blocs == null) {
      blocs = {};
    }
    blocs.putIfAbsent(EzMessageBloc, () => EzMessageBloc());
    await EzSettings.init(envPath: envPath, customPath: customPath);
    return runApp(buildBlocWrapper(wrapper, blocs));
  }
}

Widget buildBlocWrapper(Widget wrapper, Map<Type, BlocBase> blocs) {
  return BlocProvider<EzGlobalBloc>(
      bloc: EzGlobalBloc(blocs: blocs), child: wrapper);
}

Widget getMaterialWrapper(Widget app) {
  return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: app);
}

Widget getCupertinoWrapper(Widget app) {
  return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: app);
}