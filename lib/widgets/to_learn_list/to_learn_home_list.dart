import 'package:primus/model/to_learn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/screen/show_all/all_to_learn.dart';
import 'package:primus/view_models/to_learn_home_view_model.dart';
import 'package:primus/widgets/to_learn_list/to_learn_wrapper.dart';
import 'package:provider/provider.dart';

class ToLearnHomeList extends StatefulWidget {
  const ToLearnHomeList({required this.toLearn, required this.delete, Key? key}) : super(key: key);
  final List<ToLearn> toLearn;
  final Function(String flashcardId) delete;

  @override
  State<ToLearnHomeList> createState() => _ToLearnHomeListState();
}

class _ToLearnHomeListState extends State<ToLearnHomeList> {
  @override
  Widget build(BuildContext context) {
    return widget.toLearn.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.duringStudy),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.toLearn.take(3).length,
                itemBuilder: (context, index) {
                  return ToLearnWrapper(
                    toLearn: widget.toLearn[index],
                    delete: widget.delete,
                  );
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (context) => ToLearnHomeViewModel(context),
                          child: const AllToLearn(),
                        ),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.showMore),
                ),
              ),
            ],
          )
        : Container();
  }
}
