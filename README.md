# EZ Flutter

EZ Flutter is a collection of widgets, packages and many more usefull things, mixed up in little framework. The aim is to standardize the structure of an flutter app.

## Table of Contents

1. [Install](#install)
   * [pubspec.yaml](#pubspec.yaml)
2. [Import](#import)
3. [Features](#features)
4. [Usage](#usage)
5. [Used Packages](#used-packages)
6. [Changelog](#changelog)
7. [Support](#support)
8. [Copyright and license](#copyright-and-license)

## Install

### pubspec.yaml

Update pubspec.yaml and add the following line to your dependencies.

```yaml
dependencies:
  ez_flutter: ^0.1.0
```

## Import

Import the package with :

```dart
import 'package:ez_flutter/ez_flutter.dart';
```

## Features

### Global Messaging

Display a message to the user from anywhere inside the app with just one line of code.

### Automatic Application Configuration

Loading a configuration from json file and make it available everywhere inside the app.

### Multilanguage Support

Build in translation feature that can be used everywhere inside the app.

### Buildin customizable loading screen

EZ Flutter provides a customizable loading screen to switch between to screens after some work is done.

## Usage

Lorem Ipsum

### Start an EZ Flutter APP

```dart
  void main() => EzRunner.run(MyHomePage(title: 'Flutter Demo Home Page'));
```

### Display messages

Global Messaging is handled with a BLOC and widget added as the body of the Scaffold. Load the [EzMessageBloc](lib/src/bloc/blocs/EzMessageBloc.dart) via the [BlocProvider](lib/src/bloc/BlocProvider.dart) using the **get** method.

Add the [EzGlobalMessageWrapper](lib/src/widgets/EzGlobalMessageWrapper.dart) as the body to a Scaffold.

```dart
Scaffold{
  appBar: ...
  body: EzGlobalMessageWrapper(
    MyWidget(
      ...
    )
  )
}
```

Add a [Message](lib/src/model/Message.dart) to the bloc. The supported types are :

* success (default color : 0xFF4CAF50)
* info (default color : 0xFF2196F3)
* warning (default color : 0xFFFF9800)
* error (default color : 0xFFF44336)

```dart
    BlocProvider.of<GlobalBloc>(context)
        .get<EzMessageBloc>(EzMessageBloc)
        .addition
        .add(Message("This is a success message", "success"));
```

It is also possible to customize the color for each type of message within the application.json file.

```json
{
  "msg_success_color" : "0xFF1B5E20",
  "msg_info_color" : "0xFF0D47A1",
  "msg_warning_color" : "0xFFE65100",
  "msg_error_color" : "0xFFB71C1C",
}
```

### Use application settings

The [EZ Runner](lib/src/ez_runner.dart) loads automatically a json file with the name application.json from the asset directory. The EzRunner accepts a path to a environment and a custom settings file.
The application.json should only contain configuration that refers to the EZ Framework.
Your environment .json file should contain configuration depending on the current environment the app is running.
Add all other configuration that belongs to your app in the custom .json file.

```dart
EzRunner.run(CustomWidget() ,
      envPath: "assets/env_dev.json",
      customPath: "assets/myapp.json");
```

The settings can be accessed via the [EzSettings](lib/src/model/EzSettings.dart) class.

```dart
Map<String, dynamic> appSettings = EzSettings.app();
Map<String, dynamic> envSettings = EzSettings.env();
Map<String, dynamic> customSettings = EzSettings.custom();
```

The app

### Translation

Translation is handled by different .json files that contain the translation for each language supported by your app. The translation files are automatically loaded by the [EZ Runner](lib/src/ez_runner.dart) at startup.

```dart

```

### Adding custom BLOCs to the BlocProvider

Typically your app will use some blocs written by yourself. The [EZ Runner](lib/src/ez_runner.dart) will add the given **blocs** to the [GlobalBloc](lib/src/bloc/GlobalBloc.dart) at startup. You can access each bloc everywhere inside the app. Your Bloc has to extend [BlocBase](lib/src/bloc/BlocBase.dart).

```dart
  class MyCustomBloc extends BlocBase {
    // some stuff
  }

  BlocProvider.of<GlobalBloc>(context)
      .get<MyCustomBloc>(MyCustomBloc)
      .addition
      .add("Hello World");
```

### Transition from Screen A to B

Lorem Ipsum

## Used Packages

* Dart Basic Utils <https://pub.dev/packages/basic_utils>
* Flutter Global Configuration <https://pub.dev/packages/global_configuration>
* RxDart <https://pub.dev/packages/rxdart>

## Changelog

For a detailed changelog, see the [CHANGELOG.md](CHANGELOG.md) file

## Support

You like this repository or even use it in one of your projects? Feel free to donate a cup of coffee!
Flattr : <https://flattr.com/@Ephenodrom>

## Copyright and license

MIT License

Copyright (c) 2019 Ephenodrom

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.