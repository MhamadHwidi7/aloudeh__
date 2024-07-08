import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/employee/data/entity/employee_profile.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_profile_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/show_all_branches_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/show_customers_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/truck_screen.dart';
import 'package:aloudeh_company/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class EmployeeMainScreen extends StatefulWidget {
  const EmployeeMainScreen({super.key});

  @override
  State<EmployeeMainScreen> createState() => _EmployeeMainScreenState();
}

class _EmployeeMainScreenState extends State<EmployeeMainScreen> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    AboutUsScreen(),
    const ProfileScreen(),
    const CategoriesScreen(),
  ];


void _showOptions(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        'Options',
        style: TextStyle(
          fontFamily: 'Bauhaus',
          color: AppColors.darkBlue,
          fontSize: 18.sp,
        ),
      ),
      content: Column(
        children: [
          _buildOptionTile(context, CupertinoIcons.settings, 'Settings', () {
            // Navigator.of(context).pop(); // Close the dialog
            // Navigate to settings
          }),
          _buildOptionTile(context, CupertinoIcons.power, 'Log Out', () {
SharedPreferencesUtils().removeToken();
Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const RoleSelectionScreen()));

          }),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.yellow,
              fontSize: 16.sp,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    ),
  );
}

Widget _buildOptionTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.darkBlue),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: MainScreenTitle(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_active, color: AppColors.darkBlue),
        ),
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon: const Icon(Icons.chevron_left, color: AppColors.darkBlue),
        // ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.darkBlue, height: 1.0),
        ),
        actions: [
          IconButton(
            onPressed: () => _showOptions(context),
            icon: const Icon(Icons.more_vert, color: AppColors.darkBlue),
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          _buildNavigationBar(screenHeight),
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
    );
  }

  ClipRRect _buildNavigationBar(double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(100.r),
        bottomRight: Radius.circular(100.r),
      ),
      child: Container(
        height: screenHeight / 1.5,
        child: RotatedBox(
          quarterTurns: 3,
          child: BottomNavigationBar(
            backgroundColor: AppColors.darkBlue,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: AppColors.yellow,
            unselectedItemColor: AppColors.pureWhite,
            items: [
              _buildBottomNavigationBarItem(Icons.details_outlined, 'About Us'),
              _buildBottomNavigationBarItem(Icons.person_outlined, 'Profile'),
              _buildBottomNavigationBarItem(Icons.home_outlined, 'Home'),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: AppColors.pureWhite),
      activeIcon: Icon(icon, color: AppColors.yellow),
      label: label,
    );
  }
}

class MainScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          _buildTextSpan('Ma', AppColors.yellow),
          _buildTextSpan('in ', AppColors.darkBlue),
          _buildTextSpan('Sc', AppColors.darkBlue),
          _buildTextSpan('reen', AppColors.yellow),
        ],
      ),
    );
  }

  TextSpan _buildTextSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 23.sp,
        fontFamily: 'ScriptMT',
        color: color,
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AboutUsSection(),
        SizedBox(height: 20.h),
        const Divider(),
        SizedBox(height: 20.h),
        CompanyInfoSection(),
        BranchInfoSection(),
        SizedBox(height: 20.h),
      ],
    );
  }
}


class AboutUsSection extends StatelessWidget {
  final String bio = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildTitle('Who Are We?'),
            SizedBox(height: 20.h),
            _buildBioText(bio),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Bauhaus',
        color: AppColors.yellow,
        fontSize: 18.sp,
      ),
    );
  }

  Widget _buildBioText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'bahnschrift',
        color: AppColors.darkBlue,
        fontSize: 16.sp,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
    );
  }
}

