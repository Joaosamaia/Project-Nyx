class News {
  String title;
  String descrition;
  String imagePath;
  
  News({
    required this.title,
    required this.descrition,
    required this.imagePath,
  });

  String get _title => title;
  String get _descrition => descrition;
  String get _imagePath => imagePath;
}
