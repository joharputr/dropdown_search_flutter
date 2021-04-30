import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_dropdown_search/user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAPpState createState() => _MyAPpState();
}

class _MyAPpState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownSearch<Datum>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            onFind: (String filter) async {
              var response = await Dio().get(
                "http://34.101.214.129/brands",
                queryParameters: {"keyword": filter},
              );
              print("responsess = $response");
              UserData datum = UserData.fromJson(response.data);
              return datum.data;
            },
            onChanged: (Datum data) {
              print("hasil = " + data.name);
            },
          ),
        ),
      ),
    );
  }
}

//ererer
