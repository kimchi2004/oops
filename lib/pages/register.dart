import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ecommerce_prj/pages/myhomepage.dart';

class register extends StatefulWidget {
  register({super.key});


  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String userName = "TAP";

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordAgainController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  _buildMessageDialog() {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.WARNING,
            title: 'Tài khoản này đã tồn tại!',
            btnOkText: 'Đóng',
            btnOkIcon: Icons.check,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => register()));
            },
            btnOkColor: Colors.yellowAccent,
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
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(children: [
                Image.asset(
                  "assets/mobileShop.jpg",
                  width: 400,
                  height: 400,
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
                TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty)
                      return ("Mật khẩu không được để trống");
                  }),
                  obscureText: true,
                  controller: passwordAgainController,
                  decoration: InputDecoration(
                      hintText: "Vui lòng nhập lại mật khẩu",
                      label: Text("Nhập lại mật khẩu",style: TextStyle(fontSize: 20)),
                      prefixIcon: Icon(Icons.key,  color:Color.fromARGB(255, 27, 53, 131),)),
                ),
                InkWell(
                  // thêm sự kiện cho button
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (formKey.currentState!.validate()) {
                        if (userNameController.text != userName && passwordAgainController.text == passwordController.text) {
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
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 27, 53, 131),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Đăng ký",
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