import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  static const containerWidth = containerHeight * 2.5;
  static const buttonSize = 44.0;
  static const Duration duration = Duration(seconds: 2);

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
      duration: duration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(containerHeight / 2),
                child: Stack(
                  children: [
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: ColorTween(
                          begin: lightBGColor,
                          end: darkBGColor,
                        ).evaluate(_animationController),
                        borderRadius: BorderRadius.circular(containerHeight / 2),
                      ),
                    ),
                    // Dark Radiant
                    Positioned(
                      right: 0,
                      top: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.5 * _animationController.value,
                          child: ClipPath(
                            clipper: RadiantClipper(),
                            child: Container(color: Colors.white.withOpacity(0.3), width: buttonSize + 4 * 2 + 12 * 3, height: containerHeight,),
                          ),
                        )),
                    Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.5 * _animationController.value,
                          child: ClipPath(
                            clipper: RadiantClipper(),
                            child: Container(color: Colors.white.withOpacity(0.5), width: buttonSize + 4 * 2 + 12 * 2, height: containerHeight,),
                          ),
                        )),
                    Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.5 * _animationController.value,
                          child: ClipPath(
                            clipper: RadiantClipper(),
                            child: Container(color: Colors.white.withOpacity(0.7), width: buttonSize + 4 * 2 + 12, height: containerHeight,),
                          ),
                        )),

                    // Light Radiant
                    Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.5 - 0.5 * _animationController.value,
                          child: ClipPath(
                            clipper: RadiantClipper(),
                            child: Container(color: Colors.white.withOpacity(0.3), width: buttonSize + 4 * 2 + 12 * 3, height: containerHeight,),
                          ),
                        )),
                    Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.5 - 0.5 * _animationController.value,
                          child: ClipPath(
                            clipper: RadiantClipper(),
                            child: Container(color: Colors.white.withOpacity(0.5), width: buttonSize + 4 * 2 + 12 * 2, height: containerHeight,),
                          ),
                        )),
                    Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.5- 0.5 * _animationController.value,
                          child: ClipPath(
                            clipper: RadiantClipper(),
                            child: Container(color: Colors.white.withOpacity(0.7), width: buttonSize + 4 * 2 + 12, height: containerHeight,),
                          ),
                        )),

                    // // Light Decor
                    // Positioned.fill(
                    //   child: ClipPath(
                    //     clipper: CloudClipper(false),
                    //     child: Container(
                    //       color: Colors.white.withOpacity(0.4),
                    //     ),
                    //   ),
                    // ),
                    // Positioned.fill(
                    //   child: ClipPath(
                    //     clipper: CloudClipper(true),
                    //     child: Container(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),

                    // Button
                    Positioned(
                      left: 4 + (_animationController.value * (containerWidth - buttonSize - 8)),
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
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade900.withOpacity(0.3), blurRadius: 4, spreadRadius: 2, offset: const Offset(0, 2))
                          ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ),
    );
  }
}

class CloudClipper extends CustomClipper<Path> {
  final bool small;
  CloudClipper(this.small);
  @override
  Path getClip(Size size) {
   Path path = Path();
   path.moveTo(0, size.height - size.height / 8);
   const clouds = 5;
   for (int i = 0; i <= clouds; i++) {
     final x = size.width * i / clouds;
     final y = size.height - size.height * i / (small ? 5 : 3);
     path.quadraticBezierTo(x - size.width / clouds / 2, y, x, size.height - size.height * i / (small ? 10 : 5));
   }
    path.lineTo(size.width, size.height);
   path.lineTo(0, size.height);
    path.close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}

class RadiantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromLTWH(0, -size.height / 3, size.width, size.height * 5 / 3));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
