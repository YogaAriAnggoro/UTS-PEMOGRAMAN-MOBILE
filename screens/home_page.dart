// Import library Flutter dan halaman lainnya
import 'package:flutter/material.dart';
import '../models/quiz_result.dart';
import 'quiz_page.dart';
import 'result_history_page.dart';

// Widget halaman utama aplikasi
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // State untuk HomePage
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Menyimpan riwayat hasil kuis
  List<QuizResult> quizHistory = [];

  // Menambahkan hasil kuis ke daftar riwayat
  void addQuizResult(QuizResult result) {
    setState(() {
      quizHistory.add(result);
    });
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
