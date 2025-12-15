
import 'package:flutter/material.dart';
import 'package:kiemtraflutter/component/BottomBarComponent.dart';
import 'package:kiemtraflutter/model/StudentModel.dart';

import '../Utils.dart';
import '../component/AppBarComponent.dart';
import '../component/SlideProductView.dart';

class HomeView extends StatelessWidget {
  List<StudentModel> studentList = [];
  HomeView() {
    getProduct();
  }
  void getProduct() {
    for (int i = 0; i < 100; i++) {
      int index = i % 2 + 1;
      studentList.add(
        StudentModel(
          (i + 1),
          "product ${(i + 1)}",
          "Assets/Images/nq${index}.jpg",
          "22dthc4",
          7,
        ),
      );
    }
  }
  void clickProductItem(int id){
    print("id: ${id}");
    BuildContext? context = Utils.navigatorKey.currentContext!;
    Navigator.pushNamed(context, '/productDetail', arguments: {"Id": id});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBarComponent("Home"),
      body: Column(
        children: [
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 150,
            child: SlideProductView(),
          ),
          SizedBox(height: 5),
          Text(
            "Danh Sách Sản Phẩm ",
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 0.8,
                mainAxisSpacing: 0.8,
              ),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      return clickProductItem(studentList[index].Id);
                    },

                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          width: screenWidth * 0.495,
                          height: screenWidth * 0.495,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(
                                "${studentList[index].ImageUrl}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text("${studentList[index].fullName}"),
                        Text("${studentList[index].Class}"),
                        Text("${studentList[index].score}")
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarComponent(),
    );
  }
}
