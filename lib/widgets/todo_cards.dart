import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final Size size;
  final String type;
  final Color foregroundColor;
  final Color backgroundColor;
  final String? dateInterval;
  final String? content;

  const TodoCard({
    Key? key,
    required this.size,
    required  this.type,
    required this.foregroundColor,
    required this.backgroundColor,
    this.dateInterval,
    this.content

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:8, horizontal: 15),
      margin: const EdgeInsets.only(top: 5),
      decoration:  BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))

      ),
      width: (content == null && dateInterval == null)? 150 : size.width-82,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(type, style: TextStyle(color: foregroundColor),),
              PopupMenuButton(
                child: Icon(Icons.more_horiz, color: foregroundColor,),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      onTap: () {},
                      child: const Text('Update'),
                    ),
                    PopupMenuItem(
                      value: 1,
                      onTap: () {},
                      child: const Text('Delete'),
                    )
                  ];

                },)
            ],
          ),
          (content != null)?Text(content!, style: const TextStyle(fontWeight: FontWeight.bold),):const SizedBox(),
          (dateInterval != null)?Text(dateInterval!, style: const TextStyle(color: Colors.grey),):const SizedBox(),
        ],
      ),
    );
  }
}


class AbstractCard extends StatelessWidget{
  final Size size;
  final String? content;
  final String? dateInterval;
  final String type;
  final Color backgroundColor;
  final Color foregroundColor;

  const AbstractCard({
    Key? key,
    required this.size,
    this.content,
    this.dateInterval,
    required this.type,
    required this.backgroundColor,
    required this.foregroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoCard(
      backgroundColor: backgroundColor,
      size: size,
      type: type,
      foregroundColor: foregroundColor,
      content: content,
      dateInterval: dateInterval,
    );
  }
}

class MeCard extends AbstractCard {
  const MeCard({
    Key? key,
    size,
    content,
    dateInterval,
  }) : super(key: key, size: size, content: content, dateInterval: dateInterval, type: "Me", backgroundColor: const Color(0xffe7fbff), foregroundColor: const Color(0xff89c8d3));

}

class FamilyCard extends AbstractCard {
  const FamilyCard({
    Key? key,
    size,
    content,
    dateInterval
  }) : super(key: key, size: size, content: content, dateInterval: dateInterval, type: "Family", backgroundColor: const Color(0xffffefed), foregroundColor: const Color(0xffdbaba0));


}

class MeetingCard extends AbstractCard {
   const MeetingCard({
    Key? key,
    size,
    content,
    dateInterval
  }) : super(key: key, size: size, content: content, dateInterval: dateInterval, type: "Meeting", backgroundColor: const Color(0xffffe7c2), foregroundColor: const Color(0xffd89d7d));


}

class WorkCard extends AbstractCard {

  const WorkCard({
    Key? key,
    size,
    content,
    dateInterval
  }) : super(key: key, size: size, content: content, dateInterval: dateInterval, type: "Work", backgroundColor: const Color(0xfff8effd), foregroundColor: const Color(0xffc7afdc),);


}
