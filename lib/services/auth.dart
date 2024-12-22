
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
class AuthService {

  final FirebaseAuth  firebase_instance = FirebaseAuth.instance;
  static int counter = 0;
  int get getCounter{return counter;}
  var logger = Logger();
  //user
  User? getCurrentUser(){
    return firebase_instance.currentUser;
}
  //
  Future<String?> registerUser(String name, String email,String password,String phone) async{
    try{
      UserCredential userCredential = await firebase_instance.createUserWithEmailAndPassword(
          email: email, password: password
      );
      //
      await userCredential.user?.updateDisplayName(name);
      // PhoneAuthCredential phoneAuthCredential;
      // await userCredential.user?.updatePhoneNumber(phone);
      await userCredential.user?.reload();
      return "";
    }
    on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        return "The Password provided is to weak.";
      }
      else if(e.code == "email-already-in-use"){
        return "Email Already in use";
      }
      else{
        return e.code;
      }
    }
  }
  //login
  Future<String> loginUser(String email,String password) async{
    counter++;
    try{
      await firebase_instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "success";
    }
    on FirebaseAuthException catch(e){
      if(e.code == "invalid-credential"){
        return "Email or Password is Wrong";
      }
      else if(e.code == "invalid-email"){
        return "Email is Invalid Correct it";
      }
      return e.code;
    }
  }
  Future<void> logout() async{
    await firebase_instance.signOut();
  }
}