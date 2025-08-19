// lib/models/internship_entry.dart

class InternshipEntry {
  // Kaydın benzersiz kimliği, veritabanı için gerekli.
  final String id;
  // Staj girişinin yapıldığı tarih.
  final DateTime date;
  // Yapılan görevin başlığı.
  final String title;
  // Görevin detaylı açıklaması.
  final String description;
  // Göreve harcanan saat sayısı.
  final int hours;

  // Constructor
  InternshipEntry({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.hours,
  });

  // Backend'e göndermek için veriyi bir haritaya dönüştürür.
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(), // Tarihi ISO 8601 formatında gönderiyoruz.
      'title': title,
      'description': description,
      'hours': hours,
    };
  }

  // Backend'den gelen JSON verisinden bir InternshipEntry nesnesi oluşturur.
  factory InternshipEntry.fromJson(Map<String, dynamic> json) {
    return InternshipEntry(
      id: json['id'].toString(), // ID'nin string olduğundan emin olun.
      date: DateTime.parse(json['date']),
      title: json['title'],
      description: json['description'],
      hours: json['hours'],
    );
  }
}