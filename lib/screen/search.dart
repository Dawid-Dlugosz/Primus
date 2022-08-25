import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SeachViewModel>(builder: (_, viewModel, __) {
      if (!viewModel.loading) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              onChanged: (value) {
                viewModel.searchFlashcard(value);
              },
              autofocus: true,
              decoration: InputDecoration.collapsed(
                hintText: AppLocalizations.of(context)!.flashcardsName,
              ),
            ),
          ),
          body: Container(),
        );
      } else {
        return LoadingWidget();
      }
    });
  }
}
