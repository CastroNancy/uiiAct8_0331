import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TabBar, Entrepaginas o Drawer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeda6a6),
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Fig1'),
            Tab(text: 'Fig2'),
            Tab(text: 'Fig3'),
            Tab(text: 'Fig4'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Circulo
          Container(
            //  padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffff0000),
              border: Border.all(width: 5, color: Color(0xff69100a)),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff91a4b4),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                ),
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            width: 250,
            height: 300,
            constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 100,
              maxHeight: 300,
              maxWidth: 300,
            ),
          ),

          // rectangulo
          Container(
            //  padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffff0000),
              border: Border.all(width: 5, color: Color(0xff69100a)),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff91a4b4),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                ),
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            width: 150,
            height: 150,
            child: Text(
              "",
              style: TextStyle(fontSize: 25, color: Color(0xffffffff)),
            ),
            constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 100,
              maxHeight: 100,
              maxWidth: 100,
            ),
          ),

          // Triangulo
          Container(
            alignment: Alignment.center,
            child: CustomPaint(
              size: Size(250, 250),
              painter: TrianglePainter(),
            ),
          ),

          //cuadrado

          Container(
            //  padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffff0000),
              border: Border.all(width: 5, color: Color(0xff69100a)),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff91a4b4),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                ),
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            width: 150,
            height: 200,

            constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 100,
              maxHeight: 300,
              maxWidth: 300,
            ),
            transform: Matrix4.skew(0.2, -0.2)..rotateZ(0.9),
            transformAlignment: Alignment.center,
            foregroundDecoration: BoxDecoration(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xffff0000)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Dibujar borde
    final borderPaint = Paint()
      ..color = Color(0xff69100a) // Color del borde
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5; // Ancho del borde

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint); // Dibujar el borde
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
