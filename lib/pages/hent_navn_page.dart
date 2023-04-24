import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class secondPage {
  final String chooseradio;
  final String writename;

  secondPage(this.chooseradio, this.writename);
}

class hent_navn_page extends StatefulWidget {
  const hent_navn_page({Key? key}) : super(key: key);

  @override
  State<hent_navn_page> createState() => _hent_navn_pageState();
}

class _hent_navn_pageState extends State<hent_navn_page> {
  String? _value = "Mother";
  bool isMotherSelected = false;
  String inputStr = "";
  List<String> list1 = [];
  List<String> list = ["Mother", "Father", "Cat", "Dog"];
  List<String> _motherNameList = ["Fatema", "MOhua", "sara"];
  List<String> _fatherNameList = ["Ataur", "MOhua", "sara"];
  String? dropdownValue;
  String dropdownValueFather = 'Ataur';

// these will be the values after selection of the item
  String? mothersName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SlutOpgaveHentNavnOgFarve'), leading: null),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),

        ),
        //select one item radio button

        for (int i = 0; i < list.length; i++)
          ListTile(
            title: Text(
              list[i],
            ),
            leading: Radio(
              value: list[i],

              // value er af typen object?, altså nullable
              groupValue: _value,
              onChanged: (theValue) async {
                List<String> list2 = [];
                if (theValue == "Mother") {
                  list2 = await getNames("mom");
                }
                if (theValue == "Father") {
                  list2 = await getNames("dad");
                }
                if (theValue == "Dog") {
                  list2 = await getNames("dog");
                }
                if (theValue == "Cat") {
                  list2 = await getNames("cat");
                }
                setState(() {
                  list1 = list2;
                  _value = theValue;
                });
              },
            ),
          ),
        if (list1.isNotEmpty)
          DropdownButton<String>(
            dropdownColor: Colors.blueGrey.shade700,
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.white),
            underline: Container(
              height: 2,
              color: Colors.blueGrey.shade900,
            ),
            onChanged: (String? newValue) async {
              setState(() {
                dropdownValue = newValue!;


              });
            },
            items: list1.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),



        Text("$_value" + "s Name"),
      /*  TextField(onChanged: (value) {
          inputStr = value;
        }),*/

        ElevatedButton(
          onPressed: () {
            _sendBackData(context);
          },
          //Navigator.pop(context);
          //},
          child: const Text('SEND'),
        ),
      ]
      ),
    );
  }

  void _sendBackData(BuildContext context) {
    setState(() {
      //String? textToSendBack = _value;
      //String textToSendBack= '$_value' +"'s Name: " + inputStr;
      secondPage sp = secondPage('$_value', dropdownValue!);
      Navigator.pop(context, sp);
    });
  }

  Future<List<String>> getNames(String name) async {
    List<String> names = [];
    // https://names.schl.ionnet.io/mom
    // https://names.schl.ionnet.io/dad
    // https://names.schl.ionnet.io/cat
    // https://names.schl.ionnet.io/dog
    final response =
        await http.get(Uri.parse('http://names.schl.ionnet.io/$name'));
    List<String> stringList =
        (jsonDecode(response.body) as List<dynamic>).cast<String>();
    return stringList;
  }
}
