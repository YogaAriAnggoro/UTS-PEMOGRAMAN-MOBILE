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
