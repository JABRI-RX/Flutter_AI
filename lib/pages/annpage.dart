import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter/tflite_flutter_platform_interface.dart';
import 'package:tp/components/MyButtonField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:image/image.dart' as img;
import 'package:tp/services/ann/ImageClassiferANN.dart';
class Annpage extends StatefulWidget {
  const Annpage({super.key});

  @override
  State<Annpage> createState() => _AnnpageState();
}

class _AnnpageState extends State<Annpage> {
  final  ImagePicker picker = ImagePicker();
  late Interpreter _interpreter;
  late Widget image_or_placeolder = const Placeholder();
  //load model
  Future<void> loadModel() async{
    _interpreter = await Interpreter.fromAsset("assets/models/AnnModel.tflite");
    Logger().d("Model loading status ${_interpreter.getInputTensors()}");
  }

  //debuging this shit is fucking insane
  void showImagePixels(img.Image img ,int pi){
    var buf = img.buffer.asUint8List();
    final stringBuf = StringBuffer();
    for(var i =0; i<28*3;i++){
      stringBuf.write(buf[i]);
      stringBuf.write(" ");
    }
    Logger().d(stringBuf);
  }
  //classifi
  void processImage(XFile image) async{
    var imageBytes = await image.readAsBytes();
    var decodeImage = img.decodeImage(imageBytes);

    var resizedImage = img.copyResize(decodeImage!,width: 2,height: 2);

    var grayScaleImage = img.grayscale(resizedImage,amount: 1, maskChannel: img.Channel.luminance);
    var buf = grayScaleImage.buffer.asUint8List();
    // List<List<List<int>>>  new_list = ImageClassiferANN.convertRawListToThreeList(buf,2,4);
    List<List<int>> new_list = ImageClassiferANN.convertListToTwoList(buf, 4);
    // Logger().d(new_list);
    //predict
    var input = new_list;
    var output  = List.filled(9, 0).reshape([9]);
    Logger().d("The Results Are");
    // _interpreter.run(input, output);

    Logger().d(_interpreter.getInputTensors());
    Logger().d(_interpreter.getOutputTensors());
    // List<List<int>>  graysacledList = ImageClassiferANN.convertRGBAtoGrayScaleList(buf, 2);
    // Logger().d(graysacledList);
    // Logger().d("grayScaleImage ${grayScaleImage.data}");
    // Logger().d("Width of resizedImage is ${grayScaleImage.width}");
    // Logger().d("Numbers of channels is ${grayScaleImage.numChannels}");
    // // Logger().d();
    // showImagePixels(grayScaleImage, 28*4);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _interpreter.close();
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
                  setState(() {
                    image_or_placeolder = Image.file( File(img!.path) ,width: 200,);
                    processImage(img);
                  });
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
        ],
      ),
    );
  }
}
