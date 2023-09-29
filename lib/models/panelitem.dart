class PanelItem {
  String headerText;
  String bodyText;
  bool Expanded;

  PanelItem(
      {required this.headerText,
      required this.bodyText,
      this.Expanded = false});
}
