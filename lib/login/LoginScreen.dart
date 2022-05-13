import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sameer_khan_task/model/User.dart';
import '../utils/Api.dart';
import '../utils/AppUtils.dart';
import '../utils/ColorUtils.dart';
import '../dashboard/Dashboard.dart';
import '../utils/WidgetUtils.dart';
import '../database/DatabaseHandler.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}
class LoginState extends State<LoginScreen>{
  late DatabaseHandler handler;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var finalDate = '';
  DateTime now = DateTime.now();
  String cdate1 = DateFormat("EEEEE, dd, yyyy").format(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.handler = DatabaseHandler();
  }
  @override
  Widget build(BuildContext context) {
    AppUtils.chnageStatusBar(ColorUtils.colorBg);
    return Scaffold(
        backgroundColor: ColorUtils.colorBg,
        appBar: AppUtils.toolbarwithText(context,AppUtils.signIN),
        body: Center(
          child: SingleChildScrollView(
            child: viewSingup(),
          ),
        )
    );
  }

  Widget viewSingup(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.only(top: 15,left: 15,right: 15),
            child:     TextFormField(
              controller: emailController,
              style: WidgetUtils.textStyleView(Colors.white),
              decoration:WidgetUtils.inputDecoration(Colors.white,Icons.email,Colors.white,"Email"),
              keyboardType: TextInputType.emailAddress,

            ),
          ),
          SizedBox(height: 20,),
          Container(

            margin: EdgeInsets.only(top: 15,left: 15,right: 15),
            child:     TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              style: WidgetUtils.textStyleView(Colors.white),
              decoration:WidgetUtils.inputDecoration(Colors.white,Icons.person,Colors.white,"Password"),

            ),
          ),

          SizedBox(height: 30,),
          TextButton(onPressed: (){


           if(emailController.text.isEmpty ){
              AppUtils.showErrorMessage(context,AppUtils.showEmailError);
            }
          else  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailController.text)) {
             AppUtils.showErrorMessage(context, AppUtils.showInvalidEmailError);
            }
           else if(passwordController.text.isEmpty){
             AppUtils.showErrorMessage(context,AppUtils.showPasswordError);
            }
           else if (!(passwordController.text.length > 8) && passwordController.text.isNotEmpty) {
             AppUtils.showErrorMessage(context, AppUtils.passwordValidationMessage);
            }
           else{
             _showMyDialog();
           }
          }, child:Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              margin: EdgeInsets.only(left: 20,right: 20),
              color: ColorUtils.colorBflight,
              child:  Container(
                alignment: Alignment.center,

                padding: EdgeInsets.all(15),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorUtils.colorBflight
                ),
                child: Text(AppUtils.login,style: WidgetUtils.textStyleViewBold(Colors.white, 14)),
              )),
          ),


        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
        title: Text(AppUtils.successfullyLoginMessage,style: WidgetUtils.textStyleViewBold(ColorUtils.colorBg, 16),),
        content: SingleChildScrollView(
          child: Column(
             children: [

               Text(cdate1,style: WidgetUtils.textStyleView1(ColorUtils.colorBg, 14),),
               SizedBox(height: 20,),
               Text(AppUtils.welcomeMessage+": "+emailController.text,style: WidgetUtils.textStyleView1(ColorUtils.colorBg, 14),),

             ],
          ),
        ),
          actions: <Widget>[
            TextButton(
              child:  Text(AppUtils.doneMessage,style: WidgetUtils.textStyleViewBold(ColorUtils.colorBg, 14),),
              onPressed: () {

                this.handler.initializeDB().whenComplete(() async {
                  await this.addUsers();
                  setState(() {});
                });


                Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard(api: Api(client: http.Client())),));
              },
            ),
          ],
        );
      },
    );
  }

  Future<int> addUsers() async {

    User firstUser = User(name: emailController.text,email: emailController.text);
    List<User> listOfUsers = [firstUser];
    return await this.handler.insertUser(listOfUsers);
  }

}