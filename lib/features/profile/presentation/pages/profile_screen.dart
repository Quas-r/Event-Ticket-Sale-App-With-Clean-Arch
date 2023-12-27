import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/profile/presentation/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    width: 120,
                    height: 150,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/events/daftpunk.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.themeColor),
                      child: const Icon(
                        Icons.image,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Umut Ulaş Demir",
                  style: customFont(fontSize: 30, fontWeight: FontWeight.w600)),
              Text("umutulasdemir.uud@gmail.com",
                  style: customFont(fontSize: 13, fontWeight: FontWeight.w400)),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.scaffoldColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text("EditProfile",
                      style: customFont(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.themeColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details", icon: Icons.wallet, onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management", icon: Icons.person, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: AppColors.headerColor,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
