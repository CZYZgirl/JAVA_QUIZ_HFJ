import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Page013 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('Chapter 01_3', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '낱말퀴즈',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '이제 오른쪽 두뇌도 일을 시켜봅시다.',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "일반적인 십자 낱말풀이랑 똑같이 풀면 됩니다. 대부분의 해답은 1장에 이미 나와 있습니다. "
                  "정신을 집중해서 한번 풀어 보세요. 자바와는 상관없는 기술 용어도 몇 개 들어 있습니다.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Expanded(
              child: HtmlWidget(
                '<iframe src="https://czyzgirl.github.io/java_crossword/" style="height:100%;"></iframe>',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
