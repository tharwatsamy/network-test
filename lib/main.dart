import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConnectiviyApp());
}

class ConnectiviyApp extends StatefulWidget {
  const ConnectiviyApp({Key? key}) : super(key: key);

  @override
  State<ConnectiviyApp> createState() => _ConnectiviyAppState();
}

class _ConnectiviyAppState extends State<ConnectiviyApp> {
  @override
  void initState() {
    super.initState();

    checkConnectitivy();
  }

  void checkConnectitivy() async {
    var result = await Connectivity().checkConnectivity();

    print(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return Scaffold(
                body: snapshot.data == ConnectivityResult.none
                    ? const Center(child: Text('No Internet Connection'))
                    : const  Center(child: Text('Internect Connection')),
              );
            }));
  }
}
