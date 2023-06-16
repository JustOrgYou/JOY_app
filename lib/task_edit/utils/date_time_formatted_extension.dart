extension DateTimeFormattedExtension on DateTime {
  static const _months = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'ноября',
    'декабря',
  ];

  // ugly but no external dependencies.
  // TODO(me): replace with intl package if possible.
  String formatted() {
    return '$day ${_months[month - 1]} $year';
  }
}
