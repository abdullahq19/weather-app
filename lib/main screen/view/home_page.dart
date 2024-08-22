import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_appbar_widget.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/my_drawer.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/parent_container_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(openWeatherStateNotifierProvider.notifier).fetchWeather();
    },);
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
