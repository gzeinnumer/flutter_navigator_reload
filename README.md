# flutter_navigator_reload

|<img src="/preview/preview1.png" width="300"/>|<img src="/preview/preview2.png" width="300"/>|<img src="/preview/preview3.png" width="300"/>|
|--|--|--|

```dart
Navigator.pushNamed(
  context,
  Page2View.TAG,
  arguments: "Sent Dari Main",
).then((value) {
  var snackBar = SnackBar(
    content: Text(value as String),
  );

  //Dari Page 2  akan muncul di showSnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
});
```

```dart
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context,"Dari Page 2");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page2"),
        ),
        body: _body(),
      ),
    );
  }
```

### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_navigator_reload/my_home_page.dart';
import 'package:flutter_navigator_reload/page_2_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Page2View.TAG:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(builder: (_) => Page2View(args));
      default:
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'));
    }
  }
}

void pushAndRemoveUntil(BuildContext context, String tag, Widget view) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => view), ModalRoute.withName(tag));
}
```

```dart
import 'package:flutter/material.dart';
import 'package:flutter_navigator_reload/app_router.dart';
import 'package:flutter_navigator_reload/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

```dart
import 'package:flutter/material.dart';
import 'package:flutter_navigator_reload/page_2_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    Navigator.pushNamed(
      context,
      Page2View.TAG,
      arguments: "Sent Dari Main",
    ).then((value) {
      var snackBar = SnackBar(
        content: Text(value as String),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Click Add To Move To Page 2',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

```dart
import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  static const String TAG = "Page2View";
  String args;
  Page2View(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context,"Dari Page 2");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page2"),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text(args)
            ],
          ),
        );
      }
    );
  }
}
```

---

```
Copyright 2023 M. Fadli Zein
```