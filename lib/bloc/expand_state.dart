part of 'expand_bloc.dart';

sealed class ExpandState {}

final class ExpandInitial extends ExpandState {}

class ExpansionTileState extends ExpandState {
  int selected;
  ExpansionTileState({required this.selected});
}
