/// This is the data transfer object for a journal entry
class JournalEntryDTO {
  int rating;
  String title;
  String body;
  DateTime date;

  JournalEntryDTO({
    this.rating = 1,
    this.title = '',
    this.body = '',
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  String toString() =>
      'Title: $title, Body: $body, Rating: $rating, Date: $date';

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'title': title,
      'body': body,
      'date': date.toString(),
    };
  }
}
