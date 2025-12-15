import 'package:flutter/material.dart';
import '../component/AppBarComponent.dart';
import '../component/BottomBarComponent.dart';

class StudentView extends StatelessWidget {
  final List<Map<String, dynamic>> studentList = [
    {
      "id": 1,
      "name": "Nguyễn Tấn Đạt",
      "class": "22DTHC4",
      "score": 8.5,
      "image": "upload/z7328681223066_c13a8ad76c73dad1a566ceb1b9ea53ae.jpg",
    },
    {
      "id": 2,
      "name": "Lê Huy",
      "class": "22DTHC4",
      "score": 7.5,
      "image": "upload/z7328701984261_38c9920931761083d88c4d1779e8f722.jpg",
    },
    {
      "id": 3,
      "name": "Hồng Duy Điền",
      "class": "22DTHC4",
      "score": 9.0,
      "image": "upload/z7328764870945_c1184b33996d39d55963f16f0ed54682.jpg",
    },
    {
      "id": 4,
      "name": "Trần Tấn Tới",
      "class": "22DTHC4",
      "score": 8.0,
      "image": "upload/z7328780676756_9b45a154f7ea2e7c1fbabe694262d4e5.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent("Danh Sách Sinh Viên"),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return _buildStudentCard(context, studentList[index]);
        },
      ),
      bottomNavigationBar: BottomBarComponent(),
    );
  }

  Widget _buildStudentCard(BuildContext context, Map<String, dynamic> student) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/studentDetail',
            arguments: student,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(student['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Họ tên: ${student['name']}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Lớp: ${student['class']}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Điểm: ${student['score']}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
