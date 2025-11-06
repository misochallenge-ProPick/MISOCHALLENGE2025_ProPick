import 'package:flutter/material.dart';
import 'package:propick/repository/ev_repository.dart';
import 'package:propick/page/list_page.dart';
import 'package:propick/page/firstLoading_page.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/page/inputArea_page.dart';
import 'package:propick/page/inputType_page.dart';
import 'package:propick/page/main_page.dart';
import 'package:propick/page/summary_page.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ItemProvider())],
      child: const MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WelfareDetailPage());
  }
}
