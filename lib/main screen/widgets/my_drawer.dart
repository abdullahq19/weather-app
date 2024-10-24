import 'package:flutter/material.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_inputfield.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 100,),
          Expanded(flex: 2, child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: MyInputField())),
        ],
      ),
    );
  }
}