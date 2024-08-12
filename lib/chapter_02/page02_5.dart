import 'package:flutter/material.dart';

class Page025 extends StatefulWidget {
  @override
  _Page025State createState() => _Page025State();
}

class _Page025State extends State<Page025> {
  List<String> _codeSnippets = [
    'intValue = i;',
    'values.intValue = i;',
    'values[i].intValue = i;',
    'values[i].intValue = number;',
    'Puzzle4[] values = new Puzzle4[6];',
    'Value[] values = new Value[6];',
    'Value[] values = new Puzzle4[6];',
    'doStuff(i);',
    'values.doStuff(i);',
    'value[i].doStuff(factor);',
    'value[i].doStuff(i);',
    'intValue',
    'factor',
    'public',
    'private',
    'intValue + factor;',
    'intValue * (2 + factor);',
    'intValue * (5 - factor);',
    'intValue * factor;',
    'i = i + 1;',
    'i = i - 1;',
    'Puzzle4',
    'Value',
    'Value()',
    'int',
    'short',
    'values[i] = new Value(i);',
    'values[] = new Value();',
    'values[i] = new Value();',
    'values = new Value();'
  ];

  List<String> _selectedCodes = List<String>.filled(12, '');
  List<bool> _isCorrect = List<bool>.filled(12, false);
  bool _isAnswerChecked = false;
  int? _activeCodeIndex;

  void _checkAnswers() {
    List<String> correctAnswers = [
      'Value[] values = new Value[6];',
      'values[i] = new Value();',
      'values[i].intValue = number;',
      'i = i + 1;',
      'i = i - 1;',
      'values[i].doStuff(i);',
      'Value',
      'public',
      'int',
      'factor',
      'intValue * factor;',
      'intValue * (5 - factor);',
    ];

    setState(() {
      _isAnswerChecked = true;
      for (int i = 0; i < correctAnswers.length; i++) {
        _isCorrect[i] = _selectedCodes[i] == correctAnswers[i];
      }
    });
  }

  void _selectSnippet(String snippet) {
    if (_activeCodeIndex != null && _activeCodeIndex! < _selectedCodes.length) {
      setState(() {
        _selectedCodes[_activeCodeIndex!] = snippet;
        _isAnswerChecked = false;  // Reset the check when a snippet is selected
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
        title: Text('Chapter 04_5', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700])),
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
              '하단의 수영장 안에 있는 코드 스니펫을 꺼내서 오른쪽에 있는 코드의 빈 줄에 넣어보세요. '
                  '같은 스니펫을 두 번 이상 사용할 수 없으며, 모든 스니펫을 사용할 필요는 없습니다. '
                  '이 퍼즐의 목표는 문제없이 컴파일과 실행 과정을 진행해 하단의 결과를 출력하는 클래스를 만드는 것입니다.',
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
          Text('public class Puzzle4 {', style: TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('public static void main(String [] args){',
                    style: TextStyle(fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCodeLine(0),
                      Text('int number = 1;', style: TextStyle(fontSize: 16)),
                      Text('int i = 0;', style: TextStyle(fontSize: 16)),
                      Text('while( i < 6){', style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCodeLine(1),
                            _buildCodeLine(2),
                            Text('number = number * 10;',
                                style: TextStyle(fontSize: 16)),
                            _buildCodeLine(3),
                          ],
                        ),
                      ),
                      Text('}', style: TextStyle(fontSize: 16)),
                      Text('int result = 0;', style: TextStyle(fontSize: 16)),
                      Text('i = 6;', style: TextStyle(fontSize: 16)),
                      Text('while(i > 0){', style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCodeLine(4),
                            Row(
                              children: [
                                Text('result = result +  ',
                                    style: TextStyle(fontSize: 16)),
                                _buildCodeLine(5),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text('}', style: TextStyle(fontSize: 16)),
                      Text('System.out.println("result " + result);',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Text('}', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Row(
            children: [
              Text('class  ', style: TextStyle(fontSize: 16)),
              _buildCodeLine(6),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('int intValue;', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    _buildCodeLine(7),
                    _buildCodeLine(8),
                    Text('doStuff(int ', style: TextStyle(fontSize: 16)),
                    _buildCodeLine(9),
                    Text(')', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('if(intValue > 100){',
                          style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Text('return', style: TextStyle(fontSize: 16)),
                            _buildCodeLine(10),
                          ],
                        ),
                      ),
                      Text('} else {', style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Text('return', style: TextStyle(fontSize: 16)),
                            _buildCodeLine(11),
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
                _isCorrect[index] ? '정답입니다!' : '틀렸습니다!',
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
