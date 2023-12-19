import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ecommerce_prj/pages/myhomepage.dart';
import 'package:ecommerce_prj/pages/register.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});


  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String userName = "tap";
  String password = "123";


  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  _buildMessageDialog() {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.ERROR,
            title: 'Thông tin đăng nhập không đúng!',
            btnOkText: 'Đóng',
            btnOkIcon: Icons.check,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => loginPage()));
            },
            btnOkColor: Colors.red,
            buttonsBorderRadius: BorderRadius.circular(20))
        .show();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                Image.asset(
                  "assets/mobileShop.jpg",
                  width:350,
                  height: 350,
                ),
                TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty)
                      return ("Tên đăng nhập không được để trống");
                  }),
                  controller: userNameController,
                  decoration: InputDecoration(
                      hintText: "Vui lòng nhập tên đăng nhập",
                      label: Text("Tên đăng nhập", style: TextStyle(fontSize: 20)),
                      prefixIcon: Icon(Icons.person, color:Color.fromARGB(255, 27, 53, 131),)),

                ),
                TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty)
                      return ("Mật khẩu không được để trống");
                  }),
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Vui lòng nhập mật khẩu",
                      label: Text("Mật khẩu",style: TextStyle(fontSize: 20)),
                      prefixIcon: Icon(Icons.key,  color:Color.fromARGB(255, 27, 53, 131),)),
                ),
                Container(
                  padding: const EdgeInsets.only(top:15,left: 8.0, right: 8.0),
                  margin:  EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      text: "Bạn chưa có tài khoản? ",
                      style: TextStyle(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Đăng ký ngay",
                          style: TextStyle(fontSize: 16, color:Color.fromARGB(255, 27, 53, 131)),
                         recognizer: TapGestureRecognizer()
                          ..onTap = () {
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: ((context) => register())));})
                      ]
                    )
                    )
                        ),

                InkWell(
                  // thêm sự kiện cho button
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (formKey.currentState!.validate()) {
                        if (userNameController.text == userName && passwordController.text == password) {
                            var snackBar =
                                SnackBar(content: Text("Xin chào: ${userNameController.text}"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: ((context) => MyHomePage())));
                        }
                         else {
                           _buildMessageDialog();}
                    }
                    }
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 27, 53, 131),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Đăng nhập",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),

              ]),
            ),
          ),
        ),
      ),
    );
  }
}