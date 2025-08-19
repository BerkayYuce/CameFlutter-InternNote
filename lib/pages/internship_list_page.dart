// lib/pages/internship_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/internship/internship_bloc.dart';
import 'package:login_page_flutter/bloc/internship/internship_state.dart';
import 'package:login_page_flutter/bloc/internship/internship_event.dart';
import 'package:intl/intl.dart';
import 'package:login_page_flutter/models/internship_entry.dart';
import 'package:login_page_flutter/pages/add_entry_page.dart';

class InternshipListPage extends StatefulWidget {
  const InternshipListPage({Key? key}) : super(key: key);

  @override
  _InternshipListPageState createState() => _InternshipListPageState();
}

class _InternshipListPageState extends State<InternshipListPage> {
  @override
  void initState() {
    super.initState();
    // Sayfa yüklendiğinde, Bloc'a girişleri çekme komutunu gönderiyoruz.
    context.read<InternshipBloc>().add(const InternshipEvent.fetchEntries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staj Defteri'),
        backgroundColor: Colors.blue,
        actions: [
          // Sayfa yenileme butonu
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<InternshipBloc>().add(const InternshipEvent.fetchEntries());
            },
          ),
        ],
      ),
      body: BlocBuilder<InternshipBloc, InternshipState>(
        builder: (context, state) {
          // Duruma göre UI gösterme
          return state.when(
            initial: () => const Center(child: Text('Staj defteri verileri yükleniyor...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (entries) {
              if (entries.isEmpty) {
                return const Center(
                  child: Text(
                    'Henüz staj defteri girişiniz yok.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              // Veriler yüklendiğinde listeyi göster
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return _buildEntryCard(context, entry);
                },
              );
            },
            error: (message) => Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
      // Yeni giriş eklemek için yüzen buton
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Yeni giriş ekleme sayfasına yönlendir
          final result = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEntryPage()),
          );
          // Eğer AddEntryPage'den bir sonuç (true) dönmüşse, listeyi yeniden yükle.
          if (result == true) {
            context.read<InternshipBloc>().add(const InternshipEvent.fetchEntries());
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Her bir staj defteri girişi için kart görünümü
  Widget _buildEntryCard(BuildContext context, InternshipEntry entry) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarih ve saat
            Text(
              DateFormat('dd MMMM yyyy').format(entry.date),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            // Başlık
            Text(
              entry.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Açıklama
            Text(
              entry.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Harcanan saat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harcanan Saat: ${entry.hours}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Silme butonu
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Kullanıcıya onay sorusu sor
                    _confirmDelete(context, entry.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Silme onay penceresi
  void _confirmDelete(BuildContext context, String entryId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Silme Onayı'),
          content: const Text('Bu staj defteri girişini silmek istediğinizden emin misiniz?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                // Bloc'a silme olayını gönder
                context.read<InternshipBloc>().add(InternshipEvent.deleteEntry(id: entryId));
                Navigator.of(context).pop();
              },
              child: const Text('Sil', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}