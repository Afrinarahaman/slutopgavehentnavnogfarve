import 'package:flutter/material.dart';

import 'package:slutopgavehentnavnogfarve/pages/hent_farve_page.dart';
import 'package:slutopgavehentnavnogfarve/pages/hent_navn_page.dart';
//import './pages/hent_navn_page.dart';

import 'main.dart';
import 'pages/hent_navn_page.dart';


String textFromradio_secondpage= '';
String textFromTextField_secondpage='';
int myColor=0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'SlutOpgaveHentNavenOgFarve'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});



  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textFromSecond = 'Here comes the name';

  //final secondPage sp2= secondPage();
  int textFromThird = 0;
  String getName="";



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
     
        title: Text(widget.title),
      ),      body: Center(
        // Center isa layout widget. It takes a single child and positions it
        // in the midle of the parent.
        child: Column(       // Column is also a layout widget. It takes a list of children and

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Get One Names and Color"),

            ElevatedButton(
              child: Text('Get Ones Name'),

              onPressed: () {
                _awaitReturnValueFromSecondScreen(context);
              }
            ),
            Text(
                textFromSecond,

               //style:TextStyle(fontSize: 18, backgroundColor: textFromThird.toColor()),
               style:TextStyle(backgroundColor: Color(textFromThird))
              // style:TextStyle(color: getColorFromHex(textFromThird))
            ),
            ElevatedButton(
                child: Text('Get Ones Color'),

                onPressed: () {
                  _awaitReturnValueFromThirdScreen(context);
                }
            ),




          ],
        ),
      ),

    );
  }
  void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    final secondPage spresult = await Navigator.push(
        context, MaterialPageRoute(
      builder: (context) => const hent_navn_page(), )); // after the SecondScreen result comes back update the Text widget with it
      setState(()

      { textFromradio_secondpage=spresult.chooseradio;
        textFromTextField_secondpage=spresult.writename;
        textFromSecond=  spresult.chooseradio +"'s Name: " +spresult.writename;

      //textFromSecond= '${textFromSecond.}s Name: ${result.writename}';
      });

}
  void _awaitReturnValueFromThirdScreen(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(
      builder: (context) => hent_farve_page(text: textFromradio_secondpage)));
   // after the SecondScreen result comes back update the Text widget with it
    setState(()
    {
      textFromThird = result;
    //myColor = int.parse("0xff$textFromThird");
    print(myColor);



    });

  }



}

