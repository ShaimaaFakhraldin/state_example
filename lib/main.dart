import 'package:flutter/material.dart';
import 'package:state_example/countState.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootWidget()
    );
  }
}

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;
   addCounter(){
     setState(() {
       count++;
     });
   }
   removeCount(){
      setState(() {
        if(count>0){
          count--;
        }
      });
   }

  @override
  Widget build(BuildContext context) {
    return CountState(
      count:  count,
      child:  Scaffold(body:

      Column(
        children: [
          SizedBox(height: 50,),
          InkWell(
            onTap: (){
              addCounter();
            },
            child:

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            color: Colors.red,
            child: Text("change data"),
          )),
          Expanded(child: MyHomePage(title: 'Flutter Demo Home Page'))

        ],
      )
      ),

      addCounter:addCounter ,
      removeCounter: removeCount,

    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    CountState counteSate = context.dependOnInheritedWidgetOfExactType<CountState>()!;
    return Scaffold(
      appBar: AppBar(

        title: Text(title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counteSate.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
     );
  }
}
