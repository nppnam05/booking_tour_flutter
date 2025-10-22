// import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
// import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
// import 'package:booking_tour_flutter/domain/model/hoat_dong.dart';
// import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_cubit.dart';
// import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_state.dart';
// import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/them_dia_diem_hoat_dong_screen.dart';
// import 'package:booking_tour_flutter/presentation/tour_manager/sua_dia_diem_hoat_dong/sua_dia_diem_hoat_dong_screen.dart';
// import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar/search_bar_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DanhSachHoatDongScreen extends StatefulWidget {
//   const DanhSachHoatDongScreen({super.key});

//   @override
//   State<DanhSachHoatDongScreen> createState() => _DanhSachHoatDongScreenState();
// }

// class _DanhSachHoatDongScreenState extends State<DanhSachHoatDongScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   late final DanhSachHoatDongCubit _cubit;

//   @override
//   void initState() {
//     super.initState();
//     _cubit = DanhSachHoatDongCubit();
//     _cubit.getDanhSachHoatDong();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     _cubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: _cubit,
//       child: BlocBuilder<DanhSachHoatDongCubit, DanhSachHoatDongState>(
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: const Icon(Icons.menu, color: AppColors.white),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               title: const Text(
//                 'Danh Sách Hoạt Động',
//                 style: TextStyle(color: AppColors.white),
//               ),
//               backgroundColor: AppColors.button,
//               centerTitle: true,
//             ),
//             backgroundColor: AppColors.white,
//             body:
//                 state.status == DanhSachHoatDongStatus.loading
//                     ? const Center(child: CircularProgressIndicator())
//                     : _buildBody(state),
//             floatingActionButton: FloatingActionButton.extended(
//               onPressed: () => _navigateToAddScreen(),
//               backgroundColor: AppColors.button,
//               label: const Text(
//                 'Thêm hoạt động',
//                 style: TextStyle(color: AppColors.white),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildBody(DanhSachHoatDongState state) {
//     return GestureDetector(
//       onTap: () => _focusNode.unfocus(),
//       child: Container(
//         color: AppColors.white,
//         child: Column(
//           children: [
//             if (state.danhSachHoatDong.isNotEmpty)
//               _buildHeaderInfo(state.danhSachHoatDong.first),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//               child: SearchBarWidget(
//                 hintText: 'Tìm kiếm...',
//                 controller: _controller,
//                 onClear: _controller.clear,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: Container(
//                 color: AppColors.secondary.withOpacity(0.2),
//                 child: ListView.builder(
//                   itemCount: state.danhSachHoatDong.length,
//                   itemBuilder: (context, index) {
//                     final hoatDong = state.danhSachHoatDong[index];
//                     return _buildListItem(hoatDong);
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildListItem(HoatDong hoatDong) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         border: Border.all(color: AppColors.secondary.withOpacity(0.2)),
//       ),
//       child: ListTile(
//         leading: const Icon(Icons.location_on),
//         title: Text(
//           hoatDong.tenDiaDiem,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: AppFonts.fontSize16,
//           ),
//         ),
//         subtitle: Text(hoatDong.tinhThanh),
//         onTap: () => _navigateToEditScreen(hoatDong),
//       ),
//     );
//   }

//   Future<void> _navigateToAddScreen() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder:
//             (_) => BlocProvider.value(
//               value: _cubit,
//               child: const ThemDiaDiemHoatDongScreen(),
//             ),
//       ),
//     );

//     if (mounted) {
//       _cubit.getDanhSachHoatDong();
//     }
//   }

//   Future<void> _navigateToEditScreen(HoatDong hoatDong) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder:
//             (_) => BlocProvider.value(
//               value: _cubit,
//               child: SuaDiaDiemHoatDongScreen(),
//             ),
//       ),
//     );
//     if (mounted) {
//       _cubit.getDanhSachHoatDong();
//     }
//   }

//   Widget _buildHeaderInfo(HoatDong hoatDong) {
//     return Container(
//       color: AppColors.button.withOpacity(0.2),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 16.0, left: 8),
//         child: Column(
//           children: [
//             _buildInfoRow("Tên địa danh:", hoatDong.tenDiaDiem),
//             const SizedBox(height: 16),
//             _buildInfoRow("Tỉnh thành:", hoatDong.tinhThanh),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             const Icon(Icons.location_on),
//             const SizedBox(width: 4),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: AppFonts.fontSize16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 16.0),
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontSize: AppFonts.fontSize16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
