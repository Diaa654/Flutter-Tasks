import 'package:flutter/material.dart';
import 'package:simple_profile_app/features/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: ClipOval(
          
         child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 105, 196, 239),
          ),
          child: Icon(Icons.add),
         ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 196, 239),
        centerTitle: true,
        title: Text("Flutter UI task"),
      ),
      body: SafeArea(child: ProfileViewBody()),
    );
  }
}