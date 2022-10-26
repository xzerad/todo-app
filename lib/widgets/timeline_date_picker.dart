import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineDatePicker extends StatefulWidget {
  const TimelineDatePicker({Key? key}) : super(key: key);

  @override
  State<TimelineDatePicker> createState() => _TimelineDatePickerState();
}

class _TimelineDatePickerState extends State<TimelineDatePicker> {
  late ScrollController _controller;
  DateTime startDate = DateTime(2020, 12, 6);
  late DateTime selectedDate;
  double diff = 0.0;
  @override
  initState(){
    _controller = ScrollController();
    var now = DateTime.now();
    selectedDate = DateTime(now.year, now.month, now.day);
    diff = selectedDate.difference(startDate).inDays.toDouble();
    Future.delayed(Duration.zero, () => setState((){_controller.jumpTo(diff*54.9);}));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    DateTime date ;
    return ListView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (buildContext, index){
          date = startDate.add(Duration(days: index));
          bool isDateSelected = (date.compareTo(selectedDate) == 0);
          return GestureDetector(
            onTap: (){
              setState((){
                selectedDate = startDate.add(Duration(days: index));
              });
            },
            child: Container(
              width: 54.9,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: isDateSelected?Colors.redAccent: Colors.white,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  CircleAvatar(backgroundColor: const Color(0xfff5f6fc),
                    foregroundColor: Colors.black,child: Text(date.day.toString().padLeft(2, "0")),),

                  Text(DateFormat(DateFormat.ABBR_WEEKDAY).format(date), style: TextStyle(color: isDateSelected?Colors.white:Colors.black),)
                ],
              ),
            ),
          );

        });
  }

}
