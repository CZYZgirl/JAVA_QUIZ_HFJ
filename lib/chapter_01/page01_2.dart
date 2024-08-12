import 'package:flutter/material.dart';

class Page012 extends StatefulWidget {
  @override
  _Page012State createState() => _Page012State();
}

class _Page012State extends State<Page012> {
  bool _showAnswers = false;
  final ScrollController _scrollController = ScrollController();

  // toggles the visibility of answers and scrolls down if answers are shown
  void _toggleAnswers() {
    setState(() {
      _showAnswers = !_showAnswers;
    });

    // scrolls down after a short delay to ensure the answers are visible
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
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
        title: Text(
          'Chapter 04_2',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          controller: _scrollController,
          children: [
            // exercise title
            Text(
              '연습 문제',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // exercise subtitle
            Text(
              '컴파일러가 되어 봅시다',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            // exercise description
            Text(
              "이 페이지에 나와 있는 자바 파일은 하나의 온전한 소스 파일입니다. 이제 컴파일러 입장에서 각 파일을 무사히 컴파일 할 수 있을지 생각해 보세요. "
                  "만약 컴파일이 되지 않는다면 어떻게 해야 문제점을 해결할 수 있을까요? 그리고 컴파일이 잘 된다면 그 출력결과는 어떻게 될까요?'",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),

            // first code block container
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // block label
                  Text(
                    'A.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // code snippet
                  Text(
                    '''
class XCopy {

   public static void main(String[] args) {
      int orig = 42;
      XCopy x = new XCopy();
      int y = x.go(orig);
      System.out.println(orig + " " + y);
   }

   int go(int arg) {
      arg = arg * 2;
      return arg;    
   }
}
                    ''',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  // user input field
                  TextField(
                    maxLines: null, // allow multiple lines
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // border color for enabled state
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.shade700, // border color for focused state
                          width: 1.0,
                        ),
                      ),
                      hintText: "컴파일이 된다면 결과를,\n되지 않는다면 어떻게 해결할 수 있는지 입력하세요.",
                      hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // second code block container
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // block label
                  Text(
                    'B.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // code snippet
                  Text(
                    '''
class Clock {
   String time;
   void setTime(String t){
      time = t;
   }

   String getTime() {
      return time;
   }
}

class ClockTestDrive {
   public static void main(String[] args) {
      Clock c = new Clock();

      c.setTime("1245");
      String tod = c.getTime();
      System.out.println("time:" + tod);
   }
}
                    ''',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  // user input field
                  TextField(
                    maxLines: null, // allow multiple lines
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // border color for enabled state
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.shade700, // border color for focused state
                          width: 1.0,
                        ),
                      ),
                      hintText: "컴파일이 된다면 결과를,\n되지 않는다면 어떻게 해결할 수 있는지 입력하세요.",
                      hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // check answers button
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _toggleAnswers,
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

            // show answers if _showAnswers is true
            if (_showAnswers) ...[
              SizedBox(height: 16),
              _buildAnswer('A.', "XCopy 클래스는 별 문제 없이 컴파일과 실행이 됩니다. 출력 결과는 ‘42 84’이지요. 자바는 값으로 전달(즉, 복사본으로 전달)한다는 점을 기억하시죠? 따라서 go() 메서드를 실행시키더라도 원래 ‘orig’ 변수에 들어 있던 값은 바뀌지 않습니다."),
              SizedBox(height: 16),
              _buildAnswer('B.', "게터 메서드는 그 정의상 반드시 리턴 타입이 정해져 있어야만 합니다. void getTime( ) -> String getTime( )"),
            ],
          ],
        ),
      ),
    );
  }

  // helper method to build answer sections
  Widget _buildAnswer(String title, String answer) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            answer,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
