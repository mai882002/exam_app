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
  int questionNumber = 0;
  int correctAnswersCount = 0;
  bool quizFinished = false;

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
  List<List<String>> answers = [
    ['120', '124', '121', '125'],
    ['سورة العلق', 'سورة البقرة', 'سورة الكهف', 'سورة الاخلاص'],
    ['سورة الطلاق', 'سورة الفاتحة', 'سورة النمل', 'سورة الحجر'],
    ['سورة الإسراء', 'سورة مريم', 'سورة ال عمران', 'سورة التوبة'],
    ['سورة الرعد', 'سورة يونس', 'سورة يوسف', 'سورة هود'],
    ['193', '139', '194', '149'],
    ['20', '21', '22', '23'],
    ['غار جبل أحد', 'غار سلع', 'غار ثور', 'غار حراء'],
  ];

  List<String> correctanswers = [
    '124',
    'سورة العلق',
    'سورة الفاتحة',
    'سورة التوبة',
    'سورة هود',
    '139',
    '23',
    'غار ثور'
  ];

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

  void _checkAnswer(String selectedAnswer) {
    bool isCorrect = selectedAnswer == correctanswers[questionNumber];
    if (isCorrect) {
      correctAnswersCount++;
    }

    setState(() {
      answerResult.add(
        Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(
            isCorrect ? Icons.thumb_up : Icons.thumb_down,
            color: isCorrect ? Colors.green : Colors.red,
          ),
        ),
      );

      questionNumber++;
      if (questionNumber >= questions.length) {
        quizFinished = true;
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'images/images.png', // صورة الخلفية
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  color: Colors.black
                      .withOpacity(0.5), // شبه شفاف لزيادة وضوح النص
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'لقد أجبت على $correctAnswersCount من أصل ${questions.length} أسئلة بشكل صحيح.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        child: Text(
                          'إعادة المحاولة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            questionNumber = 0;
                            correctAnswersCount = 0;
                            answerResult.clear();
                            quizFinished = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: answerResult,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          flex: 5,
          child: quizFinished
              ? Container() // إذا انتهت الأسئلة، لا نحاول عرض أي شيء جديد
              : Column(
                  children: [
                    Image.asset(
                        images[questionNumber]), // عرض الصورة بناءً على السؤال
                    SizedBox(height: 12),
                    Text(
                      questions[questionNumber], // عرض السؤال الحالي
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
        if (!quizFinished) // فقط إذا لم ينتهي الاختبار نعرض الأزرار
          ...answers[questionNumber].map((answer) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextButton(
                  onPressed: () {
                    _checkAnswer(answer);
                  },
                  child: Text(
                    answer,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 20,
                      fontFamily: 'Amiri',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF5d4037),
                  ),
                ),
              ),
            );
          }).toList(),
      ],
    );
  }
}
