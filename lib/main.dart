import 'package:flutter/material.dart';
import 'package:test_login1/Widgets/login_api.dart';

import 'package:test_login1/Widgets/login_form.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  
  @override
   createState() {
    
    return AppState();
  }
}


 class AppState extends State<MyApp>{
  final ApiClient api = ApiClient();
  
 
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: Scaffold(
        body: getLoginForm(),
      
      ),
    );
  }


  Widget getLoginForm() {
    
    return FutureBuilder(builder: (context, ss) {
      return ss.hasData ? LoginForm(ss.data) : CircularProgressIndicator();
    
    },future: api.getLoginModel());
  }
}
