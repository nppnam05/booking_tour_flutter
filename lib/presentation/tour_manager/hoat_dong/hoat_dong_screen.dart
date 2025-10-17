import 'package:flutter/material.dart';

class HoatDongScreen extends StatefulWidget {
  const HoatDongScreen({super.key});

  @override
  State<HoatDongScreen> createState() => _HoatDongScreenState();
}

class _HoatDongScreenState extends State<HoatDongScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  // TODO: Lấy Danh sách hoạt động từ Api gắn vào đây
  List<String> activities = [
    'leo núi',
    'bơi lội',
    'chơi cầu lông',
    'đi dạo',
    'xem phim',
    'nghe nhạc',
  ];
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            //TODO: trở về màn hình trước
          },
        ),
        title: const Text('Hoạt Động', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF23A892),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: ListTile(
                          title: Text(
                            activities[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            //TODO: Xử lý khi nhấn vào hoạt động
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    //TODO: Xử lý khi nhấn nút Thêm
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF23A892),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Thêm", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
