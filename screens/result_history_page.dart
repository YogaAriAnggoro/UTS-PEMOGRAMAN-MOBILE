// Import package Flutter untuk menggunakan widget UI seperti Scaffold, AppBar, ListTile, dll.
import 'package:flutter/material.dart';

// Import model QuizResult dari folder models
import '../models/quiz_result.dart';

// Kelas stateless widget untuk menampilkan halaman riwayat hasil kuis
class ResultHistoryPage extends StatelessWidget {
  // List hasil kuis yang akan ditampilkan
  final List<QuizResult> quizHistory;

  // Constructor dengan parameter quizHistory wajib diisi
  const ResultHistoryPage({super.key, required this.quizHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFABD1E6), // Warna latar belakang halaman
      appBar: AppBar(
        backgroundColor: Color(0xFF3A6EA5), // Warna latar AppBar
            title: Text('Quiz History', style: TextStyle(color: Colors.white)), // Judul AppBar
        centerTitle: true, // Judul di tengah
      ),
      // Body menampilkan kondisi jika riwayat kosong atau ada data
      body: quizHistory.isEmpty
          ? Center(
        child: Text(
          'Nothing to show here.', // Teks jika tidak ada riwayat kuis
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: quizHistory.length, // Jumlah item dalam ListView
        itemBuilder: (context, index) {
          // Ambil data dari akhir ke awal (terbaru di atas)
          final result = quizHistory[quizHistory.length - 1 - index];
          return ListTile(
            title: Text(
              // Tampilkan tanggal kuis
              'Quiz on ${result.date.day}/${result.date.month}/${result.date.year}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
