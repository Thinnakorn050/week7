// การทำงานของโค้ดในส่วนต่างๆ
// 1. ส่วนการ import และการกำหนดค่าเริ่มต้น
import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:flutter/material.dart'; นำเข้าแพ็กเกจ material ของ Flutter เพื่อใช้ widget และ theme ต่างๆ
// import 'dart:math'; นำเข้าแพ็กเกจ dart:math เพื่อใช้ฟังก์ชันสุ่มตัวเลข
const Color bgColor = Color.fromARGB(255, 255, 255, 255);
const Color primaryColor = Color.fromARGB(255, 255, 169, 71);
const Color primaryColor2 = Color.fromRGBO(102, 5, 34, 1);
const Color primaryColor3 = Color.fromRGBO(163, 0, 0, 1);
// การกำหนดค่าสีพื้นหลัง (bgColor) และสีหลัก (primaryColor, primaryColor2, primaryColor3) ที่จะถูกใช้ในธีมของแอป


// 2. คลาส As3 (หน้าหลักของแอป)
class As3 extends StatelessWidget {
  const As3({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const RandomDemo(),
    );
  }
}
// As3 เป็นคลาสหลักที่สร้างแอป Flutter ในรูปแบบ MaterialApp
// debugShowCheckedModeBanner: false ปิดแบนเนอร์ Debug บนมุมจอ
// theme: ThemeData กำหนดธีมของแอปโดยกำหนดพื้นหลัง (scaffoldBackgroundColor) และรูปแบบของข้อความ (textTheme)
// home: const RandomDemo() กำหนดหน้าเริ่มต้นเป็น RandomDemo


// 3. คลาส RandomDemo และ State ของเกม
class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});
  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  final _controller = TextEditingController();
  int _randomNumber = 0;
  int _attemptsLeft = 3;
  String _message = '';
// RandomDemo เป็น StatefulWidget ซึ่งมีสถานะ (state) ที่สามารถเปลี่ยนแปลงได้ระหว่างการทำงาน
// TextEditingController ใช้ควบคุมการรับข้อมูลจากช่องกรอกตัวเลข (TextField)
// _randomNumber ตัวแปรเก็บค่าตัวเลขที่ถูกสุ่ม
// _attemptsLeft เก็บจำนวนครั้งที่เหลือในการเดา (เริ่มต้นที่ 3 ครั้ง)
// _message ข้อความที่จะแสดงผลตามสถานการณ์ในเกม เช่น "ถูกต้อง", "ผิด", หรือ "พยายามใหม่"


// 4. การตั้งค่าการสุ่มตัวเลขและฟังก์ชันเดาตัวเลข
  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  void _generateRandomNumber() {
    _randomNumber = Random().nextInt(10);
  }
// initState() เรียกใช้เมื่อ state ถูกสร้างขึ้นครั้งแรก โดยในที่นี้เรียก _generateRandomNumber() เพื่อสุ่มตัวเลขระหว่าง 0 ถึง 9
// _generateRandomNumber() ใช้คลาส Random() จาก dart:math เพื่อสุ่มตัวเลข
  void _guessNumber() {
    final guess = int.tryParse(_controller.text);
    if (guess == null || guess < 0 || guess > 9) {
      setState(() {
        _message = '';
      });
      return;
    }
    setState(() {
      if (guess == _randomNumber) {
        _message = 'Correct, you win!';
      } else {
        _attemptsLeft--;
        if (_attemptsLeft > 0) {
          _message = guess < _randomNumber
              ? '$guess is too small, $_attemptsLeft attempts left.'
              : '$guess is too large, $_attemptsLeft attempts left.';
        } else {
          _message = 'Sorry,you lost. The answer is $_randomNumber';
        }
      }
      if (_attemptsLeft == 0) {
        _controller.clear();
      }
    });
  }
// _guessNumber() อ่านค่าตัวเลขจากช่องกรอก (_controller.text) และแปลงเป็นตัวเลข (int.tryParse) เพื่อตรวจสอบว่าผู้ใช้เดาถูกหรือไม่
// ถ้าเดาถูกจะแสดงข้อความ "Correct, you win!" ถ้าเดาผิดจะลดจำนวนครั้งที่เหลือและให้คำแนะนำว่าเดาตัวเลขเล็กไปหรือใหญ่ไป
// ถ้าโอกาสหมดจะแสดงข้อความว่าผู้เล่นแพ้และแสดงคำตอบที่ถูกต้อง


// 5. การรีเซ็ตเกม
  void _resetGame() {
    setState(() {
      _generateRandomNumber();
      _attemptsLeft = 3;
      _message = '';
      _controller.clear();
    });
  }
// _resetGame() ใช้ในการเริ่มเกมใหม่ โดยสุ่มตัวเลขใหม่ รีเซ็ตจำนวนครั้งที่เหลือเป็น 3 และล้างข้อความที่แสดงผล


// 6. ส่วนการสร้าง UI (User Interface)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Guess a number game',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Guess a number 0-9',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _guessNumber,
          child: Text('Guess'),
        ),
        SizedBox(height: 20),
        Text(
          _message,
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: _resetGame,
          child: Text('Restart'),
        ),
      ],
    ));
  }
// ส่วนนี้สร้างหน้าจอแสดงผลโดยใช้ Scaffold และ Column เพื่อจัดวาง widget เช่นข้อความ, ช่องกรอกตัวเลข (TextField), ปุ่มเดา (ElevatedButton), และปุ่มเริ่มใหม่ (Restart)