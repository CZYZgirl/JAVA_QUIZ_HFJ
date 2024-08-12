import 'package:flutter/material.dart';

class Page015 extends StatefulWidget {
  @override
  _Page015State createState() => _Page015State();
}

class _Page015State extends State<Page015> {
  // Code snippets for the puzzle
  List<String> _codeSnippets = [
    'x > 0',
    'x < 1',
    'x > 1',
    'x > 3',
    'x < 4',
    'x = x + 1;',
    'x = x + 2;',
    'x = x - 2;',
    'x = x - 1;',
    'System.out.print(" ");',
    'System.out.print("a");',
    'System.out.print("n");',
    'System.out.print("an");',
    'System.out.print("noys");',
    'System.out.print("oise ");',
    'System.out.print(" oyster ");',
    'System.out.print("annoys");',
    'System.out.print("noise");'
  ];

  // Stores the user's selected code snippets
  List<String> _selectedCodes = List<String>.filled(12, '');
  // Stores the correctness of each selected snippet
  List<bool> _isCorrect = List<bool>.filled(12, false);
  bool _isAnswerChecked = false;
  int? _activeCodeIndex;

  // The correct answers for the puzzle
  List<String> correctAnswers = [
    'x < 4',
    'System.out.print("a");',
    'System.out.print(" ");',
    'System.out.print("n");',
    'x > 1',
    'System.out.print(" oyster ");',
    'x = x + 2;',
    'System.out.print("noys");',
    'x < 1',
    'System.out.print("oise ");',
    'x = x + 1;',
  ];

  // Function to check the user's answers
  void _checkAnswers() {
    setState(() {
      _isAnswerChecked = true;
      for (int i = 0; i < correctAnswers.length; i++) {
        _isCorrect[i] = _selectedCodes[i] == correctAnswers[i];
      }
    });
  }

  // Function to handle the selection of a code snippet
  void _selectSnippet(String snippet) {
    if (_activeCodeIndex != null && _activeCodeIndex! < _selectedCodes.length) {
      setState(() {
        _selectedCodes[_activeCodeIndex!] = snippet;
        _isAnswerChecked = false; // Reset the check when a snippet is selected
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('Chapter 01_5', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '수영장 퍼즐',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "하단의 수영장 안에 있는 코드 스니펫을 꺼내서 오른쪽에 있는 코드의 빈 줄에 넣어보세요. "
                  "같은 스니펫을 두 번 이상 사용할 수 없으며, 모든 스니펫을 사용할 필요는 없습니다. "
                  "이 퍼즐의 목표는 문제없이 컴파일과 실행 과정을 진행해 하단의 결과를 출력하는 클래스를 만드는 것입니다.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: _codeSnippets.map((snippet) {
                      return ElevatedButton(
                        onPressed: () {
                          _selectSnippet(snippet);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedCodes.contains(snippet)
                              ? Colors.green[200]
                              : Colors.blueGrey[50],
                          foregroundColor: Colors.grey,
                        ),
                        child: Text(snippet,
                            style: TextStyle(color: Colors.black87)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  _buildPuzzleCode(),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _checkAnswers,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200], // 버튼 배경색 설정
                  foregroundColor: Colors.grey, // 버튼 텍스트 색상 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 버튼 모서리 둥글게 설정
                  ),
                ),
                child: Text('정답 확인',
                    style: TextStyle(color: Colors.black87, fontSize: 16.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPuzzleCode() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('class PoolPuzzleOne {', style: TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('public static void main(String [] args) {', style: TextStyle(fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('int x = 0;', style: TextStyle(fontSize: 16)),
                      Text(' '),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('while ( ', style: TextStyle(fontSize: 16)),
                                _buildCodeLine(0),
                                Text(' ) {', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            _buildCodeLine(1),
                            Text('if ( x < 1 ) {', style: TextStyle(fontSize: 16)),
                            Row(
                              children: [
                                SizedBox(width: 16.0,),
                                _buildCodeLine(2),
                              ],
                            ),
                            Text('}', style: TextStyle(fontSize: 16)),
                            _buildCodeLine(3),
                            Row(
                              children: [
                                Text('if ( ', style: TextStyle(fontSize: 16)),
                                _buildCodeLine(4),
                                Text(' ) {', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.0,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildCodeLine(5),
                                  _buildCodeLine(6),
                                ],
                              ),
                            ),
                            Text('}', style: TextStyle(fontSize: 16)),
                            Text('if ( x == 1 ) {', style: TextStyle(fontSize: 16)),
                            Row(
                              children: [
                                SizedBox(width: 16.0,),
                                _buildCodeLine(7),
                              ],
                            ),
                            Text('}', style: TextStyle(fontSize: 16)),
                            Row(
                              children: [
                                Text('if ( ', style: TextStyle(fontSize: 16)),
                                _buildCodeLine(8),
                                Text(' ) {', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 16.0,),
                                _buildCodeLine(9),
                              ],
                            ),
                            Text('}', style: TextStyle(fontSize: 16)),
                            Text('System.out.println();', style: TextStyle(fontSize: 16)),
                            _buildCodeLine(10),
                          ],
                        ),
                      ),
                      Text('}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Text('}', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Text('}', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }


  // builds a single line of code with interaction
  Widget _buildCodeLine(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeCodeIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0), // 글자에 맞춰 폭 조정
        decoration: BoxDecoration(
          border: Border.all(
            color: _activeCodeIndex == index ? Colors.green.shade800 : Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedCodes[index].isNotEmpty ? _selectedCodes[index] : ' 스니펫 붙이기 ',
              style: TextStyle(
                fontSize: 14,
                color: _selectedCodes[index].isNotEmpty ? Colors.black : Colors.grey,
              ),
            ),
            if (_isAnswerChecked)
              Text(
                _isCorrect[index] ? '정답!' : '오답!',
                style: TextStyle(
                  color: _isCorrect[index] ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
