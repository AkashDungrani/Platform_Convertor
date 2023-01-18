import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/models/Globals.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  DateTime currentdate = DateTime.now();
  TimeOfDay currenttime = TimeOfDay.now();
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octomber",
    "November"
    "December",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          (Globals.isios == true)
              ? SizedBox(
                  height: 100,
                )
              : SizedBox(
                  height: 1,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "${currentdate.day},${months[currentdate.month - 1]},${currentdate.year}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          (Globals.isios == true)
              ? SizedBox(
                  height: 8,
                )
              : SizedBox(
                  height: 1,
                ),
          Container(
              width: double.infinity,
              // color: Colors.blueGrey,
              child: (Globals.isios == false)
                  ? ElevatedButton(
                      onPressed: () async {
                        DateTime? pickeddate = await showDatePicker(
                          errorInvalidText: "Please Select Valid Date !!!",
                          fieldHintText: "Please Select Date You Want",
                          fieldLabelText: "Please Select Date You Want",
                          context: context,
                          initialDate: currentdate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                          cancelText: "Dismiss",
                          confirmText: "Done",
                          helpText: "Choose Any Date",
                          initialDatePickerMode: DatePickerMode.day,
                        );
                        setState(() {
                          if (pickeddate != null) {
                            currentdate = pickeddate;
                          }
                        });
                      },
                      child: Text(
                        "Change Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    )
                  : CupertinoButton.filled(
                      child: Text("Change Date"),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 220,
                                color: Colors.white,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (datetime) {
                                    setState(() {
                                      currentdate = datetime;
                                    });
                                  },
                                  initialDateTime: currentdate,
                                  maximumYear: 2050,
                                  minimumYear: 2000,
                                ),
                              );
                            });
                      }
                      )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                (currenttime.hour > 12)
                    ? "${currenttime.hour - 12}:${currenttime.minute} ${currenttime.period.name}"
                    : "${currenttime.hour}:${currenttime.minute} ${currenttime.period.name}",
                // "${currentdate.hour},${currentdate.minute},${currentdate.second}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          (Globals.isios == false)?SizedBox(height: 1,):SizedBox(height: 8,),
          (Globals.isios == false)
              ? Container(
                  width: double.infinity,
                  // color: Colors.blueGrey,
                  child: ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? pickedtime = await showTimePicker(
                        context: context,
                        initialTime: currenttime,
                        builder: (context, widget) {
                          return MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: false,
                              ),
                              child: widget!);
                        },
                      );
                      setState(() {
                        if (pickedtime != null) {
                          currenttime = pickedtime;
                        }
                      });
                    },
                    child: Text(
                      "Change Time",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ))
              : Container(
                width: double.infinity,
                child: CupertinoButton.filled(
                    child: Text("Change Time"),
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 220,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (datetime) {
                                  int hour = datetime.hour;
                                  int minute = datetime.minute;

                                  setState(() {
                                    currenttime =
                                        TimeOfDay(hour: hour, minute: minute);
                                  });
                                },
                                initialDateTime: currentdate,
                                maximumYear: 2050,
                                minimumYear: 2000,
                              ),
                            );
                          });
                    },
                    ),
              ),
        ],
      ),
    );
  }
}
