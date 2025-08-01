// import 'package:flutter/material.dart';
// import 'package:sakan/core/widgets/custom_profile_button.dart';
// import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
// import 'package:sakan/features/profile/presentation/views/widgets/custom_drop_down_form_field.dart';
// import 'package:sakan/features/profile/presentation/views/widgets/custom_profile_text_field.dart';
// import 'package:sakan/features/profile/presentation/views/widgets/custom_user_info.dart';

// class ProfileBody extends StatelessWidget {
//   const ProfileBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 32),
//             CustomUserInfo(name: "test",email: "test",),
//             SizedBox(
//               height: 32,
//             ),
//             CustomChooseText(text: "Basic Info"),
//             SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomProfileTextField(title: "First Name"),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: CustomProfileTextField(title: "Last Name"),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             CustomDropDownFormField(),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(title: "Email"),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(title: "Phone Number"),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(title: "University"),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(title: "College"),
//             SizedBox(
//               height: 32,
//             ),
//             // CustomChooseText(text: "Additional Details"),
//             Align(
//               child: CustomProfileButton(
//                 title: "Delete Account",
//                 color: Color(0xffAA2117),
//               ),
//             ),
//             SizedBox(
//               height: 32,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_prefs_helper.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/profile/presentation/views/widgets/custom_profile_text_field.dart';
import 'package:sakan/features/profile/presentation/views/widgets/custom_user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

