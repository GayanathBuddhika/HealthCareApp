import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text('Health Care'),
        ),
        body: HealtForm(),
      )
    );
  }
}




class HealtForm extends StatefulWidget {
  @override
  _HealtFormState createState() => _HealtFormState();
}

class _HealtFormState extends State<HealtForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            width: mediaWidth,
            child: MyCustomFormField(
              hintText: "Master IP Address",
              isIp: true,
            ),
          ),
          RaisedButton(
            color: Colors.blueAccent,
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: (){
              print('submit');
            },
          )
        ],
      ),

    );
  }
}

class MyCustomFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isIp;
  MyCustomFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isIp= false,
   });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200]
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isIp ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}


//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  int count = 0;
//
//  void increment(){
//
//    setState(() {
//      count = count +1;
//      print(count);
//    });
//
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Health Care"),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("You Have Clicked Button ", style: TextStyle(
//                fontSize: 25.0
//            ),),
//            Text( '$count', style:TextStyle(
//                fontSize: 30.0
//            ))
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: increment,
//      ),
//
//    );
//  }
//}


