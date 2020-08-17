import 'package:flutter/material.dart';
import 'package:health_care_app/model.dart';

class Result extends StatefulWidget {
  Model model;
  Result({Key key, this.model}): super(key: key);

  @override
  _ResultFormState createState() => _ResultFormState(model: this.model);
}

class _ResultFormState extends State<Result> {
   Model model;
   _ResultFormState({this.model});
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Success")),
      body: Form(
        key: _formKey,
//      margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 350.0 ,
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
                  Text("Sensor1:"),
                  Text( "${model.sen1}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor2:"),
                  Text("${model.sen2}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor3:"),
                  Text("${model.sen3}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor4:"),
                  Text("${model.sen4}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor5:"),
                  Text("${model.sen5}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor6:"),
                  Text("${model.sen6}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor7:"),
                  Text("${model.sen7}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor8:"),
                  Text("${model.sen8}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor9:"),
                  Text("${model.sen9}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor10:"),
                  Text("${model.sen10}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor11:"),
                  Text("${model.sen11}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor12:"),
                  Text("${model.sen12}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sensor13:"),
                  Text("${model.sen13}"),
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Center(child: RaisedButton(
              onPressed: () {
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  print(model.ipAddress);
                  print(model.sen4);
                  print(model.sen1);
                }
              },
              child: Text("Submit"),
            )),
            Text("Status:")
          ],
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
