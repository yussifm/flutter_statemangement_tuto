import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod exam 3 Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

enum City {
  wa,
  accra,
  tamala,
  kumasi,
  tema,
}

typedef WeatherEmoji = String;

Future<WeatherEmoji> getWeather(City city) async {
  return Future.delayed(
      const Duration(seconds: 2),
      (() => {
            City.accra: '🌨️',
            City.kumasi: '⛈️',
            City.tamala: '🌦️',
            City.wa: '💨',
          }[city]!));
}

// wiil be change by / base on the UI, # UI writes & reads to it
final currentCityProvider = StateProvider<City?>(((ref) => null));

// UI read from this
final weatherProvider = FutureProvider<WeatherEmoji>(((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return '🤷‍♂️☁️';
  }
}));

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            currentWeather.when(
              data: ((data) => Text(
                    data,
                    style: const TextStyle(fontSize: 50),
                  )),
              error: (error, stackTrace) => const Text(
                'there was an error 🤷‍♂️😒 getting weather data',
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: City.values.length,
                    itemBuilder: ((context, index) {
                      final city = City.values[index];
                      final isSelected = city == ref.watch(currentCityProvider);
                      return ListTile(
                        title: Text(
                          city.toString(),
                        ),
                        trailing: isSelected ? const Icon(Icons.check) : null,
                        onTap: () {
                          ref
                              .read(
                                currentCityProvider.notifier,
                              )
                              .state = city;
                        },
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
