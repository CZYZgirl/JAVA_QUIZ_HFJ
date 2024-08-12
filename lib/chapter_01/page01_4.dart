import 'package:flutter/material.dart';

class Page014 extends StatefulWidget {
  @override
  _Page014State createState() => _Page014State();
}

class _Page014State extends State<Page014> {
  // variables to store the selected values for the containers
  String _firstContainerText = '';
  String _secondContainerText = '';
  String _selectedOutput = '';
  String _correctAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('Chapter 04_4', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '결과를 맞혀 봅시다.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '다음은 간단한 자바 프로그램입니다. 그런데 한 블록이 빠져 있습니다. '
                  '왼쪽 하단에 있는 후보 코드를 사용했을 때 어떤 것이 출력될지 맞혀 봅시다. '
                  '출력 행 중에는 쓰이지 않는 것도 있고 어떤 것은 여러 번 쓰일 수도 있습니다. '
                  '후보 코드 블록과 그 블록을 사용했을 때 출력될 결과물을 연결하는 선을 그어 보세요.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            _buildCandidateCodeSection(),
            SizedBox(height: 16),
            _buildJavaCodeSection(),
            SizedBox(height: 16),
            _buildOutputSection(),
            SizedBox(height: 16),
            _buildCheckAnswerButton(),  // check answer button
            if (_correctAnswer.isNotEmpty) // answer check message
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text(
                    _correctAnswer,
                    style: TextStyle(
                      color: _correctAnswer == "정답입니다!" ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // builds the section containing candidate code blocks
  Widget _buildCandidateCodeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '후보코드',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            _buildCodeButton('i < 9\nindex < 5'),
            _buildCodeButton('i < 20\nindex < 5'),
            _buildCodeButton('i < 7\nindex < 7'),
            _buildCodeButton('i < 19\nindex < 1'),
          ],
        ),
      ],
    );
  }

  // builds the section displaying the Java code with empty containers
  Widget _buildJavaCodeSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5,),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'public class Mix4 {',
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'int counter = 0;',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  'public static void main(String[] args) {',
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'int count = 0;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Mix4[] mixes = new Mix4[20];',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'int i = 0;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            'while ( ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.5,),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                _firstContainerText, // display text in the first container
                                style: TextStyle(fontSize: 16, color: Colors.green[800],),
                              ),
                            ),
                          ),
                          Text(
                            ' ) {',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'mixes[i] = new Mix4();',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'mixes[i].counter = mixes[i].counter + 1;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'count = count + 1;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'count = count + mixes[i].maybeNew(i);',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'i = i + 1;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'System.out.println(count + " " + mixes[1].counter);',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text(
                  '}',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  'public int maybeNew(int index) {',
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'if ( ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.5,),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                _secondContainerText, // display text in the second container
                                style: TextStyle(fontSize: 16, color: Colors.green[800],),
                              ),
                            ),
                          ),
                          Text(
                            ' ) {',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mix4 mix = new Mix4();',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'mix.counter = mix.counter + 1;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'return 1;',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '}',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'return 0;',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text(
                  '}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            '}',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  String _selectedCode = ''; // variable to track the selected code button

  // builds a button for each candidate code
  Widget _buildCodeButton(String code) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // when the button is clicked, split the first and second lines into the respective containers
          List<String> splitCode = code.split('\n');
          _firstContainerText = splitCode[0];
          _secondContainerText = splitCode[1];
          _selectedCode = code; // save the selected code
          _selectedOutput = ''; // reset the previous output when a new code is selected
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedCode == code
            ? Colors.green[200]
            : Colors.blueGrey[50],
        foregroundColor: Colors.grey,
      ),
      child: Text(
        code,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87),
      ),
    );
  }

  // builds the section containing output options
  Widget _buildOutputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            _buildOutputButton('14 7'),
            _buildOutputButton('9 5'),
            _buildOutputButton('19 1'),
            _buildOutputButton('14 1'),
            _buildOutputButton('25 1'),
            _buildOutputButton('7 7'),
            _buildOutputButton('20 1'),
            _buildOutputButton('20 5'),
          ],
        ),
      ],
    );
  }

  // builds a button for each output option
  Widget _buildOutputButton(String output) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedOutput = output;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedOutput == output
            ? Colors.green[200]
            : Colors.blueGrey[50],
        foregroundColor: Colors.grey,
      ),
      child: Text(
        output,
        textAlign: TextAlign.center,
      ),
    );
  }

  // builds the "Check Answer" button
  Widget _buildCheckAnswerButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // logic to check the correct answer
          if (_firstContainerText == 'i < 9' && _secondContainerText == 'index < 5' && _selectedOutput == '14 1') {
            _correctAnswer = '정답입니다!';
          } else if (_firstContainerText == 'i < 20' && _secondContainerText == 'index < 5' && _selectedOutput == '25 1') {
            _correctAnswer = '정답입니다!';
          } else if (_firstContainerText == 'i < 7' && _secondContainerText == 'index < 7' && _selectedOutput == '14 1') {
            _correctAnswer = '정답입니다!';
          } else if (_firstContainerText == 'i < 19' && _secondContainerText == 'index < 1' && _selectedOutput == '20 1') {
            _correctAnswer = '정답입니다!';
          } else {
            _correctAnswer = '틀렸습니다.';
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[200], // set button background color
        foregroundColor: Colors.grey, // set button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // set button corner radius
        ),
      ),
      child: Text(
        '정답 확인',
        style: TextStyle(color: Colors.black87, fontSize: 16.0), // set button text style
      ),
    );
  }
}
