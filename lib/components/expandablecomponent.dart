import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storagesecure/bloc/expand_bloc.dart';

Widget ExpandableWidget(
    BuildContext context, List<Map<String, dynamic>> listexp) {
  print('$listexp listexpppppppp');
  int selected = 0;

  return BlocProvider(
    create: (context) => ExpandBloc(),
    child: BlocBuilder<ExpandBloc, ExpandState>(
      builder: (context, state) {
        if (state is ExpansionTileState) {
          selected = state.selected;
        }
        return Column(children: [
          ListView.builder(
            key: Key('builder ${selected.toString()}'),
            padding:
                const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listexp.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> item = listexp[index];
              return Column(children: <Widget>[
                const Divider(
                  height: 17.0,
                  color: Colors.white,
                ),
                ExpansionTile(
                  key: Key(index.toString()),
                  initiallyExpanded: index == selected,
                  leading: const Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.black,
                  ),
                  title: Text(item['title'],
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
                      const Duration(seconds: 20000);

                      context
                          .read<ExpandBloc>()
                          .add(ExpansionTileEvent(index: index));
                    } else {
                      context
                          .read<ExpandBloc>()
                          .add(ExpansionTileEvent(index: -1));
                    }
                  }),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        item['description'],
                      ),
                    )
                  ],
                ),
              ]);
            },
          )
        ]);
      },
    ),
  );
}
