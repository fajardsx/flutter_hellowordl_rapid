import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const String id = "detailscreen";
  DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic,dynamic> dataargument = ModalRoute.of(context)!.settings.arguments as Map;
    if(dataargument != null){
      print(dataargument['data1']);
      print(dataargument['data2']);
    }
    return Container(
      child: Column(
        children: [
          Text(dataargument['data1'].toString()),
          Text(dataargument['data2'].toString()),
          Text("Halaman Detail"),
          ElevatedButton(onPressed: () {
            Navigator.pop(context,'{"data1": "abc", "data2": 12345}');
          }, child: Text("Back")),
        ],
      ),
    );
  }
}