class BranchInfoSection extends StatelessWidget {
  final String branchDesk = 'Aleppo, street 16';
  final String branchManager = 'Seba Taleaa';
  final String branchAddress = 'Seba Taleaa';
  final String branchMobile = '+963 988022813';
  final String openingDate = '25/07/2001';
  final String closingDate = '_';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildInfoRow(context, 'Desk', branchDesk, screenWidth / 9),
          _buildInfoRow(context, 'Address', branchAddress, screenWidth / 25),
          _buildInfoRow(context, 'Manager', branchManager, screenWidth / 30, onTap: () {
            // Navigate to ViewBranchManagerScreen
          }),
          _buildInfoRow(context, 'Mobile', branchMobile, screenWidth / 13),
          _buildInfoRow(context, 'Opening Date', openingDate, screenWidth / 20),
          _buildInfoRow(context, 'Closing Date', closingDate, screenWidth / 20),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, double spacing, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.mediumBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'bahnschrift',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyInfoSection extends StatelessWidget {
  final String companyLocation = 'Aleppo, street 16';
  final String companyManager = 'Seba Taleaa';
  final String companyContact = '+963 988022813';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildInfoRow('Location', companyLocation, screenWidth / 25),
          _buildInfoRow('Manager', companyManager, screenWidth / 25),
          _buildInfoRow('Contact', companyContact, screenWidth / 16),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, double spacing, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.mediumBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'bahnschrift',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProfileCubit>().emitGetProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit, GetState<EmployeeProfile>>(
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
          body: state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (profile) => _buildProfileContent(profile),
            orElse: () => const Center(child: Text('Something went wrong')),
          ),
        );
      },
    );
  }

  Widget _buildProfileContent(EmployeeProfile profile) {
    final data = profile.profileData;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          Text(data.rank, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.email_outlined, data.email),
          _buildInfoRow(Icons.phone_outlined, data.phoneNumber),
          _buildInfoRow(Icons.home_outlined, data.address),
          _buildInfoRow(Icons.cake_outlined, data.birthDate),
          const SizedBox(height: 16),
          _buildRatingBar(data.rating.toDouble()),
          const SizedBox(height: 16),
          _buildEditButton(),
          const SizedBox(height: 16),
          _buildSectionTitle('Vacations'),
          const SizedBox(height: 16),
          _buildVacationsList(data.vacations),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 23,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.all(8.0),
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31),
                color: Colors.lightBlue[50],
              ),
              child: Center(
                child: Text(
                  info,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'bahnschrift',
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(double rating) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 24.0,
      direction: Axis.horizontal,
    );
  }

  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle edit information
      },
      child: const Text('Edit Information'),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.amber,
        fontFamily: 'bahnschrift',
        fontSize: 17.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildVacationsList(List<VacationEntity> vacations) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vacations.length,
      itemBuilder: (context, index) {
        final vacation = vacations[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVacationRow('Start:', vacation.start),
              _buildVacationRow('End:', vacation.end),
              _buildVacationRow('Reason:', vacation.reason),
              _buildVacationRow('Duration:', _calculateDuration(vacation.start, vacation.end)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVacationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$label ',
            style: const TextStyle(
              color: Colors.blue,
              fontFamily: 'Bauhaus',
              fontSize: 17.0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'bahnschrift',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  String _calculateDuration(String start, String end) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd'); 
    final DateTime startDate = formatter.parse(start);
    final DateTime endDate = formatter.parse(end);
    final Duration duration = endDate.difference(startDate);
    final int days = duration.inDays;

    return '$days days';
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // NotificationAndReportSection(),
            // SizedBox(height: screenHeight / 30),
            // SearchSection(),
            SizedBox(height: screenHeight / 50),
            TellUsSection(),
            CategoryItem(
              imagePath: 'assets/images/Trips-List.png',
              title: 'Trips List',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TripsListForEmployee()));
              },
            ),
            CategoryItem(
              imagePath: 'assets/images/Trucks-List.png',
              title: 'Trucks List',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TruckListScreen()));
              },
            ),
            CategoryItem(
              imagePath: 'assets/images/Customers-List.png',
              title: 'Customers List',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowAllCustomersScreen()));
              },
            ),
            CategoryItem(
              imagePath: 'assets/images/Company-Branches.png',
              title: 'Company Branches',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowAllBranchesScreen()));
              },
            ),
            CategoryItem(
              imagePath: 'assets/images/Reports-List.png',
              title: 'Reports List',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// class NotificationAndReportSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40.h,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildFloatingActionButton(context, Icons.notifications, 'noti'),
//           _buildFloatingActionButton(context, Icons.report_problem, 'repo'),
//           _buildFloatingActionButton(context, Icons.language, 'lang', text: 'EN'),
//         ],
//       ),
//     );
//   }

//   FloatingActionButton _buildFloatingActionButton(BuildContext context, IconData icon, String heroTag, {String? text}) {
//     return FloatingActionButton(
//       onPressed: () {},
//       shape: const CircleBorder(side: BorderSide(color: AppColors.darkBlue)),
//       backgroundColor: AppColors.pureWhite,
//       elevation: 0.0,
//       heroTag: heroTag,
//       child: text != null
//           ? Text(
//               text,
//               style: const TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold),
//             )
//           : Icon(icon, color: AppColors.darkBlue),
//     );
//   }
// }

class TellUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tell us',
          style: TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
            fontFamily: 'Bauhaus',
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'where do you want to go?',
          style: TextStyle(
            color: AppColors.darkBlue,
            fontFamily: 'bahnschrift',
            fontSize: 18.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// class SearchSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40.h,
//       child: TextFormField(
//         cursorColor: AppColors.darkBlue,
//         decoration: InputDecoration(
//           isDense: true,
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.darkBlue),
//             borderRadius: BorderRadius.all(Radius.circular(50.r)),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.darkBlue),
//             borderRadius: BorderRadius.all(Radius.circular(50.r)),
//           ),
//           hintText: 'Search',
//           hintStyle: const TextStyle(
//             color: AppColors.darkBlue,
//             fontFamily: 'Bahnschrift',
//           ),
//           prefixIcon: const Icon(Icons.search, color: AppColors.darkBlue),
//         ),
//       ),
//     );
//   }
// }

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const CategoryItem({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.r,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 130.h,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(18.r),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage(imagePath),
              width: 166.w,
              height: 166.h,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.directions, color: AppColors.darkBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
