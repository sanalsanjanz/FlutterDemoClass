// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController numController = TextEditingController();
  int currentpageIndex = 0;
  final DateTime _selectedDate = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 8, minute: 45);
  var result = 'search for something';
  bool isNum = true;
  bool isTriv = false;
  bool isDate = false;
  bool isYear = false;
  String date = '';
  String month = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                await Fluttertoast.showToast(
                    msg: 'qrftghj', gravity: ToastGravity.CENTER);
              },
              icon: const Icon(Icons.add)),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.purple),
          title: const Text('Num Check'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.purple[503],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                      child: isLoading
                          ? const SpinKitWaveSpinner(
                              color: Colors.deepPurple,
                            )
                          : Text(
                              result.toString(),
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                ),
              )),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    label: const Text('Number'),
                    selected: isNum,
                    onSelected: (value) {
                      setState(() {
                        isYear = false;
                        isNum = true;
                        isTriv = false;
                        isDate = false;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Trivia'),
                    selected: isTriv,
                    onSelected: (value) {
                      setState(() {
                        isYear = false;
                        isNum = false;
                        isTriv = true;
                        isDate = false;
                      });
                    },
                  ),
                  ChoiceChip(
                      label: const Text('Date'),
                      selected: isDate,
                      onSelected: (value) {
                        setState(() {
                          isYear = false;

                          isNum = false;
                          isTriv = false;
                          isDate = true;
                        });
                      }),
                  ChoiceChip(
                      label: const Text('Year'),
                      selected: isYear,
                      onSelected: (value) {
                        setState(() {
                          isYear = true;
                          isNum = false;
                          isTriv = false;
                          isDate = false;
                        });
                      })
                ],
              ),
              const Divider(),
              Visibility(
                visible: isNum || isTriv,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 14.0,
                            height: 0.5,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.purple[80],
                            filled: true,
                            hintText: isNum || isTriv
                                ? 'Enter a number'
                                : isDate
                                    ? 'enter date'
                                    : 'choose an option'),
                        controller: numController,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await getResponse(
                            day: date,
                            month: month,
                            type: isNum
                                ? 'math'
                                : isTriv
                                    ? 'trivia'
                                    : 'date',
                            num: numController.text == ''
                                ? 'random'
                                : numController.text);
                        numController.clear();
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isDate,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text('Choose Date'),
                    onPressed: () async {
                      DateTime? selected = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2020),
                        firstDate: DateTime(1998),
                        lastDate: DateTime(2020),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary:
                                    Colors.purple, // header background color
                                onPrimary: Colors.white, // header text color
                                onSurface: Colors.green, // body text color
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.red, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (selected != null) {
                        setState(() {
                          date = DateFormat.d().format(selected).toString();
                          month = DateFormat.M().format(selected).toString();
                        });
                        await getResponse(
                            num: '', type: 'date', day: date, month: month);
                      }
                    },
                  ),
                ),
              ),
              Visibility(
                visible: isYear,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text('Choose Year'),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Select Year"),
                            content: SizedBox(
                              width: 300,
                              height: 300,
                              child: YearPicker(
                                firstDate:
                                    DateTime(DateTime.now().year - 100, 1),
                                lastDate:
                                    DateTime(DateTime.now().year + 100, 1),
                                initialDate: DateTime.now(),
                                selectedDate: _selectedDate,
                                onChanged: (DateTime dateTime) async {
                                  print(dateTime.year);
                                  await getResponse(
                                          type: 'year',
                                          num: dateTime.year.toString())
                                      .then((value) => Navigator.pop(context));
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              /*   ElevatedButton(
                onPressed: () async {
                 
                },
                child: const Text('Get Result'),
              ), */
            ],
          ),
        ));
  }

  Future getResponse(
      {required String num,
      required String type,
      String? month,
      String? day}) async {
    setState(() {
      isLoading = true;
    });
    var url = isDate
        ? 'http://numbersapi.com/$month/$day/$type'
        : 'http://numbersapi.com/$num/$type';

    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        result = response.body;
      });
    }
  }
}
/*   */