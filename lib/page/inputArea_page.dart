import 'package:flutter/material.dart';
import 'package:propick/page/inputType_page.dart';

class InputAreaPage extends StatefulWidget {
  const InputAreaPage({super.key});

  @override
  State<InputAreaPage> createState() => _InputAreaPageState();
}

class _InputAreaPageState extends State<InputAreaPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              value: 0.99,
              backgroundColor: Colors.grey[300],
              color: Color.fromARGB(255, 34, 92, 168),
              minHeight: 5.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputTypePage()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),


        body: Column(
          children: [
            SizedBox(height: 18),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "이제 마지막이에요!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "회원님은 어느 지역에 거주하시나요?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // child: DropdownButton(
              //   items: [
                  
              //   ],
              //   onChanged: 
              // ),
            ),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color.fromARGB(255, 34, 92, 168),
            ),
            onPressed: () {},
            child: Text(
              "완료",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),


      ),
    );
  }
}
