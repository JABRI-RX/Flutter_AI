import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';
import 'package:tp/components/MyButtonField.dart';
import 'package:tp/components/MyTextField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/auth.dart';
import 'package:tp/utilities/showToast.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool is_Loading = false;
  AuthService authService = AuthService();
  var logger = Logger();
  void login(String email,String password){

    if(email.isEmpty || password.isEmpty){
      showToast(context, "One Of the fields is empty", UIColors.red, ToastificationType.error);
      return;
    }
    setState(() {
      is_Loading = true;
    });
    authService.loginUser(email, password).then((result){
      if(!mounted) return;
      if(result !="success"){
        setState(() {
          is_Loading = false;
        });
        showToast(context, result, UIColors.red, ToastificationType.error);
        return;
      }
      Navigator.pushReplacementNamed(context, "/main");
    });

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //     title: const Center(
      //       child: const Text(" login"),
      //     )
      // ),
      backgroundColor: UIColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text("Welcome Back",
                style: TextStyle(
                  fontSize:40,
                ),
              ),
              is_Loading ? const CircularProgressIndicator(): Text(""),
              const SizedBox(height: 100),
        
              Mytextfield(
                txtbox: email,
                hintText: "Email",
                obsecureText: false,
                color: UIColors.black,
                icon: Icons.email,
              ),
              const SizedBox(height: 20,),
              Mytextfield(
                txtbox: password,
                hintText: "Password",
                obsecureText: true,
                color: UIColors.black ,
                icon: Icons.password,
              ),
              const SizedBox(height: 100),
              MyButton(
                text: "Login",
                onTap: (){
                  login(email.text.trim(),password.text.trim());
                  logger.d("Button clicked");
                },
                bgcolor: UIColors.black,
                fgcolor: UIColors.white,
              ),
              const SizedBox(height: 10),
              InkWell(onTap: (){
                Navigator.pushNamed(context,'/registerPage');
              },
              child: const Text("Dont Have Account ? ",
                style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}