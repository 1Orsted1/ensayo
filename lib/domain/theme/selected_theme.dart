const String kDark = 'dark';
const String kLight = 'light';

enum SelectedTheme {
  light(kLight),
  dark(kDark);

  const SelectedTheme(this.value);
  final String value;
}