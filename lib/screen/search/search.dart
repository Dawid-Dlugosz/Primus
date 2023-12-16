import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: const Text('Searcher'), // TODO MAKE TRANSALTION
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                // viewModel.name = value;
              });
            },
            controller: _controller,
            decoration: InputDecoration.collapsed(
              hintText: AppLocalizations.of(context)!.flashcardsName,
              border: const OutlineInputBorder(),
            ),
          ),
          _controller.text.isEmpty
              ? const Text('Wyszukaj coś')
              : const SizedBox(),
          // : StreamBuilder<QuerySnapshot>(
          //     stream: viewModel.snapshot,
          //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          //       if (snapshots.connectionState == ConnectionState.waiting) {
          //         return const LoadingWidget();
          //       }

          //       if (snapshots.hasData &&
          //           snapshots.data != null &&
          //           snapshots.data!.docs.isNotEmpty) {
          //         return ListSearch(snapshots, viewModel.name);
          //       }

          //       return const SizedBox();
          //     },
          //   ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'list_search.dart';

// import '../../view_models/search_view_model.dart';

// import '../../core/screens/loading_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   late SeachViewModel model;

//   @override
//   void dispose() {
//     model.textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SeachViewModel>(builder: (_, viewModel, __) {
//       model = viewModel;
//       if (!viewModel.loading) {
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             title: const Text('Searcher'), // TODO MAKE TRANSALTION
//           ),
//           body: Column(
//             children: [
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     viewModel.name = value;
//                   });
//                 },
//                 controller: viewModel.textEditingController,
//                 decoration: InputDecoration.collapsed(
//                   hintText: AppLocalizations.of(context)!.flashcardsName,
//                   border: const OutlineInputBorder(),
//                 ),
//               ),

//               // TODO MAKE SEARCHER SCREEN
//               viewModel.name.isEmpty
//                   ? const Text('Wyszukaj coś')
//                   : StreamBuilder<QuerySnapshot>(
//                       stream: viewModel.snapshot,
//                       builder:
//                           (context, AsyncSnapshot<QuerySnapshot> snapshots) {
//                         if (snapshots.connectionState ==
//                             ConnectionState.waiting) {
//                           return const LoadingWidget();
//                         }

//                         if (snapshots.hasData &&
//                             snapshots.data != null &&
//                             snapshots.data!.docs.isNotEmpty) {
//                           return ListSearch(snapshots, viewModel.name);
//                         }

//                         return const SizedBox();
//                       },
//                     ),
//             ],
//           ),
//         );
//       } else {
//         return const LoadingWidget();
//       }
//     });
//   }
// }
