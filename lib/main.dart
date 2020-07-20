import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'model.dart';
import 'result.dart';

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
  Model model = Model(
    sen1: '10',
    sen2: '20',
    sen3: '30',
    sen4: '40',
    sen5: '50',
  );


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
              validator: (String value){
                if(value.isEmpty){
                  return 'plece enter your IP Address';
                }
                return null;
              },
              onSaved:(String value){
                model.ipAddress = value;
              },
            ),

          ),
            Row(
              children: <Widget>[
                Container(
                  width: mediaWidth*3/4,
                  child: MyCustomFormField(
                    hintText: "Add sensor 1 data",
                    isEnable: false,

                  ),
                ),
                Container(
                  width: mediaWidth/4,
//                    padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'get sen1',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    onPressed: (){

                    },
                  )
                ),
              ],
            ),
          Row(
            children: <Widget>[
              Container(
                width: mediaWidth*3/4,
                child: MyCustomFormField(
                  hintText: "Add sensor 1 data",
                ),
              ),
              Container(
                  width: mediaWidth/4,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'get sen1',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: (){},
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: mediaWidth*3/4,
                child: MyCustomFormField(
                  hintText: "Add sensor 1 data",
                ),
              ),
              Container(
                  width: mediaWidth/4,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'get sen1',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: (){},
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: mediaWidth*3/4,
                child: MyCustomFormField(
                  hintText: "Add sensor 1 data",
                ),
              ),
              Container(
                  width: mediaWidth/4,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'get sen1',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: (){},
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: mediaWidth*3/4,
                child: MyCustomFormField(
                  hintText: "Add sensor 1 data",
                ),
              ),
              Container(
                  width: mediaWidth/4,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'get sen1',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: (){},
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: mediaWidth*3/4,
                child: MyCustomFormField(
                  hintText: "Add sensor 1 data",
                ),
              ),
              Container(
                  width: mediaWidth/4,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'get sen1',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: (){},
                  )
              ),
            ],
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
              if(_formKey.currentState.validate()){
                print('submit');
                _formKey.currentState.save();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Result(model: this.model,)));
                print('submit');
              }

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
  final bool isEnable;
  MyCustomFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isIp= false,
    this.isEnable = true
   });
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
          fillColor: Colors.grey[200]
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isIp ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}




