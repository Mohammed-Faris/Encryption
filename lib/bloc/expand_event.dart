part of 'expand_bloc.dart';

sealed class ExpandEvent {}

class ExpansionTileEvent extends ExpandEvent {
  final int index;
  ExpansionTileEvent({required this.index});
}
