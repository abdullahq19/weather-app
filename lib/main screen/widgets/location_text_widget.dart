import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier_states.dart';

class LocationTextWidget extends ConsumerWidget {
  const LocationTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(openWeatherStateNotifierProvider);
    if (state is OpenWeatherLoadedState) {
      return Text('${state.model.name}, ${state.model.sys!.country}', style: const TextStyle(color: Colors.white),);
    } else {
      return const Text('');
    }
  }
}
