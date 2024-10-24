import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier_states.dart';

class MyWidgetRow extends ConsumerWidget {
  const MyWidgetRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(openWeatherStateNotifierProvider);
    if (state is OpenWeatherLoadedState) {
      return Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.air),
                Text('${state.model.wind!.speed!.toInt().toString()}km/h'),
                const Text('Wind'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.water_drop_outlined),
                Text('${state.model.main!.humidity}%',
                    style: Theme.of(context).textTheme.bodyLarge),
                const Text('Humidity'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_outlined),
                Text(
                  '${state.model.clouds!.all}%',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Text('Precipitation'),
              ],
            ),
          ]));
    } else {
      return const Text('');
    }
  }
}
