import 'package:flutter/material.dart';

import '../data/model/empty_form.dart';
import 'bottom_nav_view.dart';

class FormListView extends StatelessWidget {
  List<EmptyForm> formList;

  FormListView({
    required this.formList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 12,),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: formList.length,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconWidget(asset: 'assets/images/ic_form_gray.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formList[index].label ??= '',
                        overflow: TextOverflow.ellipsis,),
                      Text(formList[index].description ??= '',
                      overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}