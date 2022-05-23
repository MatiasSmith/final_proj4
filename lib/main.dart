import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'helpers/utils.dart';
import 'models/category.dart';void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Category> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              margin: EdgeInsets.all(20),
              height: 100,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Text(categories[index].name)
                  )
                ]
              )

            );
          }
        ),
        floatingActionButton: FloatingActionButton (
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2()));
          },
          backgroundColor: Colors.blue,
          child: const Text('+'),
        ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add a To-do"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Add To-do"),
        ),
      ),
    );
  }
}

//ListView example: https://codesinsider.com/flutter-listview-example/
//Listview builder: https://www.youtube.com/watch?v=0j6Quqzz9Fg
//Floating action button: https://www.youtube.com/watch?v=ABmqtI7ec7E