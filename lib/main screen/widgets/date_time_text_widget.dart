import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier_states.dart';
import 'package:intl/intl.dart';

class DateTimeTextWidget extends ConsumerWidget {
  const DateTimeTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(openWeatherStateNotifierProvider);

    if (state is OpenWeatherLoadedState) {
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(state.model.dt! * 1000)
              .toLocal();
      String formattedDateTime = DateFormat('EEEE, MMMM d y').format(dateTime);
      return Text(formattedDateTime,style: const TextStyle(color: Colors.white),);
    } else {
      return const Text('');
    }
  }
}
