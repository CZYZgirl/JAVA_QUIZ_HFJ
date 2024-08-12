import 'package:flutter/material.dart';

class Page013 extends StatefulWidget {
  @override
  _Page013State createState() => _Page013State();
}

class _Page013State extends State<Page013> {
  // list of selectable options
  List<String> _options = [
    '인스턴스 변수',
    '인자',
    '리턴값',
    'return문',
    '게터',
    '세터',
    '캡슐화',
    'public',
    'private',
    '값으로 전달',
    '메서드',
  ];

  // list of questions
  List<String> _questions = [
    '클래스에 들어갈 수 있는 \'이것\'의 개수에는 제한이 없습니다.',
    '이것은 메서드에 하나밖에 들어갈 수 없습니다.',
    '이것은 자동으로 더 큰 타입이 될 수 있습니다.',
    '저는 인스턴스 변수가 private인 것을 좋아합니다.',
    '원래는 \'복사본을 만든다\'라는 뜻이 있습니다.',
    '세터에서만 이 값을 갱신할 수 있습니다.',
    '저는 반드시 뭔가를 리턴해야 합니다.',
    '인스턴스 변수에 대해서는 사용할 수 없습니다.',
    '인자 여러개를 가질 수 있습니다.',
    '반드시 인자 하나만을 받을 수 있습니다.',
    '캡슐화에 도움이 되지요.',
    '항상 하나뿐입니다.',
  ];

  // list to store the selected answers for each question
  List<List<String>> _selectedAnswers = List.generate(12, (_) => []);

  // track selected options for each question
  List<Map<String, bool>> _selectedOptions = [];

  // store the correctness of each answer
  List<bool?> _isCorrect = List.filled(12, null);

  bool _isAnswerChecked = false; // track if the answers have been checked
  int _activeQuestionIndex = 0; // start with the first question active

  @override
  void initState() {
    super.initState();
    // initialize _selectedOptions
    for (int i = 0; i < _questions.length; i++) {
      Map<String, bool> optionsMap = {};
      for (var option in _options) {
        optionsMap[option] = false;
      }
      _selectedOptions.add(optionsMap);
    }
  }

  // toggle the selection of an option for a specific question
  void _toggleOption(int quizIndex, String option) {
    setState(() {
      if (_selectedOptions[quizIndex][option] == true) {
        // deselect the option if it is already selected
        _selectedOptions[quizIndex][option] = false;
        _selectedAnswers[quizIndex].remove(option);
      } else {
        // select the option
        _selectedOptions[quizIndex][option] = true;
        _selectedAnswers[quizIndex].add(option);
      }

      // update the correctness of the answer in real time
      List<String> correctAnswers = [
        '인스턴스 변수, 게터, 세터, 메서드',
        'return문',
        '리턴값, 인자',
        '캡슐화',
        '값으로 전달',
        '인스턴스 변수',
        '인자',
        'public',
        '메서드',
        '세터',
        '게터, 세터, public, private',
        '리턴값',
      ];

      // concatenate selected answers into a string and compare with correct answer
      String selectedAnswerString = _selectedAnswers[quizIndex].join(', ');
      _isCorrect[quizIndex] = selectedAnswerString == correctAnswers[quizIndex];
    });
  }

  // method to check all answers when the user clicks "Check Answers"
  void _checkAnswers() {
    setState(() {
      _isAnswerChecked = true;

      for (int i = 0; i < _selectedAnswers.length; i++) {
        if (
        (_selectedAnswers[i].contains('인스턴스 변수') &&
            _selectedAnswers[i].contains('게터') &&
            _selectedAnswers[i].contains('세터') &&
            _selectedAnswers[i].contains('메서드')) ||
            (_selectedAnswers[i].contains('return문') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('리턴값') && _selectedAnswers[i].contains('인자') && _selectedAnswers[i].length == 2) ||
            (_selectedAnswers[i].contains('캡슐화') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('값으로 전달') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('인스턴스 변수') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('인자') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('public') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('메서드') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('세터') && _selectedAnswers[i].length == 1) ||
            (_selectedAnswers[i].contains('게터') &&
                _selectedAnswers[i].contains('세터') &&
                _selectedAnswers[i].contains('public') &&
                _selectedAnswers[i].contains('private')) ||
            (_selectedAnswers[i].contains('리턴값') && _selectedAnswers[i].length == 1)
        ) {
          _isCorrect[i] = true;
        } else {
          _isCorrect[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('Chapter 04_3', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '나는 누구일까요?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "여러 가지 자바 구성요소가 완벽하게 분장을 마치고 '나는 누구일까요?' 파티 게임을 하고 있습니다. "
                  "각 힌트를 보고 그 내용을 바탕으로 누군지 알아 맞혀 보세요. 물론 항상 진실만을 말한다고 가정해야겠죠? "
                  "여러 구성요소에 대해 적용할 수 있는 내용이 나온다면 모든 항목을 선택하면 됩니다. "
                  "각 문장 옆에 있는 빈칸에 이름을 적어보세요.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              '오늘의 참석자',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // display option buttons below "오늘의 참석자"
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: _options.map((option) {
                return ElevatedButton(
                  onPressed: () => _toggleOption(_activeQuestionIndex, option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedOptions[_activeQuestionIndex][option] == true
                        ? Colors.green[200]
                        : Colors.blueGrey[50],
                    foregroundColor: Colors.grey,
                  ),
                  child: Text(option, style: TextStyle(color: Colors.black87),),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            // construct each question
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return _buildQuestion(_questions[index], index);
                },
              ),
            ),
            // check answers button
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
            )
          ],
        ),
      ),
    );
  }

  // method to build the UI for each question
  Widget _buildQuestion(String question, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _activeQuestionIndex = index; // activate the selected question
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _activeQuestionIndex == index ? Colors.green.shade700 : Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _activeQuestionIndex == index ? Colors.green[300] : Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity, // set container width to full
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,  // underline color
                          width: 0.5,          // underline width
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _selectedAnswers[index].isEmpty
                            ? '참석자를 추가해보세요'  // hint text
                            : _selectedAnswers[index].join(', '),
                        style: TextStyle(
                          fontSize: 14,
                          color: _selectedAnswers[index].isEmpty ? Colors.grey : Colors.black, // gray when hint is shown
                        ),
                      ),
                    ),
                  ),
                  if (_isAnswerChecked)
                    Text(
                      _isCorrect[index] == true ? '정답입니다!' : '틀렸습니다!',
                      style: TextStyle(
                        color: _isCorrect[index] == true ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
