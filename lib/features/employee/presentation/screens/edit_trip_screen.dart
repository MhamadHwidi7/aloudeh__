// import 'package:aloudeh_company/core/error/network_exceptions.dart';
// import 'package:aloudeh_company/core/global/base_entity.dart';
// import 'package:aloudeh_company/core/global_states/post_state.dart';
// import 'package:aloudeh_company/features/employee/data/params/edit_trip_params.dart';
// import 'package:aloudeh_company/features/employee/presentation/controller/edit_trip_cubit.dart';
// import 'package:aloudeh_company/features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart';
// import 'package:aloudeh_company/features/employee/presentation/controller/get_all_trips_paginated_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:aloudeh_company/core/constants/colors_constants.dart';

// class DividerSpaceItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(height: 10.h);
//   }
// }

// class EditTripScreen extends StatefulWidget {
//   final String manifestNumber;
//   String status;
//   final String destination;
//   String dateTrip;
//   final String tripId;
//   EditTripScreen({
//     super.key,
//     required this.manifestNumber,
//     required this.status,
//     required this.destination,
//     required this.dateTrip,
//     required this.tripId,
//   });

//   @override
//   _EditTripScreenState createState() => _EditTripScreenState();
// }

// class _EditTripScreenState extends State<EditTripScreen> {
//   late DateTime selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     selectedDate = DateTime.now();
//   }

