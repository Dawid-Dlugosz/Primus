import 'package:flutter/material.dart';
import '../../model/to_learn.dart';
import '../../view_models/to_learn_home_view_model.dart';
import '../../widgets/empty_widget.dart';
import '../../core/screens/loading_widget.dart';
import '../../widgets/to_learn_list/to_learn_wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AllToLearn extends StatefulWidget {
  const AllToLearn({Key? key}) : super(key: key);

  @override
  State<AllToLearn> createState() => _AllToLearnState();
}

class _AllToLearnState extends State<AllToLearn> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToLearnHomeViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.toStudy),
                ),
                body: StreamBuilder<List<ToLearn>>(
                  stream: Stream.fromFuture(viewModel.getUserToLearn()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    }

                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ToLearnWrapper(
                            toLearn: snapshot.data![index],
                            delete: viewModel.deleteToLearn,
                          );
                        },
                      );
                    }
                    return const EmptyWidget();
                  },
                ),
              )
            : const LoadingWidget();
      },
    );
  }
}
