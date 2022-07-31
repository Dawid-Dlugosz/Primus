import 'package:flutter/material.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (_, viewModel, __) {
      return !viewModel.loading
          ? Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('Primus'),
              ),
              body: Container(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  viewModel.showBottomDialog();
                },
                child: const Icon(Icons.add),
              ),
            )
          : const LoadingWidget();
    });
  }
}