// class _OwnerProfileBodyState extends State<OwnerProfileBody> {
//   late TextEditingController firstNamecontroller;
//   late TextEditingController lastNamecontroller;
//   late TextEditingController nIdcontroller;
//   late TextEditingController addresscontroller;
//   late TextEditingController emailcontroller;
//   @override
//   void initState() {
//     firstNamecontroller = TextEditingController();
//     lastNamecontroller = TextEditingController();
//     nIdcontroller = TextEditingController();
//     addresscontroller = TextEditingController();
//     emailcontroller = TextEditingController();
//     firstNamecontroller.text = widget.fName;
//     lastNamecontroller.text = widget.lName;
//     nIdcontroller.text = widget.nationalnumber;
//     addresscontroller.text = widget.address;
//     emailcontroller.text = widget.email;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     firstNamecontroller.dispose();
//     lastNamecontroller.dispose();
//     nIdcontroller.dispose();
//     addresscontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 32),
//             CustomUserInfo(
//               name: firstNamecontroller.text,
//               email: emailcontroller.text,
//             ),
//             SizedBox(
//               height: 32,
//             ),
//             CustomChooseText(text: "Basic Info"),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(
//               title: "First Name",
//               controller: firstNamecontroller,
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(
//               title: "Last Name",
//               controller: lastNamecontroller,
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             // CustomDropDownFormField(),
//             // SizedBox(
//             //   height: 16,
//             // ),
//             CustomProfileTextField(
//               title: "Email",
//               controller: emailcontroller,
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(title: "Phone Number"),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(
//               title: "National ID",
//               controller: nIdcontroller,
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             CustomProfileTextField(
//               title: "Address",
//               controller: addresscontroller,
//             ),
//             // SizedBox(
//             //   height: 16,
//             // ),
//             // CustomProfileTextField(title: "College"),
//             SizedBox(
//               height: 32,
//             ),
//             // CustomChooseText(text: "Additional Details"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomProfileButton(
//                   title: "Delete Account",
//                   color: Color(0xffAA2117),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 CustomProfileButton(
//                   title: "Update Account",
//                   color: ksecondaryColor,
//                   onTap: (){
//                     AppPrefsHelper.saveUserInfo(firstName: firstName, lastName: lastName, email: email, nationalId: nationalId, address: address)
//                   },
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Align(
//               child: CustomProfileButton(
//                 title: "Log out",
//                 color: kPrimaryColor,
//                 onTap: () {
//                   GoRouter.of(context).go(AppRouter.studentOrOwner);
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 32,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _ProfileBodyState extends State<ProfileBody> {
  late TextEditingController firstNamecontroller;
  late TextEditingController lastNamecontroller;
  late TextEditingController nIdcontroller;
  late TextEditingController addresscontroller;
  late TextEditingController emailcontroller;
  late TextEditingController phoneNumbercontroller;
  late TextEditingController universitycontroller;
  late TextEditingController collegecontroller;
  late String fullName = "Name";

  @override
  void initState() {
    super.initState();
    firstNamecontroller = TextEditingController();
    lastNamecontroller = TextEditingController();
    nIdcontroller = TextEditingController();
    addresscontroller = TextEditingController();
    emailcontroller = TextEditingController();
    phoneNumbercontroller = TextEditingController();
    universitycontroller = TextEditingController();
    collegecontroller = TextEditingController();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final data = await AppPrefsHelper.loadUserInfo();
    final prefs = await SharedPreferences.getInstance();
    fullName = (await prefs.getString(AppPrefsHelper.keyfullName)) ?? "Name";
    universitycontroller.text =
        await prefs.getString(AppPrefsHelper.keyUniversity)!;
    collegecontroller.text = await prefs.getString(AppPrefsHelper.keyCollege)!;
    setState(() {
      firstNamecontroller.text = data[AppPrefsHelper.keyFirstName]!.isNotEmpty
          ? data['firstName']!
          : "";
      lastNamecontroller.text =
          data[AppPrefsHelper.keyLastName]!.isNotEmpty ? data['lastName']! : "";
      emailcontroller.text =
          data[AppPrefsHelper.keyEmail]!.isNotEmpty ? data['email']! : "";
      nIdcontroller.text = data[AppPrefsHelper.keyNationalId]!.isNotEmpty
          ? data['nationalId']!
          : "";
      addresscontroller.text =
          data[AppPrefsHelper.keyAddress]!.isNotEmpty ? data['address']! : "";
      phoneNumbercontroller.text =
          data[AppPrefsHelper.keyphoneNumber]!.isNotEmpty
              ? data['phoneNumber']!
              : "";
    });
  }

  @override
  void dispose() {
    firstNamecontroller.dispose();
    lastNamecontroller.dispose();
    nIdcontroller.dispose();
    addresscontroller.dispose();
    emailcontroller.dispose();
    universitycontroller.dispose();
    collegecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            CustomUserInfo(
              name: fullName,
              email: emailcontroller.text,
            ),
            const SizedBox(height: 32),
            const CustomChooseText(text: "Basic Info"),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "First Name",
              controller: firstNamecontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "Last Name",
              controller: lastNamecontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "Email",
              controller: emailcontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "Phone Number",
              controller: phoneNumbercontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "National ID",
              controller: nIdcontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "Address",
              controller: addresscontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "University",
              controller: universitycontroller,
            ),
            const SizedBox(height: 16),
            CustomProfileTextField(
              title: "University",
              controller: collegecontroller,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomProfileButton(
                  title: "Delete Account",
                  color: const Color(0xffAA2117),
                ),
                const SizedBox(width: 10),
                CustomProfileButton(
                  title: "Update Account",
                  color: ksecondaryColor,
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await AppPrefsHelper.saveUserInfo(
                        firstName: firstNamecontroller.text,
                        lastName: lastNamecontroller.text,
                        email: emailcontroller.text,
                        nationalId: nIdcontroller.text,
                        address: addresscontroller.text,
                        phoneNumber: phoneNumbercontroller.text);
                    await prefs.setString(AppPrefsHelper.keyUniversity,
                        universitycontroller.text);
                    await prefs.setString(
                        AppPrefsHelper.keyCollege, collegecontroller.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account info updated successfully"),
                      ),
                    );
                    GoRouter.of(context).go(AppRouter.propertyManagementView);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              child: CustomProfileButton(
                title: "Log out",
                color: kPrimaryColor,
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  AppPrefsHelper.clearUserInfo();
                  await prefs.remove(AppPrefsHelper.keyUniversity);
                  await prefs.remove(AppPrefsHelper.keyCollege);
                  GoRouter.of(context).go(AppRouter.studentOrOwner);
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
