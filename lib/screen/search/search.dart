import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/screen/search/list_search.dart';

import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/widgets/empty_widget.dart';
import 'package:primus/widgets/error_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SeachViewModel model;

  @override
  void dispose() {
    model.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeachViewModel>(builder: (_, viewModel, __) {
      model = viewModel;
      if (!viewModel.loading) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Searcher'), // TODO MAKE TRANSALTION
          ),
          body: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    viewModel.name = value;
                  });
                },
                controller: viewModel.textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: AppLocalizations.of(context)!.flashcardsName,
                  border: const OutlineInputBorder(),
                ),
              ),

              // TODO MAKE SEARCHER SCREEN
              viewModel.name.isEmpty
                  ? const Text('Wyszukaj coś')
                  : StreamBuilder<QuerySnapshot>(
                      stream: viewModel.snapshot,
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                        if (snapshots.connectionState == ConnectionState.waiting) {
                          return const LoadingWidget();
                        }

                        if (snapshots.hasData && snapshots.data != null && snapshots.data!.docs.isNotEmpty) {
                          return ListSearch(snapshots, viewModel.name);
                        }

                        return const CustomErrorWidget();
                      },
                    ),
            ],
          ),
        );
      } else {
        return const LoadingWidget();
      }
    });
  }
}
