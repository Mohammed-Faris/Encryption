import 'package:flutter/material.dart';

class Expandablelist extends StatefulWidget {
  const Expandablelist({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ExpandablelistState createState() => _ExpandablelistState();
}

class _ExpandablelistState extends State<Expandablelist> {
  // selected's value = 0. For default first item is open.
  int selected = 0; //attention

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ExpansionTile Collapse',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              key: Key('builder ${selected.toString()}'), //attention
              padding:
                  const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(children: <Widget>[
                  const Divider(
                    height: 17.0,
                    color: Colors.white,
                  ),
                  ExpansionTile(
                    key: Key(index.toString()), //attention
                    initiallyExpanded: index == selected, //attention

                    leading: const Icon(
                      Icons.person,
                      size: 50.0,
                      color: Colors.black,
                    ),
                    title: Text('ExpansionTile $index',
                        style: const TextStyle(
                            color: Color(0xFF09216B),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                    subtitle: const Text(
                      'Software Engineer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onExpansionChanged: ((newState) {
                      if (newState) {
                        setState(() {
                          const Duration(seconds: 20000);
                          selected = index;
                        });
                      } else {
                        setState(() {
                          selected = -1;
                        });
                      }
                    }),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'DETAİL $index \n' 'Expanded',
                        ),
                      )
                    ],
                  ),
                ]);
              },
            )
          ]),
        ),
      ),
    );
  }
}
