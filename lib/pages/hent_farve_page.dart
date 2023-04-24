import 'package:flutter/material.dart';


const List<String> listRed = <String>[
  '00',
  '10',
  '20',
  '30',
  '40',
  '50',
  '60',
  '70',
  '80',
  '90',
  'A0',
  'B0',
  'C0',
  'D0',
  'E0',
  'F0',
  'FF'
];
const List<String> listGreen = <String>[
  '00',
  '10',
  '20',
  '30',
  '40',
  '50',
  '60',
  '70',
  '80',
  '90',
  'A0',
  'B0',
  'C0',
  'D0',
  'E0',
  'F0',
  'FF'
];
const List<String> listBlue = <String>[
  '00',
  '10',
  '20',
  '30',
  '40',
  '50',
  '60',
  '70',
  '80',
  '90',
  'A0',
  'B0',
  'C0',
  'D0',
  'E0',
  'F0',
  'FF'
];
final TextEditingController selectCountryController = TextEditingController();

int myColor = 0;

class hent_farve_page extends StatefulWidget {
  final String text;

  //const hent_farve_page({required this.name  ,super.key});
  const hent_farve_page({Key? key, required this.text}) : super(key: key);

  @override
  State<hent_farve_page> createState() => _hentfarvepageState();

}

class _hentfarvepageState extends State<hent_farve_page> {
  TextEditingController textfield2 = TextEditingController();

  //final String text;
  String dropdownValueRed = '10';
  String dropdownValueGreen = '10';
  String dropdownValueBlue = '10';
  final textFromSecond_Radio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slutopgavehentnavnogfarve'),

      ),
      body: Center(


          child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children:[
          Text('${widget.text}'+"'s Color"),

          SizedBox(
            width: 500,
            height: 70,
            child: Container(
              color: Color(myColor),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Red"),

                    DropdownButton<String>
                      (
                      value: dropdownValueRed,

                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,

                      onChanged: (
                          String? value) { // This is called when the user selects an item.
                        setState(() {
                          dropdownValueRed = value!;
                          _makeColor();
                        });
                      },
                      items: listRed.map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(

                          value: value,

                          child: Text(value),

                        );
                      }).toList(),

                    ),
                    Text("Green"),
                    DropdownButton<String>
                      (
                      value: dropdownValueGreen,

                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      onChanged: (
                          String? value) { // This is called when the user selects an item.
                        setState(() {
                          dropdownValueGreen = value!;
                          _makeColor();
                        });
                      },
                      items: listGreen.map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(

                          value: value,

                          child: Text(value),

                        );
                      }).toList(),

                    ),
                    Text("Blue"),
                    DropdownButton<String>
                      (
                      value: dropdownValueBlue,

                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      onChanged: (
                          String? value) { // This is called when the user selects an item.
                        setState(() {
                          dropdownValueBlue = value!;
                          _makeColor();
                        });
                      },
                      items: listBlue.map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(

                          value: value,
                          child: Text(value),

                        );
                      }).toList(),

                    ),

                    ]
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendDataBack(context);
                  },
                  //Navigator.pop(context);
                  //},
                  child: const Text('Go back!'),


                ),
              ]
          )

      ),

    );
  }

  void _makeColor() {
    String textToSendBack = dropdownValueRed + dropdownValueGreen +
        dropdownValueBlue;
    print(textToSendBack);
    myColor = int.parse("0xff$textToSendBack");
  }

  void _sendDataBack(BuildContext context) {
    setState(() {
      String textToSendBack = dropdownValueRed + dropdownValueGreen +
          dropdownValueBlue;
      print(textToSendBack);
      myColor = int.parse("0xff$textToSendBack");
      Navigator.pop(context, myColor);
    });
  }
}