//   void _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2018),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         widget.dateTrip = DateFormat('yyyy-MM-dd').format(selectedDate);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Align(
//           alignment: Alignment.centerRight,
//           child: TripInformationText(),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.chevron_left, color: AppColors.darkBlue),
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1.0),
//           child: DividerItem(),
//         ),
//       ),
//       body: Stack(
//         children: [
//           ListView(
//             children: [
//               SpaceItem(),
//               _buildHelloText(),
//               DividerSpaceItem(),
//               _buildInformationSection(),
//               DividerSpaceItem(),
//               SpaceItem(),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: _buildSaveButton(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHelloText() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Hello!',
//             style: TextStyle(
//               color: AppColors.yellow,
//               fontFamily: 'bahnschrift',
//               fontSize: 16.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             'Please Enter The Following Information',
//             style: TextStyle(
//               color: AppColors.darkBlue,
//               fontFamily: 'bahnschrift',
//               fontSize: 16.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInformationSection() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Information',
//             style: TextStyle(
//               color: AppColors.yellow,
//               fontSize: 17.sp,
//               fontFamily: 'bahnschrift',
//             ),
//           ),
//           SpaceItem(),
//           _buildInfoRow('Manifest', widget.manifestNumber),
//           SpaceItem(),
//           _buildDropdownField('Status', widget.status),
//           SpaceItem(),
//           _buildDateField('Date', widget.dateTrip),
//           SpaceItem(),
//           _buildInfoRow('Destination', widget.destination),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontFamily: 'bahnschrift',
//             color: AppColors.darkBlue,
//             fontSize: 16.sp,
//           ),
//         ),
//         SizedBox(width: 20.w),
//         Expanded(
//           child: Container(
//             height: 40.h,
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             decoration: BoxDecoration(
//               color: AppColors.mediumBlue,
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Center(
//               child: Text(
//                 value,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'bahnschrift',
//                   fontSize: 16.sp,
//                   color: AppColors.pureBlack,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDropdownField(String label, String value) {
//     List<String> statuses = ['temporary', 'closed', 'open'];

//     // Ensure widget.status is one of the allowed values
//     if (!statuses.contains(widget.status)) {
//       widget.status = statuses.first;
//     }

//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontFamily: 'bahnschrift',
//             color: AppColors.darkBlue,
//             fontSize: 16.sp,
//           ),
//         ),
//         SizedBox(width: 20.w),
//         Expanded(
//           child: Container(
//             height: 40.h,
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             decoration: BoxDecoration(
//               color: AppColors.yellow,
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Center(
//               child: DropdownButton<String>(
//                 value: widget.status,
//                 underline: SizedBox(),
//                 icon: Icon(Icons.arrow_drop_down, color: AppColors.pureBlack),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     widget.status = newValue!;
//                   });
//                 },
//                 items: statuses.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyle(
//                         fontFamily: 'bahnschrift',
//                         fontSize: 16.sp,
//                         color: AppColors.pureBlack,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDateField(String label, String date) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontFamily: 'bahnschrift',
//             color: AppColors.darkBlue,
//             fontSize: 16.sp,
//           ),
//         ),
//         SizedBox(width: 20.w),
//         Expanded(
//           child: GestureDetector(
//             onTap: () => _selectDate(context),
//             child: Container(
//               height: 40.h,
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               decoration: BoxDecoration(
//                 color: AppColors.mediumBlue,
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//               child: Center(
//                 child: Text(
//                   date,
//                   style: TextStyle(
//                     fontFamily: 'bahnschrift',
//                     fontSize: 16.sp,
//                     color: AppColors.pureWhite,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSaveButton() {
//     return Container(
//       width: double.infinity,
//       child: BlocConsumer<EditTripCubit, PostState<BaseEntity>>(
//         listener: (context, state) {
// state.whenOrNull(success: (data) {
//       context.read<GetAllActiveTripsPaginatedCubit>().emitGetAllActiveTrips();

//   Navigator.pop(context);
// },
// error: (networkExceptions) =>  Fluttertoast.showToast(
//       msg: NetworkExceptions.getErrorMessage(networkExceptions),
//       toastLength: Toast.LENGTH_SHORT,
//     ),
// );
//         },
//         builder: (context, state) {
//           return state.maybeWhen(
//             orElse: () => FloatingActionButton(
//               onPressed: () {
//                 context.read<EditTripCubit>().emitEditTrip(
//                         editTripParams: EditTripParams(
//                       tripId: widget.tripId,
//                       status: widget.status,
//                       arrivalDate: widget.dateTrip,
//                     ));
//               },
//               child: Text(
//                 'Save',
//                 style: TextStyle(
//                   fontFamily: 'bahnschrift',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0.sp,
//                   color: AppColors.mediumBlue,
//                 ),
//               ),
//               backgroundColor: AppColors.darkBlue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(37.r),
//                   topLeft: Radius.circular(37.r),
//                 ),
//               ),
//             ),loading: () => CupertinoActivityIndicator(),idle: () => FloatingActionButton(
//               onPressed: () {
//                 context.read<EditTripCubit>().emitEditTrip(
//                         editTripParams: EditTripParams(
//                       tripId: widget.tripId,
//                       status: widget.status,
//                       arrivalDate: widget.dateTrip,
//                     ));
//               },
//               child: Text(
//                 'Save',
//                 style: TextStyle(
//                   fontFamily: 'bahnschrift',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0.sp,
//                   color: AppColors.mediumBlue,
//                 ),
//               ),
//               backgroundColor: AppColors.darkBlue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(37.r),
//                   topLeft: Radius.circular(37.r),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(37.r),
//         color: AppColors.darkBlue,
//       ),
//     );
//   }
// }

// class TripInformationText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: 'Tri',
//             style: TextStyle(
//               fontSize: 23.sp,
//               fontFamily: 'ScriptMT',
//               color: AppColors.yellow,
//             ),
//           ),
//           TextSpan(
//             text: 'p Inform',
//             style: TextStyle(
//               fontSize: 23.sp,
//               fontFamily: 'ScriptMT',
//               color: AppColors.darkBlue,
//             ),
//           ),
//           TextSpan(
//             text: 'ation',
//             style: TextStyle(
//               fontSize: 23.sp,
//               fontFamily: 'ScriptMT',
//               color: AppColors.yellow,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SpaceItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       height: screenHeight / 50,
//     );
//   }
// }

// class DividerItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Divider(
//       color: AppColors.mediumBlue,
//       height: 1.h,
//     );
//   }
// }
