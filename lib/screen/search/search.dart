import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/core/widgets/search_something.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/search/presentation/search/search_cubit.dart';
import 'package:primus/screen/search/list_search.dart';
import 'package:primus/widgets/empty_widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.searcher),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _controller.text = value;
                });
                context.read<SearchCubit>().searchFlashcard(name: value);
              },
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                hintText: AppLocalizations.of(context)!.flashcardsName,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _controller.text.isEmpty
              ? const SearchSomething()
              : BlocBuilder<SearchCubit, List<FlashcardSet>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return const EmptyWidget();
                    } else {
                      return ListSearch(
                        flashcardSets: state,
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
