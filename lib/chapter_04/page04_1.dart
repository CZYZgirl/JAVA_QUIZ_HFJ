import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page041 extends StatefulWidget {
  @override
  _Page041State createState() => _Page041State();
}

class _Page041State extends State<Page041> {
  // list of correct answers
  List<bool> _answers = [true, false, true, false, false, false, false, false];

  // user answers list - initially set to null to indicate no selection
  List<bool?> _userAnswers = List<bool?>.filled(8, null);

  // list to track whether answers have been checked
  List<bool> _isChecked = List<bool>.filled(8, false);

  // list to track whether hints are shown
  List<bool> _showHints = List<bool>.filled(8, false);

  // list of questions
  List<String> _questions = [
    'int a = calcArea(7, 12);\nshort c = 7;\ncalcArea(c, 15);',
    'int d = calcArea(57);',
    'calcArea(2, 3);',
    'long t = 42;\nint f = calcArea(t, 17);',
    'int g = calcArea();',
    'calcArea();',
    'byte h = calcArea(4, 20);',
    'int j = calcArea(2, 3, 5);',
  ];

  // list of hints corresponding to each question
  List<String> _hints = [
    'O. 두 개의 int 매개변수 제공',
    'X. 두 개의 매개변수가 필요하나 하나만 제공',
    'O. 두 개의 매개변수가 제공. 반환값과 무관',
    'X. 첫번째 매개변수의 타입이 int라서..?(암시적 형변환이 안되나용)',
    'X. 두 개의 매개변수가 필요함.',
    'X. 두개의 매개변수가 필요함',
    'X. calcArea의 반환값이 int라서..?(암시적 형변환이 안되나용)',
    'X. 두 개의 매개변수를 받는데, 세 개의 인수가 제공됨.',
  ];

  bool _isAnswerChecked = false; // flag to track whether the answers have been checked

  // method to check the user's answers against the correct answers
  void _checkAnswers() {
    setState(() {
      _isAnswerChecked = true; // mark that answers have been checked
      // update whether each answer is correct
      for (int i = 0; i < _userAnswers.length; i++) {
        if (_userAnswers[i] != null) {
          _isChecked[i] = _userAnswers[i] == _answers[i];
        }
      }
    });
  }

  // method to toggle the hint visibility for a specific question
  void _toggleHint(int index) {
    setState(() {
      _showHints[index] = !_showHints[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('Chapter 04_1', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // section title
            Text(
              '쓰면서 제대로 공부하기',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // section subtitle
            Text(
              '무엇이 맞을까요?',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            // quiz area container
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5,),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quiz',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                            "메서드를 다음과 같이 선언했다면 오른쪽에 있는 코드 중에서 메서드를 제대로 호출한 것은 어떤 것일까요? "
                            "올바르게 호출한 코드 옆에 체크 표시를 해보세요(이 중에는 메서드를 호출할 때 사용할 변숫값을 대입하기 위한 코드도 있습니다.)",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  // method definition example
                  Text(
                    'int calcArea(int height, int width){\n    return height * width;\n}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // generate the list of questions using _buildQuestion
            ...List.generate(_questions.length, (index) {
              return _buildQuestion(_questions[index], index);
            }),
            SizedBox(height: 16),
            // button to check answers
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _checkAnswers,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  foregroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  '정답 확인',
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // method to build the UI for each question
  Widget _buildQuestion(String code, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5,),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            // display the code for the question
            ListTile(
              title: Text(
                code,
                style: TextStyle(fontSize: 14),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // button for 'O'
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _userAnswers[index] = true;
                        if (_isAnswerChecked) {
                          _isChecked[index] = _userAnswers[index] == _answers[index];
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _userAnswers[index] == true
                          ? Colors.green[200]
                          : Colors.blueGrey[50],
                      foregroundColor: Colors.grey,
                    ),
                    child: Text(
                      'O',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 8),
                  // button for 'X'
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _userAnswers[index] = false;
                        if (_isAnswerChecked) {
                          _isChecked[index] = _userAnswers[index] == _answers[index];
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _userAnswers[index] == false
                          ? Colors.green[200]
                          : Colors.blueGrey[50],
                      foregroundColor: Colors.grey,
                    ),
                    child: Text(
                      'X',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            // display the feedback and hint for each question
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (_isAnswerChecked && _userAnswers[index] != null)
                        Text(
                          _isChecked[index]
                              ? '정답입니다!'
                              : '틀렸습니다!',
                          style: TextStyle(
                            color: _isChecked[index]
                                ? Colors.green
                                : Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (_isAnswerChecked && _userAnswers[index] != null)
                        TextButton(
                          onPressed: () => _toggleHint(index),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey,
                          ),
                          child: Text(_showHints[index] ? '힌트 숨기기' : '힌트 보기'),
                        ),
                    ],
                  ),
                  if (_showHints[index])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        _hints[index],
                        style: TextStyle(color: Colors.deepOrange[300], fontStyle: FontStyle.italic),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
