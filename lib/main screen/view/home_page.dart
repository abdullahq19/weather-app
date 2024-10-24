import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_appbar_widget.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_drawer.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/parent_container_widget.dart';

class ASDS extends StatefulWidget {
  const ASDS({super.key});

  @override
  State<ASDS> createState() => ASDSState();
}

class ASDSState extends State<ASDS> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(openWeatherStateNotifierProvider.notifier).fetchWeather();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(),
        drawer: MyDrawer(),
        body: Column(
          children: [
            ParentContainerWidget(),
          ],
        ));
  }
}
