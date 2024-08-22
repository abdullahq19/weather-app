import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier_states.dart';

class DescriptionText extends ConsumerWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(openWeatherStateNotifierProvider);
    if (state is OpenWeatherInitialState) {
      return const Text('');
    }else if(state is OpenWeatherLoadingState){
      return const CupertinoActivityIndicator.partiallyRevealed();
    }else if (state is OpenWeatherLoadedState){
      return Text('Feels like ${state.model.main!.feelsLike!.toInt().toString().substring(0, 2)} °C', style: const TextStyle(color: Colors.white, fontSize: 13,fontWeight: FontWeight.w300),);
    }else{
      return Text((state as OpenWeatherErrorState).errorMessage);
    }
  }
}