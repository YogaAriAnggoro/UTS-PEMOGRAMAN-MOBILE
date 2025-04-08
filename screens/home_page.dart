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
      backgroundColor: Color(0xFFABD1E6), // Background biru muda
      appBar: AppBar(
        backgroundColor: Color(0xFF3A6EA5), // Header biru tua
        title: Text('QuizzIn', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk memulai kuis
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Start Quiz', style: TextStyle(fontSize: 20, color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      onQuizFinished: (int totalQuestions, int score) {
                        // Simpan hasil kuis setelah selesai
                        addQuizResult(QuizResult(
                          date: DateTime.now(),
                          totalQuestions: totalQuestions,
                          score: score,
                        ));
                      },
