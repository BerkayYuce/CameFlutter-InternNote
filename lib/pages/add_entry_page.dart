// lib/pages/add_entry_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login_page_flutter/bloc/internship/internship_bloc.dart';
import 'package:login_page_flutter/bloc/internship/internship_event.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

class AddEntryPage extends StatefulWidget {
  const AddEntryPage({Key? key}) : super(key: key);

  @override
  _AddEntryPageState createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _hoursController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _hoursController.dispose();
    super.dispose();
  }

  // Tarih seçme diyalogunu açar
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Yeni girişi eklemek için formu gönderir
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Bloc'a AddEntry event'ini gönderir
      context.read<InternshipBloc>().add(
        InternshipEvent.addEntry(
          title: _titleController.text,
          description: _descriptionController.text,
          hours: int.tryParse(_hoursController.text) ?? 0,
          date: _selectedDate,
        ),
      );

      // Başarılı bir şekilde ekleme yapıldığını belirtmek için bir sonuçla geri dön
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Giriş Ekle'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Tarih seçme alanı
              ListTile(
                title: Text(
                  'Tarih: ${DateFormat('dd MMMM yyyy').format(_selectedDate)}',
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 16),
              // Başlık alanı
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Görev Başlığı',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir başlık girin.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Açıklama alanı
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Görev Açıklaması',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir açıklama girin.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Harcanan saat alanı
              TextFormField(
                controller: _hoursController,
                decoration: const InputDecoration(
                  labelText: 'Harcanan Saat',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Lütfen geçerli bir saat sayısı girin.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Kaydet butonu
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Kaydet', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}