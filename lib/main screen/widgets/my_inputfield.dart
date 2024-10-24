import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';

class MyInputField extends ConsumerWidget {
  const MyInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        controller:
            ref.read(openWeatherStateNotifierProvider.notifier).controller,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade800,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          label: const Text('City'),
          labelStyle: TextStyle(color: Colors.grey.shade300),
          suffix: GestureDetector(
            onTap: () {
              ref
                  .read(openWeatherStateNotifierProvider.notifier)
                  .fetchWeather();
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
