import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double num1=0.0,num2=0.0,total=0.0,tip=0.0;
  final TextEditingController t1 = new TextEditingController(text: "0.0");
  final TextEditingController t2 = new TextEditingController(text: "0.0");

  String toCaculateTotal(){
    num1=double.parse(t1.text);
    num2=double.parse(t2.text);
    tip=((num2/100)*num1);
    total=tip+num1;
    return total.toStringAsFixed(2);
  }

  void Clear(){
    setState(() {
      t1.text="";
      t2.text="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Tip Calculator",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
      ),
      body: new Container(
        padding: const EdgeInsets.all(40),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                labelText: "Enter The Base Amount:",
                icon: Icon(Icons.attach_money,color: Colors.white),
                labelStyle: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),
              ),
              keyboardType: TextInputType.number,
              controller: t1,
            ),
            new TextField(
              decoration: new InputDecoration(
                labelText: "Tip Percentage:",
                icon:Icon(Icons.monetization_on),
                labelStyle: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),
              ),
              keyboardType: TextInputType.number,
              controller: t2,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 70)),
                new RaisedButton(
                    child: new Text("Calculate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => ResultPage(value: toCaculateTotal(),)),
                      );
                    },
                ),
                new RaisedButton(
                  child: new Text("Clear",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green),),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: Clear,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {

  final String value;
  ResultPage({Key key , this.value}) : super (key:key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Total Amount",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Amount To Be Paid:",style: TextStyle(color: Colors.white,fontSize: 25),),
            new Text("\$${widget.value}",style: TextStyle(color: Colors.green,fontSize: 80,fontWeight: FontWeight.bold),),
            new Padding(padding: const EdgeInsets.only(top: 20)),
            new RaisedButton(
              child:
              new Text("Re-Calculate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.green,
                onPressed: (){
                Navigator.pop(context);
                },
            )
          ],
        ),
      ),
    );
  }
}