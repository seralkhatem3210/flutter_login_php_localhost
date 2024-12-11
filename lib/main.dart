import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:php_mysql_login_register/register.dart';
import 'package:http/http.dart' as http;

import 'DashBoard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  // Future login() async {
  //   var url = "http://159.223.115.241/";
  //   var response = await http.post(url, body: {
  //     "username": user.text,
  //     "password": pass.text,
  //   });
  //   var data = json.decode(response.body);
  //   if (data == "Success") {
  //     FlutterToast(context).showToast(
  //         child: Text(
  //       'Login Successful',
  //       style: TextStyle(fontSize: 25, color: Colors.green),
  //     ));
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => DashBoard(),
  //       ),
  //     );
  //   } else {
  //     FlutterToast(context).showToast(
  //         child: Text('Username and password invalid',
  //             style: TextStyle(fontSize: 25, color: Colors.red)));
  //   }
  // }
  // Future login() async {
  //   // Convert the String URL to Uri
  //   var url = Uri.parse("http://159.223.115.241/login.php");

  //   var response = await http.post(url, body: {
  //     "username": user.text,
  //     "password": pass.text,
  //   });

  //   var data = json.decode(response.body);

  //   if (data == "Success") {
  //     Fluttertoast.showToast(
  //         msg: "Login Successful",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);

  //     // FlutterToast(context).showToast(
  //     //     child: Text(
  //     //   'Login Successful',
  //     //   style: TextStyle(fontSize: 25, color: Colors.green),
  //     // ));
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => DashBoard(),
  //       ),
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Username and password invalid",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Color.fromARGB(255, 255, 0, 0),
  //         textColor: Colors.white,
  //         fontSize: 16.0);

  //     // FlutterToast(context).showToast(
  //     //     child: Text('Username and password invalid',
  //     //         style: TextStyle(fontSize: 25, color: Colors.red)));
  //   }
  // }

  // Future login() async {
  //   var url = Uri.parse("http://159.223.115.241/login.php");

  //   try {
  //     var response = await http.post(url, body: {
  //       "username": user.text,
  //       "password": pass.text,
  //     });

  //     // Print response for debugging
  //     print("Response status: ${response.statusCode}");
  //     print("Response body: ${response.body}");

  //     // Decode response
  //     var data = json.decode(response.body);

  //     if (data == "Success") {
  //       Fluttertoast.showToast(
  //         msg: "Login Successful",
  //         backgroundColor: Colors.green,
  //       );
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => DashBoard(),
  //         ),
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "Username and password invalid",
  //         backgroundColor: Colors.red,
  //       );
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //     Fluttertoast.showToast(
  //       msg: "An error occurred: $e",
  //       backgroundColor: Colors.red,
  //     );
  //   }
  // }
  Future login() async {
    // var url = Uri.parse("http://159.223.115.241/login.php");
    var url = Uri.parse("http://159.223.115.241:8001/authenticate");
    // http: //localhost/api/authenticate

    try {
      var response = await http.post(url, body: {
        "name": user.text,
        "password": pass.text,
      });

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      // Decode the response body
      var data = json.decode(response.body);

      if (data["Success"] == "User authenticated successfully") {
        Fluttertoast.showToast(
          msg: "Login Successful",
          backgroundColor: Colors.green,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "name and password invalid",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login SignUp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 300,
        child: Card(
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: user,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: pass,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.pink,
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.amber[100],
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
