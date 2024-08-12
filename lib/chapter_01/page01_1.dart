import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page011 extends StatefulWidget {
  @override
  _Page011State createState() => _Page011State();
}

class _Page011State extends State<Page011> {
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
        title: Text('Chapter 01_1', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // section title
            Text(
              '코드 자석',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // exercise description
            Text(
              "냉장고 위에 자바 프로그램 코드가 아무렇게나 널려 있습니다. 코드 스니펫을 재배치해서 아래에 있는 것과 같은 결과를 출력하는 자바 프로그램을 만들어 보세요. "
              "아, 그런데 중괄호 몇 개는 바닥에 떨어져 버렸군요. 찾기 힘드니까 필요하면 마음대로 새롭게 추가해 보세요.",
              style: TextStyle(fontSize: 14),
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
