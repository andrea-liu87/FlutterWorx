import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:worx/data/model/form/submission_form.dart';

import '../pages/home_page.dart';

class SubmissionListView extends StatelessWidget {
  List<SubmissionForm> data;

  SubmissionListView({
    Key? key, required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty ){
      return EmptyScreen(
          title: 'No Submission',
          description: 'You currently not submit any forms.',
          image: 'assets/images/empty_forms.png');
    } else {
      return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12,),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image(
                        image: AssetImage('assets/images/ic_tick_green.png')),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].label ??= '',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2,),
                          Text(_formatDate(data[index].submitDate),
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }

  String _formatDate(String? date){
    if (date == null) return 'No submitted date';
    var dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS'Z").parse(date);
    return 'Submitted on ${DateFormat("dd/MM/yyyy hh:mm a").format(dateTime)}';
  }
}