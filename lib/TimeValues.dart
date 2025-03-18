enum TimeValues {
  OneDay(86400),
  OneWeek(604800),
  OneMonth(2592000),
  SixMonths(15778800),
  OneYear(31536000),
  FiveYears(157680000);

  final int seconds;
  const TimeValues(this.seconds);
}
