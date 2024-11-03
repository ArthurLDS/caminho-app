import 'package:caminho_app/ui/pages/favorites.dart';
import 'package:caminho_app/ui/pages/home.dart';
import 'package:caminho_app/ui/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caminho APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Caminho APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool get isIos =>
      foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

  int currentTabIndex = 0;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    const HomePage(),
    Favorites(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Caminho APP'),
            backgroundColor: Colors.purple,
          ),
          body: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings), label: "Settings")
              ]),
              tabBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return HomePage();
                  case 1:
                    return Favorites();
                  case 2:
                    return Settings();
                  default:
                    return HomePage();
                }
              }));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.purple,
        ),
        // Body Where the content will be shown of each page index
        body: tabs[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: onTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: "Settings")
            ]),
      );
    }
  }
}
