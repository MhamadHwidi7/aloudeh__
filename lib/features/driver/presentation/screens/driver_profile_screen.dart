import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/driver/data/entity/driver_profile_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/edit_profile_params.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/edit_driver_profile_cubit.dart';
import 'package:aloudeh_company/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class DriverProfileScreen extends StatefulWidget {
//   const DriverProfileScreen({super.key});

//   @override
//   _DriverProfileScreenState createState() => _DriverProfileScreenState();
// }

// class _DriverProfileScreenState extends State<DriverProfileScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<DriverProfileCubit>().emitGetDriverProfile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Driver Profile',style: TextStyle(color: AppColors.yellow),),
//         backgroundColor: AppColors.darkBlue,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: BlocBuilder<DriverProfileCubit, GetState<BaseDriverProfileEntity>>(
//         builder: (context, state) {
//           return state.maybeWhen(
//             success: (data) => _buildProfileView(data.driverProfileEntity.first),
//             orElse: () => const Center(child: CupertinoActivityIndicator()),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildProfileView(DriverProfileEntity profile) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//           elevation: 4.0,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 _buildProfileHeader(profile),
//                 const SizedBox(height: 20),
//                 _buildProfileDetails(profile),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileHeader(DriverProfileEntity profile) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 50,
//           backgroundColor: AppColors.mediumBlue,
//           child: Icon(
//             Icons.person,
//             color: AppColors.darkBlue,
//             size: 50,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           profile.name,
//           style: const TextStyle(
//             color: AppColors.darkBlue,
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           'Driver',
//           style: TextStyle(
//             color: AppColors.mediumBlue,
//             fontSize: 18.0,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildProfileDetails(DriverProfileEntity profile) {
//     return Column(
//       children: [
//         _buildProfileRow(Icons.phone, 'Phone Number', profile.phoneNumber),
//         const Divider(color: AppColors.mediumBlue),
//         _buildProfileRow(Icons.home, 'Address', profile.address),
//         const Divider(color: AppColors.mediumBlue),
//         _buildProfileRow(Icons.date_range, 'Employment Date', profile.employmentDate),
//       ],
//     );
//   }

//   Widget _buildProfileRow(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.darkBlue),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               label,
//               style: const TextStyle(
//                 color: AppColors.darkBlue,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//               color: AppColors.mediumBlue,
//               fontSize: 16.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        title: const Text(
          'Driver Profile',
          style: TextStyle(color: AppColors.yellow),
        ),
        backgroundColor: AppColors.darkBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _showLogoutDialog,
          ),
        ],
      ),
      body: BlocBuilder<DriverProfileCubit, GetState<BaseDriverProfileEntity>>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (data) =>
                _buildProfileView(data.driverProfileEntity.first),
            orElse: () => const Center(child: CupertinoActivityIndicator()),
          );
        },
      ),
    );
  }

  void _showLogoutDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Logout Confirmation',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Are you sure you want to log out?',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16.sp,
              ),
            ),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _logout();
              },
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    SharedPreferencesUtils().removeToken();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => const RoleSelectionScreen())); // Example navigation
  }

  Widget _buildProfileView(DriverProfileEntity profile) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildProfileHeader(profile),
                const SizedBox(height: 20),
                _buildProfileDetails(profile),
                const SizedBox(height: 20),
                CupertinoButton.filled(
                    child: const Text("Edit"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditDriverProfileScreen(
                                    profile: profile,
                                  )));
                    })
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
        const CircleAvatar(
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
        const Text(
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
        _buildProfileRow(
            Icons.date_range, 'Employment Date', profile.employmentDate),
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

class EditDriverProfileScreen extends StatefulWidget {
  final DriverProfileEntity profile;

  const EditDriverProfileScreen({Key? key, required this.profile})
      : super(key: key);

  @override
  _EditDriverProfileScreenState createState() =>
      _EditDriverProfileScreenState();
}

class _EditDriverProfileScreenState extends State<EditDriverProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _phoneController = TextEditingController(text: widget.profile.phoneNumber);
    _addressController = TextEditingController(text: widget.profile.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<EditDriverProfileCubit>().emitEditDriverProfile(editDriverProfileParams: EditDriverProfileParams( name: _nameController.text, address: _addressController.text, phoneNumber:_phoneController.text));
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(color: AppColors.yellow)),
        backgroundColor: AppColors.darkBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(_nameController, 'Name', Icons.person),
                    const Divider(color: AppColors.mediumBlue),
                    _buildTextField(
                        _phoneController, 'Phone Number', Icons.phone,
                        keyboardType: TextInputType.phone),
                    const Divider(color: AppColors.mediumBlue),
                    _buildTextField(_addressController, 'Address', Icons.home),
                    const SizedBox(height: 20),
                    BlocConsumer<EditDriverProfileCubit, PostState<BaseEntity>>(
                      listener: (context, state) {
state.whenOrNull(
   error: (NetworkExceptions exception) {
                      Fluttertoast.showToast(
                        msg: NetworkExceptions.getErrorMessage(exception),
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
  success: (data) {
      Fluttertoast.showToast(
                        msg: data.message,
                        toastLength: Toast.LENGTH_SHORT,
                      );
    context.read<DriverProfileCubit>().emitGetDriverProfile();
    Navigator.pop(context);
  },
);                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                         loading: () => const Center(child: CupertinoActivityIndicator(),),
                          idle: () => CupertinoButton.filled(
                          onPressed: _saveProfile,
                          child: const Text('Save'),
                        ),
                            orElse: () => CupertinoButton.filled(
                                  onPressed: _saveProfile,
                                  child: const Text('Save'),
                                ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppColors.darkBlue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $label';
          }
          return null;
        },
      ),
    );
  }
}
