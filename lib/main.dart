import 'package:flutter/material.dart';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            "اختبر نفسك",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Amiri',
            ),
          ),
          backgroundColor: Color(0xFF795548),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Padding> answerResult = [];
  List<String> questions = [
    'كم عدد سور القرآن الكريم؟',
    'ما هي أوَّل سورةٍ قرآنيَّةٍ نزلت على رسول الله -صلّى الله عليه وسلّم-؟',
    'ما هي السُّورة التي تعدُّ أمُّ الكتاب؟',
    'ما هي السُّورة القرآنيَّة التي تخلو من البسملة في بدايتها؟',
    'ما هي السّورة القرآنية التي شيَّبت رسول الله -صلّى الله عليه وسلّم-؟',
    'كم مرَّة جاء ذكر الجنَّة في القرآن الكريم؟',
    'كم هي المدَّة التي استغرقها نزول القرآن الكريم؟',
    'أين اختبأ رسول الله -عليه السّلام- هو وأبو بكر في طريقه للهجرة؟'
  ];
  int questionNumber = 0;

  List<List<String>> answers = [
    ['120', '124', '121', '125'],
    ['سورة العلق', 'سورة البقرة', 'سورة الكهف', 'سورة الاخلاص'],
    ['سورة الطلاق', 'سورة الفاتحة', 'سورة النمل', 'سورة الحجر'],
    ['سورة الإسراء', 'سورة مريم', 'سورة ال عمران', 'سورة التوبة'],
    ['سورة الرعد', 'سورة يونس', 'سورة يوسف', 'سورة هود'],
    ['193', ' 139', '194 ', ' 149'],
    ['20 ', '21', '22 ', '23'],
    ['غار جبل أحد', 'غار سلع', 'غار ثور', 'غار حراء'],
  ];

  // قائمة الصور
  List<String> images = [
    'images/pic1.jpg',
    'images/pic2.jpg',
    'images/pic3.jpg',
    'images/pic4.jpg',
    'images/pic5.jpg',
    'images/pic6.jpg',
    'images/pic7.jpg',
    'images/pic8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                  images[questionNumber]), // عرض الصورة بناءً على السؤال
              SizedBox(
                height: 12,
              ),
              Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                setState(() {
                  questionNumber++;
                  if (questionNumber >= questions.length) {
                    questionNumber = 0; // إعادة البدء بعد الانتهاء
                  }
                });
              },
              child: Text(
                answers[questionNumber][0],
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF5d4037),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                setState(() {
                  questionNumber++;
                  if (questionNumber >= questions.length) {
                    questionNumber = 0;
                  }
                });
              },
              child: Text(
                answers[questionNumber][1],
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF5d4037),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                setState(() {
                  questionNumber++;
                  if (questionNumber >= questions.length) {
                    questionNumber = 0;
                  }
                });
              },
              child: Text(
                answers[questionNumber][2],
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF5d4037),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                setState(() {
                  questionNumber++;
                  if (questionNumber >= questions.length) {
                    questionNumber = 0;
                  }
                });
              },
              child: Text(
                answers[questionNumber][3],
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF5d4037),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
