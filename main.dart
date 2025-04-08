// Import package Flutter untuk menggunakan widget dasar seperti MaterialApp, ThemeData, dll.
import 'package:flutter/material.dart';

// Import file HomePage dari folder screens
import 'screens/home_page.dart';

// Fungsi utama yang akan dijalankan pertama kali saat aplikasi dimulai
void main() => runApp(QuizzIn()); // Menjalankan aplikasi dan memuat widget QuizzIn

// Mendefinisikan widget utama aplikasi dengan nama QuizzIn
class QuizzIn extends StatelessWidget {
  const QuizzIn({super.key}); // Constructor dengan key opsional untuk identifikasi widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
