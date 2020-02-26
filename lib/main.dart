import 'package:flutter/material.dart';
import 'package:flutter_app_registerpage/homeScreen.dart';

//void main() => runApp(MyApp());
void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _radioValue1 = 1;

  void _handleRadioValueChnaged(int value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }
  void _showcontent() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('You clicked on'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('This is a Dialog Box. Click OK to Close.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill)),
                child: Center(
                  child: Text('Registration',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                labelText: 'Full name',
                              ),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'Full name is required';
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                labelText: 'Email or Phone number',
                              ),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'Email or Phone number is required';
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                labelText: 'Password',
                              ),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'Password is required';
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                labelText: 'Confirm password',
                              ),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'Confirm Password is required';
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                              child: Builder(
                                builder: (con) => RaisedButton(
                                  textColor: Theme.of(context).accentTextTheme.display1.color,
                                  color: Theme.of(context).primaryColor,
                                  child: Text('Choose a birth date'),
                                  onPressed: () => showDatePicker(
                                    context: con,
                                    initialDate:  DateTime.now(),
                                    firstDate:
                                    DateTime.now().subtract( Duration(days: 30)),
                                    lastDate:  DateTime.now().add( Duration(days: 30)),
                                  ),
                                ),
                              )
//                            child: TextFormField(
//                              decoration: InputDecoration(
//                                hintStyle: TextStyle(color: Colors.grey[400]),
//                                labelText: 'Birthdate',
//                              ),
//                              validator: (String value) {
//                                if (value.trim().isEmpty) {
//                                  return 'Birthdate is required';
//                                }
//                              },
//                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  'Gender:',
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[400]),
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio(
                                      value: 1,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChnaged,
                                    ),
                                    new Text('Male',
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey[400])),
                                    new Radio(
                                      value: 0,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChnaged,
                                    ),
                                    new Text('Female',
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey[400])),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 300,
                child:  RaisedButton(
                  color: Colors.indigoAccent,
                  textColor: Colors.white,
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                  child: new Text("Register"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
