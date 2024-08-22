import 'package:flutter/material.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_text.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_widget_row.dart';

class ParentContainerWidget extends StatelessWidget {
  const ParentContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(255, 0, 104, 189)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: const Center(
          child: Expanded(
            flex: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),

                Flexible(flex: 4, child: MyTextWidget()),
                Spacer(
                  flex: 2,
                ),
                Flexible(flex: 2, child: MyWidgetRow()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
