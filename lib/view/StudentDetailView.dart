import 'package:flutter/material.dart';

class StudentDetailView extends StatelessWidget {
  String _getStudentImagePath(String name) {
    switch (name) {
      case 'Trần Tấn Tới':
        return 'upload/DetailIMG/z7328925259011_c53c96f9c05692abf6ec8bccf53a50cb.jpg';
      case 'Lê Huy':
        return 'upload/DetailIMG/z7328925273734_0d649b45fc35307c770814d0fc9f656d.jpg';
      case 'Nguyễn Tấn Đạt':
        return 'upload/DetailIMG/z7328925278514_9f0d183475699d1d6636267b8fa0029e.jpg';
      case 'Hồng Duy Điền':
        return 'upload/DetailIMG/z7328925293250_13ed1154124dd1eb492db87f3854a5ca.jpg';
      default:
        return 'upload/DetailIMG/z7328925293250_13ed1154124dd1eb492db87f3854a5ca.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> student =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    print('Loading image for student: ${student['name']}');
    print('Image path: ${_getStudentImagePath(student['name'])}');

    return Scaffold(
      appBar: AppBar(
        title: Text('THẺ SINH VIÊN', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'HUTECH UNIVERSITY',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                'ĐẠI HỌC CÔNG NGHỆ TP.HCM',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              Divider(color: Colors.grey, height: 30),
              
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 150,
                      child: Image.asset(
                        _getStudentImagePath(student['name']),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return Container(
                            color: Colors.grey[200],
                            child: Icon(Icons.person, size: 50, color: Colors.grey[400]),
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('HỌ VÀ TÊN', student['name'].toUpperCase()),
                          SizedBox(height: 10),
                          _buildInfoRow('NGÀY SINH', '30/05/2004'),
                          SizedBox(height: 10),
                          _buildInfoRow('MSSV', student['id'].toString().padLeft(10, '0')),
                          SizedBox(height: 10),
                          _buildInfoRow('KHÓA', '2022 - 2026'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text(
                'HUTECH - NƠI ƯƠM MẦM TÀI NĂNG',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}