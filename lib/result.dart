import 'package:flutter/material.dart';
import 'package:health_care_app/model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Result extends StatefulWidget {
  Model model;
  Result({Key key, this.model}) : super(key: key);

  @override
  _ResultFormState createState() => _ResultFormState(model: this.model);
}

class _ResultFormState extends State<Result> {
  Model model;
  String wIpA = "";
  _ResultFormState({this.model});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String status1 = model.status == null ? "" : model.status;

    return Scaffold(
      appBar: AppBar(title: Text("Success")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
//      margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 350.0,
                    height: 50.0,
                    child: MyCustomFormField(
                      hintText: "Master IP Address",
                      isIp: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'plece enter your IP Address';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.ipAddress = value;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Age:"),
                    Text("${model.sen1}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Sex:"),
                    Text("${model.sen2}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Chest Pain:"),
                    Text("${model.sen3}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Rest BPS:"),
                    Text("${model.sen4}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Cholestrol:"),
                    Text("${model.sen5}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Fasting blood suger:"),
                    Text("${model.sen6}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Rest ECG:"),
                    Text("${model.sen7}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Thalach:"),
                    Text("${model.sen8}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Exercise induduced angina:"),
                    Text("${model.sen9}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Oldpeak:"),
                    Text("${model.sen10}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Slope:"),
                    Text("${model.sen11}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Flouropsy:"),
                    Text("${model.sen12}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Thal:"),
                    Text("${model.sen13}"),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                  child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

//                    getJsonData('http://192.168.1.14/HealthFog/upload.php?data=63,1,3,145,233,1,0,150,0,2.3,0,0,2');
//                    getJsonData('http://192.168.1.15/HealthFog/exec.php')
                    var masterIpurl = "http://${model.ipAddress}/HealthFog/arbiter.php";
                    getworkerIp(masterIpurl);
                  }
                },
                child: Text("Submit"),
              )),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: Center(
                  child: Text("work is send to "+ wIpA, textAlign: TextAlign.center,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Status:"),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 10.0),
                        child: Text(
                          "${status1}",
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getworkerIp(url) async {
    var response = await http.get(
      //    Encode the Url
        Uri.encodeFull(url),
        //        Only Aspect Json Object
        headers: {"Accept": "application/json"});

    setState(() {
      wIpA = response.body.substring(response.body.length -12);
      print(response.body);
      if(wIpA.isNotEmpty){
        print("************************");
        print("888888888"+wIpA+"7777777777");
        var api1 =
            "http://"+wIpA+"/HealthFog/upload.php?data=${model.sen1},${model.sen2},${model.sen3},${model.sen4},${model.sen5},${model.sen6},${model.sen7},${model.sen8},${model.sen9},${model.sen10},${model.sen11},${model.sen12},${model.sen13}";

        getResponse(api1);
      }
    });

  }

  Future<String> getResponse(url) async {
    var response = await http.post(
      //    Encode the Url
        Uri.encodeFull(url),
        //        Only Aspect Json Object
        headers: {"Accept": "application/json"});

//    print("11111111111111111111111111 : " + response.body);
    setState(() {
      print(wIpA);
      var api2 = "http://"+wIpA+"/HealthFog/exec.php";
      getResponse2(api2);
    });
  }
  Future<String> getResponse2(url) async {
    var response = await http.get(
      //    Encode the Url
        Uri.encodeFull(url),
        //        Only Aspect Json Object
        headers: {"Accept": "application/json"});
//    print("11111111111111111111111111 : " + response.toString());
    // check the status code for the result
    int statusCode = response.statusCode;
    setState(() {
      print("5555555   " + statusCode.toString());
      var convertDataToJson =jsonDecode(response.body);

      print("66666666");
      if (convertDataToJson.toString() == "1") {
        model.status = 'You have a heart disease. pleace consult doctor';
      } else if (convertDataToJson.toString() == "0") {
        model.status = 'you are safe';
      } else {
        model.status = '';
      }
    });
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
