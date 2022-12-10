import 'package:flutter/material.dart';

class SubmissionListView extends StatelessWidget {
  const SubmissionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Image(image: AssetImage('assets/images/ic_tick_green.png')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Form Title'),
                      Text('Form Description')
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}