import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'DashBoard.dart';
import 'main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var url = Uri.parse("http://159.223.115.241/register.php");

    try {
      var response = await http.post(url, body: {
        "username": user.text,
        "password": pass.text,
      });

      // Log the response for debugging
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data == "Error") {
          Fluttertoast.showToast(
              msg: "User Already Exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        } else {
          Fluttertoast.showToast(
              msg: "Registration Successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBoard()),
          );
        }
      } else {
        Fluttertoast.showToast(
            msg: "Server Error: ${response.statusCode}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
          msg: "Error: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
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
                  'Register',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
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
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                        register();
                      },
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.amber[100],
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
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


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'DashBoard.dart';
// import 'main.dart';

// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   TextEditingController user = TextEditingController();
//   TextEditingController pass = TextEditingController();

//   Future register() async {
//     // var url = "http://159.223.115.241/register.php";
//     var url = Uri.parse("http://159.223.115.241/register.php");
//     var response = await http.post(url, body: {
//       "username": user.text,
//       "password": pass.text,
//     });
//     var data = json.decode(response.body);
//     if (data == "Error") {
//       // FlutterToast(context).showToast(
//       //     child: Text(
//       //   'User allready exit!',
//       //   style: TextStyle(fontSize: 25, color: Colors.red),
//       // ));

//       Fluttertoast.showToast(
//           msg: "User Already Exist ",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Color.fromARGB(255, 255, 0, 0),
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else {
//       Fluttertoast.showToast(
//           msg: "Registration Successful",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//           fontSize: 16.0);

//       // FlutterToast(context).showToast(
//       //     child: Text('Registration Successful',
//       //         style: TextStyle(fontSize: 25, color: Colors.green)));
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DashBoard(),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Login SignUp',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         height: 300,
//         child: Card(
//           color: Colors.amber,
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Register',
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                     prefixIcon: Icon(Icons.person),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                   controller: user,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                   controller: pass,
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: MaterialButton(
//                       color: Colors.pink,
//                       child: Text('Register',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white)),
//                       onPressed: () {
//                         register();
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: MaterialButton(
//                       color: Colors.amber[100],
//                       child: Text('Login',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => MyHomePage(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
