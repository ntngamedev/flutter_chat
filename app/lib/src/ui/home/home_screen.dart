import 'package:app/src/ui/common/app_state.dart';
import 'package:app/src/ui/home/home_controller.dart';
import 'package:app/src/ui/home/widgets/home_avatar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends AppState<HomeScreen, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            HomeAvatar(
              user: controller.authStore.state,
              onLogout: () => controller.authStore.logout(),
            ),
          ],
        ),
      ),
    );
  }
}