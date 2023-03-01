class EntryDTO {
  int rating = 1;
  String title = '';
  String body = '';
  DateTime date = DateTime.now();

  EntryDTO({
    required this.rating,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  String toString() =>
      'Title: $title, Body: $body, Rating: $rating, Date: $date';
}
