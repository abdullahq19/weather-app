import 'package:flutter/material.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/date_time_text_widget.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/location_text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: const LocationTextWidget(),
      bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width * 0.4, 20),
          child: const DateTimeTextWidget()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
