import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:networking/pages/update_page.dart';
import 'package:networking/services/http_service.dart';
import 'package:networking/services/log_service.dart';

import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    super.initState();
    var post = Post(id: 2);

    /// create
    //var post = Post(employee_name: "test", employee_salary: 123, employee_age: 45);/// create
    //var post = Post(employee_name: "AdamsVlog", employee_salary: 25000, employee_age: 35,profile_image: "",id: 21 ); ///update

    //_apiPostList();
    // _apiCreatePos(post);
    //_apiUpdatePo(post);
    _apiDeletePo(post);
  }

  ///# Get
  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          Log.d(response!),
          _showRespons(response),
        });
  }

  ///# Update
  void _apiUpdatePo(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              Log.d(response!),
              _showRespons(response),
            });
  }

  ///# Create
  void _apiCreatePos(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              Log.d(response!),
              _showRespons(response),
            });
  }

  ///# Delete
  void _apiDeletePo(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
              Log.d(response!),
              _showRespons(response),
            });
  }

  ///Showing
  void _showRespons(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NetWorking"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(child: Text(data == null ? "No data" : data)),
        ],
      )),
    );
  }
}
