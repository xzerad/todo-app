import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/timeline_date_picker.dart';
import 'dart:ui' as ui;

import '../widgets/todo_cards.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () { return Future.delayed(const Duration(seconds: 5), ()=>print("refreshed"));},
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Today", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10,),
                      Text(DateFormat("EEEE, dd MMM yyy").format(DateTime.now()), style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  Badge(
                    padding: const EdgeInsets.all(6),
                    position: BadgePosition.topEnd(top: 1, end: 0),
                    badgeContent: null,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        radius: 20,
                        foregroundImage: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.dXkj6U9p3sXMrDRl6Vqo7AHaHk%26pid%3DApi&f=1&ipt=43b23a076fc72d15cec3eecbaf43ee3d64e746851f6d8a124402ac93d46dc1f4&ipo=images").image,
                        // child:
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const SizedBox(
                  height: 90,
                  child: TimelineDatePicker()
              ),
              const SizedBox(height: 30,),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(size: const Size(50, (20-8)*60), painter: CustomTimeLine(starDate: 8, endDate: 20, ),),
                     Flexible(
                      fit: FlexFit.loose,
                       child: SizedBox(
                           height: (20-8)*60,
                           child: Stack(
                             children: [

                               Positioned(
                                   top: 10*0 + 3,
                                   child: MeCard(size: Size(size.width, 110),
                                     content: "Breakfast in cafe and relax",
                                     dateInterval: "08:00 am - 10:00 am",)
                               ),
                               Positioned(
                                   top: 10*18 + 3,
                                   child: FamilyCard(size: Size(size.width, 110),
                                     content: "Take a gift to Grandma",
                                     dateInterval: "10:30 am - 12:30 pm",)
                               ),
                               Positioned(
                                 top: 10*12*3 + 3,
                                   child: MeetingCard(size: Size(size.width, 50),)
                               ),
                               Positioned(
                                   top: 10*12*3 + 3,
                                    left: 155,
                                   child: WorkCard(size:
                                   Size(size.width - 150, 100,),
                                   content: "Dismiss project",
                                     dateInterval: "14:00 pm - 16:00 pm",
                                   )
                               ),
                               // const SizedBox(
                               //   height: (20-8)*50,
                               // ),
                             ],
                           )),
                     ),
                    // Column(
                    //   children:  [
                    //     SizedBox(
                    //       width: size.width-82,
                    //       height: 100,
                    //       child: ListView.builder(
                    //         itemCount: 1,
                    //         scrollDirection: Axis.horizontal,
                    //         itemBuilder: (BuildContext context, int index) {
                    //         return MeCard(size: size, content: 'Breakfast in cafe and relax', dateInterval: '08:00 am - 10:00 am',);}
                    //       ),
                    //
                    //     ),
                    //     const SizedBox(height: 50,),
                    //     SizedBox(
                    //       width: size.width-82,
                    //       height: 100,
                    //       child: ListView.builder(
                    //           itemCount: 1,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return FamilyCard(size: size, content: 'Take a gift to Grandma', dateInterval: '10:30 am - 12:30 am',);}
                    //       ),
                    //
                    //     ),
                    //     const SizedBox(height: 50,),
                    //     SizedBox(
                    //       width: size.width-82,
                    //       height: 100,
                    //       child: ListView.builder(
                    //           itemCount: 2,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return [
                    //               Padding(
                    //                 padding: const EdgeInsets.only(right: 8.0),
                    //                 child: Column(
                    //                   children: [
                    //                     SizedBox(height: 50, child: MeetingCard(size: size,)),
                    //                     const Expanded(child: SizedBox())
                    //                   ],
                    //                 ),
                    //               ),
                    //               WorkCard(size: size, content: "Dismiss project", dateInterval: "14:00 pm - 16: 00 pm")
                    //             ][index];}
                    //       ),
                    //
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              const SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}


class CustomTimeLine extends CustomPainter{
   int starDate;
   int endDate;


  CustomTimeLine({required this.starDate, required this.endDate}): super();

  @override
  void paint(Canvas canvas, Size size) {

    for( int i= starDate; i<= endDate; i+=2){
      Paint paint = Paint()..color = Colors.grey[300]! ..strokeWidth = 1 ..style = PaintingStyle.stroke;
      Path path = Path();
      TextPainter textPainter = TextPainter(text:  TextSpan(text: "${i.toString().padLeft(2, "0")} ${i >12 ?'pm': 'am'}" , style: TextStyle(color: i == starDate? Colors.red: Colors.black)), textDirection: ui.TextDirection.ltr);
      textPainter.layout();
      double textDy = (i - starDate)*60;
      textPainter.paint(canvas, Offset(0, textDy));
      if(i == endDate){
        break;
      }
      for(int j = 0; j<11; j++){
        double dx = 10.0;
        double dy = textDy + j* 10 + 18;
        if(j % 2 == 1){
          dx = 13.0;
        }
        path.moveTo(0, dy);
        path.lineTo(dx, dy);
      }


      path.close();
      canvas.drawPath(path, paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}
