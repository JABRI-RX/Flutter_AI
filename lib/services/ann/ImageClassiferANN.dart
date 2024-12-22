import 'package:flutter/foundation.dart';

class ImageClassiferANN {
  const ImageClassiferANN();
  // Sure here is the code to convert a List To TwoList
  static List<List<int>> convertListToTwoList(List<int> list, int devider) {
    List<List<int>> wholeTwoListed = List.empty(growable: true);
    List<int> row = List.empty(growable: true);
    int counter = 0;
    for (int i = 0; i < list.length; i++) {
      if (counter != devider - 1) {
        row.add(list[i]);
        counter++;
      } else {
        row.add(list[i]);
        int gray = (0.3 * row[0]  + 0.59 * row[1] + 0.11 * row[2] ).round();
        row = List.empty(growable: true);
        row.add(gray);
        wholeTwoListed.add(row);
        row = List.empty(growable: true);
        counter = 0;
      }
    }
    return wholeTwoListed;
  }
  // Sure here is the code to convert a List To ThreeList
  //width = 2
  //list = [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 109, 109, 109, 255]
  static List<List<List<int>>> convertRawListToThreeList(List<int> list,int width, int devider) {
    List<List<int>> twoList = convertListToTwoList(list,4);

    return List.empty();
  }
  //
  // static List<List<int>> convertRGBAtoGrayScaleList(
  //     List<int> buffer, int width) {
  //   List<List<int>> wholeGrayList = List.empty(growable: true);
  //   List<List<int>> rawRGBList = convertListToTwoList(buffer, 4);
  //   for (int i = 0; i < width*width; i++) {
  //     List<int> eachRowGray = List.empty(growable: true);
  //     // int(0.3*tst[0]+0.59*tst[1]+0.11*tst[2])
  //     int red  = rawRGBList[i][0];
  //     int green  = rawRGBList[i][1];
  //     int blue  = rawRGBList[i][2];
  //
  //     int grayScaleValue = (0.3 * red  + 0.59 * green + 0.11 * blue ).round()  ;
  //     wholeGrayList.add(eachRowGray);
  //   }
  //   return wholeGrayList;
  // }
}
