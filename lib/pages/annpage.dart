import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:tp/components/MyButtonField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/ann/ImageClassiferANN.dart';
class Annpage extends StatefulWidget {
  const Annpage({super.key});

  @override
  State<Annpage> createState() => _AnnpageState();
}

class _AnnpageState extends State<Annpage> {
  final  ImagePicker picker = ImagePicker();
  late Widget image_or_placeolder = const Placeholder();
  final ImageClassiferANN imageClassiferANN =   ImageClassiferANN();
  bool isLoading = false;
  String result = "";
  //load model

  //classifi
  void processImage(XFile image) async{
    setState(() {
      isLoading = true;
      result = "";
    });
    imageClassiferANN.processAnnImage(image).then((res){
      result = res.data;
      isLoading = false;
      Logger().d(result);
      setState(() {});
    });
    Logger().d("Working ");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ann Model"),
      ),
      body: Column(
        children: [
          MyButton(
              text: "Open Camera",
              onTap: (){
                picker.pickImage(source: ImageSource.camera).then((img){
                  image_or_placeolder = Image.file( File(img!.path) ,width: 200,);
                  processImage(img);
                  setState(() {});
                });
              },
              padding: 10,
              bgcolor: UIColors.black,
              fgcolor: UIColors.white
          ),
          const SizedBox(height: 10,),
          MyButton(
            text: "Open Image Picker",
            onTap: (){
              picker.pickImage(source: ImageSource.gallery).then((img){
                image_or_placeolder = Image.file( File(img!.path) ,width: 200,);
                setState(() {});
                processImage(img);
              });
            },
            padding: 10,
            bgcolor: UIColors.white,
            fgcolor: UIColors.black,
            borderColor: UIColors.black,
            borderWidth: 3, 
          ),
          const SizedBox(height: 10,),
          Container(
            child: SingleChildScrollView(

              child: image_or_placeolder,
              ),
            ),
          isLoading ? const CircularProgressIndicator(): const Text(""),
          const Text("The Results"),
          Text(result)
        ],
      ),
    );
  }
}
