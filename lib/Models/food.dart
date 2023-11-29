class Food {
  String name;
  String locator;
  String imagePath;
  String rating;

  Food({
    required this.name,
    required this.locator,
    required this.imagePath,
    required this.rating,
  });

  String get _name => name;
  String get _locator => locator;
  String get _imagePath => imagePath;
  String get _rating => rating;
}
