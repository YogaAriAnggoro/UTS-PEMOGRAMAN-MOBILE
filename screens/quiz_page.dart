import 'package:flutter/material.dart';
import '../models/question.dart'; // Import model Question

// Widget utama untuk halaman kuis
class QuizPage extends StatefulWidget {
  final Function(int totalQuestions, int score) onQuizFinished;

  // Konstruktor QuizPage, menerima callback saat kuis selesai
  const QuizPage({super.key, required this.onQuizFinished});

  @override
  // Membuat state _QuizPageState
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List pertanyaan
  List<Question> questionBank = [
    Question(questionText: "HTML adalah bahasa pemrograman yang digunakan untuk membuat aplikasi berbasis desktop.", correctAnswer: false),
    Question(questionText: "Algoritma adalah langkah-langkah sistematis yang digunakan untuk menyelesaikan suatu masalah.", correctAnswer: true),
    Question(questionText: "Dalam struktur data, stack menggunakan prinsip FIFO (First In First Out).", correctAnswer: false),
    Question(questionText: "SQL digunakan untuk mengelola dan memanipulasi database relasional.", correctAnswer: true),
    Question(questionText: "RAM adalah jenis penyimpanan permanen yang tidak akan hilang meskipun komputer dimatikan.", correctAnswer: false),
    Question(questionText: "Pada sistem operasi Windows, file berekstensi .exe adalah file gambar.", correctAnswer: false),
    Question(questionText: "DNS (Domain Name System) berfungsi untuk menerjemahkan alamat IP menjadi nama domain.", correctAnswer: true),
    Question(questionText: "Firewall berfungsi untuk mempercepat koneksi internet pada sebuah jaringan.", correctAnswer: false),
    Question(questionText: "JavaScript hanya dapat dijalankan di sisi klien (client-side) dan tidak bisa digunakan di sisi server (server-side).", correctAnswer: false),
    Question(questionText: "Big O notation digunakan untuk menganalisis kompleksitas algoritma.", correctAnswer: true),
  ];

  List<Widget> scoreKeeper = []; // Menyimpan icon hasil jawaban (benar/salah)
  int currentQuestionIndex = 0; // Index pertanyaan saat ini
  int totalScore = 0; // Skor total
  bool quizFinished = false; // Status apakah kuis sudah selesai

  // Fungsi untuk mengecek jawaban pengguna
  void checkAnswer(bool userPickedAnswer) {
    if (quizFinished) return;

    bool correctAnswer = questionBank[currentQuestionIndex].correctAnswer;

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        // Tambahkan icon centang jika jawaban benar
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        totalScore++; // Tambah skor
      } else {
        // Tambahkan icon silang jika jawaban salah
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      // Pindah ke pertanyaan berikutnya atau akhiri kuis
      if (currentQuestionIndex < questionBank.length - 1) {
        currentQuestionIndex++;
      } else {
        quizFinished = true;
        widget.onQuizFinished(questionBank.length, totalScore); // Callback saat selesai
      }
    });
  }

  // Fungsi untuk menentukan pesan hasil kuis berdasarkan skor
  String _getResultMessage() {
    double percentage = (totalScore / questionBank.length) * 100;
    if (percentage >= 80) {
      return 'Great! You\'ve really mastered the material.';
    } else if (percentage >= 60) {
      return 'Well done! You understand the material well enough.';
    } else if (percentage >= 40) {
      return 'You need to study harder.';
    } else {
      return 'You still need to learn a lot.';
    }
  }

  // Fungsi untuk menentukan warna berdasarkan hasil kuis
  Color _getResultColor() {
    double percentage = (totalScore / questionBank.length) * 100;
    if (percentage >= 80) {
      return Colors.green;
    } else if (percentage >= 60) {
      return Colors.blue;
    } else if (percentage >= 40) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFABD1E6), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Color(0xFF3A6EA5),
            title: Text('Question', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      // Tampilkan layar hasil atau layar kuis berdasarkan status
      body: quizFinished ? _buildResultScreen() : _buildQuizScreen(),
    );
  }

  // Widget tampilan saat kuis masih berjalan
  Widget _buildQuizScreen() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nomor pertanyaan
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF6F9ECD),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Question ${currentQuestionIndex + 1}/${questionBank.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Kotak soal
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    questionBank[currentQuestionIndex].questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tombol True & False
            Row(
              children: [
                // Tombol True
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                  ),
                ),
                SizedBox(width: 10),
                // Tombol False
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
