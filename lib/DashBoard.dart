import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List classes = [];
  bool isLoading = true;

// import 'dart:convert';
// import 'package:http/http.dart' as http;

  Future<void> fetchClasses() async {
    final response =
        await http.get(Uri.parse('http://159.223.115.241/get_classes.php'));

    if (response.statusCode == 200) {
      // Parse the response body if it's successful
      final data = json.decode(response.body);
      print(data); // Handle the response
    } else {
      // Handle error if status code is not 200
      print('Failed to load data');
    }
  }

  // // Fetch classes data
  // Future<void> fetchClasses() async {
  //   try {
  //     var url = Uri.parse(
  //         "http://159.223.115.241/get_classes.php"); // Update with correct endpoint
  //     var response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       setState(() {
  //         classes = data; // Assuming response is a list of classes
  //         isLoading = false;
  //       });
  //     } else {
  //       print("Failed to fetch classes. Status: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error fetching classes: $e");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    fetchClasses(); // Fetch data when the dashboard loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator()) // Show loader while loading
          : ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: classes[index]['cover_image'] != null
                        ? Image.network(
                            classes[index]['cover_image'], // Load cover image
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.image,
                            size: 50), // Placeholder for missing image
                    title: Text(classes[index]['name']), // Display class name
                    subtitle: Text(
                        classes[index]['description']), // Display description
                  ),
                );
              },
            ),
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // class DashBoard extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Dashboard'),),
// //       body: Center(child: Text('Dashboard')),
// //     );
// //   }
// // }

// class DashBoard extends StatefulWidget {
//   @override
//   _DashBoardState createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   List classes = []; // To store the data from the server

//   // Fetch data from the server
//   Future<void> fetchClasses() async {
//     var url = Uri.parse("http://159.223.115.241/get_classes.php");

//     try {
//       var response = await http.get(url);

//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         setState(() {
//           classes = json.decode(response.body);
//         });
//       } else {
//         print("Error: Unable to fetch data");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchClasses(); // Fetch data when the widget initializes
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: classes.isEmpty
//           ? Center(
//               child:
//                   CircularProgressIndicator()) // Show loader while data is being fetched
//           : ListView.builder(
//               itemCount: classes.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(classes[index]['name']),
//                     subtitle: Text(classes[index]['description']),
//                     leading: CircleAvatar(
//                       child: Text(classes[index]['id'].toString()),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
