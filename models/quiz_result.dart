// Kelas ini merepresentasikan hasil dari sebuah kuis.
class QuizResult {
  // Tanggal dan waktu saat kuis diselesaikan.
  final DateTime date;

  // Total jumlah pertanyaan dalam kuis.
final int totalQuestions;

  // Skor yang didapatkan oleh pengguna dari kuis tersebut.
  final int score;

  // Konstruktor untuk menginisialisasi nilai-nilai properti
  // date, totalQuestions, dan score saat objek dibuat.
  QuizResult({
    required this.date,
    required this.totalQuestions,
    required this.score,
  });
}
