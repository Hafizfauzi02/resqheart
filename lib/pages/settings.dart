import 'package:flutter/material.dart';
import 'package:resqheart/pages/authentication/login.dart';
import 'package:resqheart/pages/userprofile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 90, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
              SizedBox(width: 130,),
                Text("Settings", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            Expanded(
              child: ListView(
                      children: [
                        SettingsTile(icon: Icons.person_outline, text: "Account",
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Userprofile()));
                        },),
                        SettingsTile(icon: Icons.notifications_outlined, text: "Notifications"),
                        SettingsTile(icon: Icons.camera, text: "Camera Access"),
                        SettingsTile(icon: Icons.language, text: "Change Language"),
                        SettingsTile(icon: Icons.description_outlined, text: "Terms & Conditions"),
                        SettingsTile(icon: Icons.lock_outline, text: "Privacy Policy"),
                        SettingsTile(icon: Icons.info_outline, text: "About"),
                        SettingsTile(icon: Icons.logout, text: "Logout", color: Colors.red,
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                        },),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback? onTap;

  SettingsTile({required this.icon, required this.text, this.color = Colors.black, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: color),
          title: Text(
            text,
            style: TextStyle(fontSize: 16, color: color),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        Divider(height: 1, thickness: 0.5, color: Colors.grey[300]),
      ],
    );
  }
}
