// import 'package:flutter/material.dart';
// import 'package:storagesecure/models/panelitem.dart';

// class Expandablelist extends StatefulWidget {
//   const Expandablelist({super.key});

//   @override
//   State<Expandablelist> createState() => _ExpandablelistState();
// }

// class _ExpandablelistState extends State<Expandablelist> {
//   final List<PanelItem> _panelItems = [
//     PanelItem(
//       headerText: 'Panel 1',
//       bodyText: 'Content of Panel 1',
//     ),
//     PanelItem(
//         headerText: 'Panel 2', bodyText: 'Content of Panel 2', Expanded: true),
//     PanelItem(headerText: 'Panel 3', bodyText: 'Content of Panel 3'),
//     PanelItem(headerText: 'Panel 4', bodyText: 'Content of Panel 4'),
//   ];

//   void _handleExpansion(int index) {
//     setState(() {
//       _panelItems[index].Expanded = !_panelItems[index].Expanded;
//     });
//   }

//   final int _expandedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Expandable List Demo'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: ExpansionPanelList(
//             elevation: 1,
//             expandedHeaderPadding: const EdgeInsets.all(15.0),
//             expansionCallback: (int index, bool isExpanded) {
//               _handleExpansion(index);
//             },
//             children: _panelItems.map<ExpansionPanel>((PanelItem item) {
//               final bool isExpanded =
//                   _expandedIndex == _panelItems.indexOf(item);
//               return ExpansionPanel(
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return Text(item.headerText);
//                 },
//                 body: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(item.bodyText),
//                 ),
//                 isExpanded: isExpanded,
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
