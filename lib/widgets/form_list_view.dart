import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/pages/home_page.dart';
import 'package:worx/routes.dart';

import '../data/model/form/empty_form.dart';
import '../providers/detail_form_provider.dart';
import 'bottom_nav_view.dart';

class FormListView extends StatelessWidget {
  List<EmptyForm> formList;

  FormListView({
    required this.formList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailFormProvider detailProvider = Provider.of(context);
    if (formList.isEmpty ){
      return EmptyScreen(
          title: 'No Forms',
          description: 'You currently not signed to any forms. Please contact your admin to add forms to your device.',
          image: 'assets/images/empty_forms.png');
    } else {
      return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 12,),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: formList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              detailProvider.startFillEmptyForm(formList[index]);
              AppNavigator.push(Routes.detail);},
            child: Container(
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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formList[index].label ??= '',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,),
                          const SizedBox(height: 2,),
                          Text(formList[index].description ??= '',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    }
  }
}