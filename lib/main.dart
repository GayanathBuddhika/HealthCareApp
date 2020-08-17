import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'model.dart';
import 'result.dart';

void main() {
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
    ));
  }
}

class HealtForm extends StatefulWidget {
  @override
  _HealtFormState createState() => _HealtFormState();
}

class _HealtFormState extends State<HealtForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = new Model();
  String text = 'No Sensor data';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<String> getJsonData(url) async {
    var response = await http.get(
        //    Encode the Url
        Uri.encodeFull(url),
        //        Only Aspect Json Object
        headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      model.sen1 = convertDataToJson['id'].toString();
      model.sen2 = convertDataToJson['gpio'].toString();
      model.sen3 = convertDataToJson['abc'].toString();
//      model.sen1 = '10';
//      model.sen2 = '20';
//      model.sen3 = '30';
//      model.sen4 = '40';
//      model.sen5 = '50';
//      model.sen6 = '60';
//      model.sen7 = '70';
//      model.sen8 = '80';
//      model.sen9 = '90';
//      model.sen10 = '100';
//      model.sen11 = '110';
//      model.sen12 = '120';
//      model.sen13 = '130';

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                    model: this.model,
                  )));
      text = 'success';
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Container(
          width: 300.0,
          height: 50.0,
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              'get the Sensor Data',
              style: TextStyle(fontSize: 15.0),
            ),
            onPressed: () {
              getJsonData('http://192.168.1.12/sens');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(model: null)));
            },
//            onPressed: () async{
//
//          getJsonData('http://192.168.1.12/sens');
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Result(model: model)));
//
//
//               },
          ),
        ),
      ),
    );

  }
}

class MyCustomFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isIp;
  final bool isEnable;
  MyCustomFormField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isIp = false,
      this.isEnable = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        enabled: isEnable,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200]),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isIp ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
