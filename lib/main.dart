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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double w = 100;
  double h = 100;
  double op = 0;
  double fz = 14;
  Color? color = Colors.red;
  double end = 50;
  AlignmentGeometry alignment = Alignment.topLeft;
  late AnimationController animatedContainer;

  @override
  void initState() {
    super.initState();
    animatedContainer = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 10,
        upperBound: end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: animatedContainer,
        builder: (context, child) {
          return Center(
            child: Column(
              children: [
                Text(
                  "Text",
                  style: TextStyle(fontSize: animatedContainer.value),
                ),
                Wrap(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          animatedContainer.forward();
                        },
                        child: Text("forward")),
                    ElevatedButton(
                        onPressed: () {
                          animatedContainer.reverse();
                        },
                        child: Text("reverse")),
                    ElevatedButton(
                        onPressed: () {
                          animatedContainer.reset();
                        },
                        child: Text("reset")),
                    ElevatedButton(
                        onPressed: () {
                          animatedContainer.repeat();
                        },
                        child: Text("repeat")),
                    ElevatedButton(
                        onPressed: () {
                          animatedContainer.stop();
                        },
                        child: Text("stop")),
                  ],
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(end: 300, begin: 100),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) => Center(
                    child: Container(
                      width: value,
                      height: value,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            end = end == 50 ? 100 : 50;
            animatedContainer.forward();
            // w = double.infinity;
            // h = 50;
            // op = 1;
            // op = 1;
            // fz = 80;
            // color = Colors.blue;
            // alignment=Alignment.topRight;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
/*
TweenAnimationBuilder(
          tween: Tween<double>(begin:20,end: end ),
          duration: const Duration(milliseconds: 600),
          builder: (context, value, child) {
            return  Center(child: Text("Text",style: TextStyle(fontSize: value),),);
          },)
AnimatedAlign(
          alignment: alignment,
          duration:const Duration(seconds: 2),
          child: AnimatedSize(
            duration:const Duration(seconds: 2),
            child: Container(
              width: w,
              height: h,
              color: color,
            ),
          ))
Center(
child: AnimatedOpacity(
opacity: op,
duration: const Duration(seconds: 8),
child: AnimatedContainer(

color: color,
width: w,
height: h,
duration: const Duration(seconds: 4),
curve: Curves.easeIn,
),
)),


Center(
        child: AnimatedDefaultTextStyle(
            child: Text("Welcome",), style: TextStyle(
            fontSize: fz,color: color
        ), duration: Duration(seconds: 4)),
      ),
*/
