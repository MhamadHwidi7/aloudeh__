
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/warehouse_profile_entity.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/warehouse_profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WarehouseProfileScreen extends StatefulWidget {
  const WarehouseProfileScreen({super.key});

  @override
  _WarehouseProfileScreenState createState() => _WarehouseProfileScreenState();
}

class _WarehouseProfileScreenState extends State<WarehouseProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProfileWarehouseCubit>().emitGetProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileWarehouseCubit, GetState<WarehouseProfileEntity>>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(error),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile',style: TextStyle(color: AppColors.yellow),),
            backgroundColor: AppColors.darkBlue,
          ),
          body: state.maybeWhen(
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (profile) => _buildProfileContent(profile),
            orElse: () => const Center(child: Text('Something went wrong')),
          ),
        );
      },
    );
  }

  Widget _buildProfileContent(WarehouseProfileEntity profile) {
    final data = profile.profileData;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.darkBlue,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            data.rank,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.email_outlined, data.email),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.phone_outlined, data.phoneNumber.toString()),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.home_outlined, data.address),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.cake_outlined, data.birthDate),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: () {
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blueAccent,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //   ),
          //   child: const Text('Edit Information'),
          // ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 20,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[50],
            ),
            child: Text(
              info,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
