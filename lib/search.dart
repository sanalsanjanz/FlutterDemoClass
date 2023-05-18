// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TimeOfDay time = const TimeOfDay(hour: 8, minute: 45);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*  actions: [
          Stack(
            children: const [
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  child: Text('5'),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
        ], */
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SelectableText('${time.hour}:${time.minute}'),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 3,
            bottom: 5,
            child: ElevatedButton(
                onPressed: () async {
                  TimeOfDay? newTime =
                      await showTimePicker(context: context, initialTime: time);
                  if (newTime != '') {
                    setState(() {
                      time = newTime as TimeOfDay;
                    });
                  }
                },
                child: const Text('Choose Time')),
          )
        ],
      ),
    );
  }
}
