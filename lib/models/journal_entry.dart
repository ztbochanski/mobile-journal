class JournalEntry {
  final int id;
  final int rating;
  final String title;
  final String body;
  final DateTime date;

  JournalEntry({
    required this.id,
    required this.rating,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  String toString() {
    return 'JournalEntry(id: $id, rating: $rating, title: $title, body: $body, date: $date)';
  }
}
