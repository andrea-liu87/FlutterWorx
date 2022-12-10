import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/providers/home_page_provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_nav_view.dart';
import '../widgets/draft_list_view.dart';
import '../widgets/form_list_view.dart';
import '../widgets/submission_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomePageProvider provider = Provider.of(context, listen: true);
    print(provider.currentPage);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: HomeAppBar(
          title: 'PT Virtue Digital Indonesia'),
      bottomNavigationBar: const BottomNavigationView(),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: (provider.currentPage == 0)
            ? FormScreen (title: 'Forms', listView : FormListView())
            : (provider.currentPage == 1)
                ? FormScreen (title: 'Drafts', listView : DraftListView())
                : FormScreen (title: 'Submission', listView : SubmissionListView()),
      ),
    );
  }
}

class FormScreen extends StatelessWidget {
  String title;
  Widget listView;

  FormScreen({Key? key, required this.title, required this.listView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black),
          ),
        ),
        Expanded(
          child: listView,
        )
      ],
    );
  }
}
