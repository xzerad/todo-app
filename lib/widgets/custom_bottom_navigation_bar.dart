import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Center(
              heightFactor: 0.6,
              child: SizedBox(height: 70 , width: 70 ,child: FloatingActionButton(onPressed: (){},backgroundColor: const Color(0xfff14a5b), child: const Icon(Icons.add),))
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.home, color: selectedTab == 0? Colors.white:null,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.category, color: selectedTab == 1? Colors.white:null)),
                SizedBox(width: size.width*.1,),
                IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: selectedTab == 2? Colors.white:null)),
                IconButton(onPressed: (){}, icon: Icon(Icons.person, color: selectedTab == 3? Colors.white:null)),

              ],
            ),
          )
        ],
      ),
    );
  }
}


class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffb09cec)..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 40);
    path.quadraticBezierTo(0, 0, size.width*0.15, 0);
    path.lineTo(size.width*0.37, 0);
    path.quadraticBezierTo(size.width*0.4, 0, size.width*0.4, 20);
    path.arcToPoint(Offset(size.width*0.6, 20), radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.63, 0);
    path.lineTo(size.width*0.85, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
