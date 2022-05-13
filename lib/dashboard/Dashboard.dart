
import 'package:flutter/material.dart';
import 'package:sameer_khan_task/utils/AppUtils.dart';
import 'package:sameer_khan_task/utils/ColorUtils.dart';
import 'package:sameer_khan_task/utils/WidgetUtils.dart';
import '../utils/Api.dart';
import '../database/DatabaseHandler.dart';
import '../model/User.dart';
class Dashboard extends StatefulWidget{
  final Api api;
  Dashboard({required this.api});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}
class DashboardState extends State<Dashboard>{
  String _response = '';
  bool _isLoading = false;
  late DatabaseHandler handler;
  late Api _api;
  String email="";
  @override
  void initState() {
    super.initState();
    _api = widget.api;
    this.handler = DatabaseHandler();
    getUsername();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ColorUtils.colorBg,
        elevation: 0,
        centerTitle: true,
        title: Text("Dashboard",style: WidgetUtils.textStyleView1(Colors.white, 16),),
      ),
      drawer: Drawer(
        backgroundColor: ColorUtils.colorBg,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: ColorUtils.colorBflight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                      radius: 40.0,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    child: Text(
                      email,
                      style:WidgetUtils.textStyleView1(Colors.white, 14),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_response, textAlign: TextAlign.center),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:ColorUtils.colorBg, // background
                onPrimary: Colors.white, // foreground
              ),

              key: ValueKey('getData'),
              onPressed: getApiDetails,
              child: Text(
                'Show Record',style: WidgetUtils.textStyleViewBold(Colors.white, 14),),
            )
          ],
        ),
      ),
    );
  }

  void getApiDetails() async {
    setState(() {
      _isLoading = true;
    });
    _response = await _api.getApiResponse();
    setState(() {
      _isLoading = false;
    });
  }

  void getUsername() async{

    setState(() {

      this.handler.initializeDB().whenComplete(() async {
        Future<List<User>> _futureOfList = this.handler.retrieveUsers();
        List<User> listOfUsers = await  _futureOfList;
        for (var i = 0; i < listOfUsers.length; i++) {
          print("====list"+listOfUsers[i].name);
        }
        setState(() {
          for (var i = 0; i < listOfUsers.length; i++) {
            print("====list"+listOfUsers[i].name);
            email=listOfUsers[i].email!;
          }
        });
      });
    });
  }
}

