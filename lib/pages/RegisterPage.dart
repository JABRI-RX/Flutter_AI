import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:tp/components/MyTextField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/auth.dart';
import 'package:tp/utilities/showToast.dart';

import '../components/MyButtonField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  //services

  var auth = AuthService();
  void register(String name,String email,String phone,String password){
    if(name.isEmpty ||
        password.isEmpty ||
        phone.isEmpty ||
        email.isEmpty
      ){
      showToast(context, "One Or Field is Empty", UIColors.red , ToastificationType.error);
      return;
    }
    //pass
    //

    auth.registerUser(name, email, password, phone).then((result){
      if(!mounted) return;

      showToast(context, result!, UIColors.green, ToastificationType.success);
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: const Text("Student Registration"),
      //   )
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text("Register",
                style: TextStyle(
                fontSize:40,
               ),
              ),
              const Text("Create your Account",
                style: TextStyle(
                  fontSize:20,
                ),
              ),
              const SizedBox(height: 100),
        
              Mytextfield(
                txtbox: name,
                hintText: "FullName",
                obsecureText: false,
                color: UIColors.black,
                icon: Icons.person_2,
              ),
              const SizedBox(height: 20,),
              Mytextfield(
                txtbox: email,
                hintText: "Email",
                obsecureText: false,
                color: UIColors.black,
                icon: Icons.email,
        
              ),
              const SizedBox(height: 20,),
              Mytextfield(
                txtbox: phone,
                hintText: "Phone",
                obsecureText: false,
                color: UIColors.black,
                icon: Icons.phone,
        
              ),
              const SizedBox(height: 20,),
              Mytextfield(
                txtbox: password,
                hintText: "Password",
                obsecureText: true,
                color: UIColors.black,
                icon: Icons.password,
        
              ),
              const SizedBox(height: 30,),
              MyButton(
                text: "Register",
                onTap: (){
                  register(name.text,
                      email.text,
                      phone.text,
                      password.text);
        
                },
                bgcolor: UIColors.black,
                fgcolor: UIColors.white,
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, "/");
                },
                child: const Text("Already Have Account",
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