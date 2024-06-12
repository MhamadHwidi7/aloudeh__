import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/add_customer_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  _CustomersListScreenState createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: CustomersListTitle(),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.darkBlue,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(color: AppColors.darkBlue, height: 1.h),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight / 75),
          const CustomersListIntroText(),
          _dividerWithSpacing(screenHeight),
          const CustomersSearchField(),
          _dividerWithSpacing(screenHeight),
          const Expanded(
            child: CustomersListView(),
          ),
          const AddCustomerButtonWidget(),
        ],
      ),
    );
  }

  Widget _dividerWithSpacing(double screenHeight) {
    return Column(
      children: [
        SizedBox(height: screenHeight / 75),
        Divider(color: AppColors.darkBlue, height: 1.h),
        SizedBox(height: screenHeight / 75),
      ],
    );
  }
}

class CustomersListIntroText extends StatelessWidget {
  const CustomersListIntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello!',
            style: _textStyle(AppColors.yellow, FontWeight.bold),
          ),
          Text(
            'Here We will show Our Customers List',
            style: _textStyle(AppColors.darkBlue, FontWeight.bold),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(Color color, FontWeight fontWeight) {
    return TextStyle(
      color: color,
      fontFamily: 'Bahnschrift',
      fontSize: 16.sp,
      fontWeight: fontWeight,
    );
  }
}

class CustomersSearchField extends StatelessWidget {
  const CustomersSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        cursorColor: AppColors.darkBlue,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColors.lightBlue,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.darkBlue),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.darkBlue),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: AppColors.darkBlue,
            fontFamily: 'Bahnschrift',
          ),
        ),
      ),
    );
  }
}

class CustomersListView extends StatelessWidget {
  const CustomersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const CustomerListItem(),
      separatorBuilder: (context, index) => Divider(color: AppColors.darkBlue, height: 1.h),
      itemCount: 15,
    );
  }
}

class CustomersListTitle extends StatelessWidget {
  const CustomersListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Custo',
            style: _titleTextStyle(AppColors.yellow),
          ),
          TextSpan(
            text: 'mers ',
            style: _titleTextStyle(AppColors.darkBlue),
          ),
          TextSpan(
            text: 'Li',
            style: _titleTextStyle(AppColors.darkBlue),
          ),
          TextSpan(
            text: 'st',
            style: _titleTextStyle(AppColors.yellow),
          ),
        ],
      ),
    );
  }

  TextStyle _titleTextStyle(Color color) {
    return TextStyle(
      fontSize: 23.sp,
      fontFamily: 'ScriptMT',
      color: color,
    );
  }
}

class CustomerListItem extends StatelessWidget {
  final String customerName = 'Seba Taleaa';

  const CustomerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              customerName,
              style: _itemTextStyle(),
            ),
          ),
          _buildActionButton('View', AppColors.yellow, () {}),
          _buildActionButton('Edit', AppColors.darkBlue, () {}),
          _buildActionButton('Delete', AppColors.darkBlue, () {
            _deleteCustomer(context);
          }),
        ],
      ),
    );
  }

  TextStyle _itemTextStyle() {
    return TextStyle(
      fontFamily: 'Bahnschrift',
      fontWeight: FontWeight.bold,
      color: AppColors.darkBlue,
      fontSize: 16.sp,
    );
  }

  Widget _buildActionButton(String label, Color color, VoidCallback onPressed) {
    return Container(
      height: 35.h,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Bahnschrift',
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }

  void _deleteCustomer(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Do you want to delete this customer?",
          style: TextStyle(
            fontFamily: 'Bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 16.sp,
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontFamily: 'Bahnschrift',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'No',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontFamily: 'Bahnschrift',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
