import 'package:flutter/material.dart';
import 'package:kiemtraflutter/model/StudentModel.dart';
import 'package:kiemtraflutter/view/StudentView.dart';

import '../model/StudentModel.dart';

class SlideProductView extends StatelessWidget{
  List<StudentModel> productList = [];
  SlideProductView(){
    getProduct();
  }
  void getProduct(){
    for(int i = 0; i< 100; i++){
      int index = i%2 + 1;
      productList.add(StudentModel((i+1), "product ${(i+1)}", "Assets/Images/nq${index}.jpg", "", 5));
    }

  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return  Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
              image: DecorationImage( image: AssetImage("${productList[index].ImageUrl}"),
                  fit: BoxFit.cover
              )
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 10,);
      },
    );
  }

}