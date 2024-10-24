import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier_states.dart';
import 'package:flutter_riverpod_api/main%20screen/widgets/description_text.dart';

class MyTextWidget extends ConsumerWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(openWeatherStateNotifierProvider);
    if (state is OpenWeatherInitialState) {
      return const Text(
        '',
        style: TextStyle(color: Colors.white),
      );
    } else if (state is OpenWeatherLoadingState) {
      return const CircularProgressIndicator();
    } else if (state is OpenWeatherLoadedState) {
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${state.model.main!.temp!.toInt().toString().substring(0, 2)} °C',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w500)),
            Text(
              '${state.model.main!.tempMax!.toInt().toString().substring(0, 2)} °C / ${state.model.main!.tempMin!.toInt().toString().substring(0, 2)} °C',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: const DescriptionText(),
            )
          ],
        ),
      );
    } else {
      return Text((state as OpenWeatherErrorState).errorMessage);
    }
  }
}
