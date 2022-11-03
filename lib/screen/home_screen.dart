
import 'package:blood_bank/utils/ApplicationMemory.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApplicationMemory.removeValues(ApplicationMemory.KEY_NID);
    ApplicationMemory.removeValues(ApplicationMemory.KEY_MOBILE_NO);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('home screen')),
    );
  }
}
