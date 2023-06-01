import 'package:democlass/widgets/weatherProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class WeatherMap extends StatefulWidget {
  const WeatherMap({super.key});

  @override
  State<WeatherMap> createState() => _WeatherMapState();
}

class _WeatherMapState extends State<WeatherMap> {
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<WeatherProvider>(
          builder: (context, value, child) => Text(value.counter.toString()),
        ),
        backgroundColor: Colors.purple,
        actions: [
          Consumer<WeatherProvider>(
              builder: (context, data, chid) => TextButton(
                  onPressed: () {
                    data.increment();
                  },
                  child: const Text('add')))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: data.getCurrentWeather(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var value = snapshot.data;
                  return Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipPath(
                              clipper: WaveClipperOne(),
                              child: Image(
                                  image: NetworkImage(value['weather'][0]
                                              ['main'] ==
                                          'Clouds'
                                      ? 'https://images.pexels.com/photos/2114014/pexels-photo-2114014.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
                                      : 'https://images.pexels.com/photos/2734440/pexels-photo-2734440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                            ),
                            Positioned(
                                bottom: 30,
                                left: 20,
                                child: Text(
                                  value['weather'][0]['main'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child:
                                    Text(value['weather'][0]['description'])),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Enter city name'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
