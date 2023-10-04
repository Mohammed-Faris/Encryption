part of 'expand_bloc.dart';

sealed class ExpandEvent {}

enum ExpandableEvent { expand, collapse }

class ExpansionTileEvent extends ExpandEvent {
  final int index;
  ExpansionTileEvent({required this.index});
}
