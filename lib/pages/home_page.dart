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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: HomeAppBar(
          title: 'PT Virtue Digital Indonesia'),
      bottomNavigationBar: const BottomNavigationView(),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: (provider.currentPage == 0)
            ? FormScreen (title: 'Forms', listView : FormListView(formList: provider.emptyForms,))
            : (provider.currentPage == 1)
                ? FormScreen (title: 'Drafts', listView : DraftListView(formList: []))
                : FormScreen (title: 'Submission', listView : SubmissionListView(data: provider.submissionForms,)),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomePageProvider>().getTemplateForms(context);
      context.read<HomePageProvider>().getSubmissionForms(context);
    });
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

class EmptyScreen extends StatelessWidget {
  String title;
  String description;
  String image;

  EmptyScreen({Key? key,
  required this.title, required this.description, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 42,),
          Text(title, style: Theme.of(context).textTheme.headlineSmall,),
          const SizedBox(height: 12),
          Text(description, style: Theme.of(context).textTheme.bodyMedium,),
          const SizedBox(height: 56)
        ],
      ),
    );
  }
}

