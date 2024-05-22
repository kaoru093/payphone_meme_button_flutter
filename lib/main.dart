import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  static const containerHeight = 52.0;
  static const buttonSize = 44.0;

  static final lightBGColor = Colors.lightBlue.shade300;
  static final lightButtonColor = Colors.amber.shade300;
  static const lightButtonDecorItems = Colors.transparent;

  static final darkBGColor = Colors.blueGrey.shade900;
  static final darkButtonColor = Colors.grey.shade200;
  static final darkButtonDecorItems = Colors.grey.shade700;
  
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                if (_animationController.status == AnimationStatus.completed) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
              child: Stack(
                children: [
                  Container(
                    height: containerHeight,
                    width: containerHeight * 3,
                    decoration: BoxDecoration(
                      color: ColorTween(
                        begin: lightBGColor,
                        end: darkBGColor,
                      ).evaluate(_animationController),
                      borderRadius: BorderRadius.circular(containerHeight / 2),
                    ),
                  ),
                  Positioned(
                    left: 4 + (_animationController.value * (containerHeight * 3 - buttonSize - 8)),
                    top: 4,
                    bottom: 4,
                    child: Container(
                      width: buttonSize,
                      decoration: BoxDecoration(
                        color: ColorTween(
                          begin: lightButtonColor,
                          end: darkButtonColor,
                        ).evaluate(_animationController),
                        borderRadius: BorderRadius.circular(containerHeight / 2),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
