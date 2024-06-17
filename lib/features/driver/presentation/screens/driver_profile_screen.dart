import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/driver/data/entity/driver_profile_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_profile_cubit.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  _DriverProfileScreenState createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DriverProfileCubit>().emitGetDriverProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Profile',style: TextStyle(color: AppColors.yellow),),
        backgroundColor: AppColors.darkBlue,
      ),
      body: BlocBuilder<DriverProfileCubit, GetState<BaseDriverProfileEntity>>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (data) => _buildProfileView(data.driverProfileEntity.first),
            orElse: () => const Center(child: CupertinoActivityIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildProfileView(DriverProfileEntity profile) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildProfileHeader(profile),
                const SizedBox(height: 20),
                _buildProfileDetails(profile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(DriverProfileEntity profile) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.mediumBlue,
          child: Icon(
            Icons.person,
            color: AppColors.darkBlue,
            size: 50,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          profile.name,
          style: const TextStyle(
            color: AppColors.darkBlue,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Driver',
          style: TextStyle(
            color: AppColors.mediumBlue,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetails(DriverProfileEntity profile) {
    return Column(
      children: [
        _buildProfileRow(Icons.phone, 'Phone Number', profile.phoneNumber),
        const Divider(color: AppColors.mediumBlue),
        _buildProfileRow(Icons.home, 'Address', profile.address),
        const Divider(color: AppColors.mediumBlue),
        _buildProfileRow(Icons.date_range, 'Employment Date', profile.employmentDate),
      ],
    );
  }

  Widget _buildProfileRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.darkBlue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.mediumBlue,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
