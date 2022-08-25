import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_navigator/modules/basket/basket.dart';

class BasketView extends StatelessWidget {
  const BasketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketView Title'),
        actions: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                      const SnackBar(content: Text('Submitting ok')));
                // showDialog<void>(
                //   context: context,
                //   builder: (_) => const SuccessDialog(),
                // );
              },
              child: const Text('Click Me'))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductListState) {
                return ListView.builder(
                  itemCount: state.productList.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.productList[index].name),
                    leading: const FlutterLogo(),
                    trailing: Text(state.productList[index].price.toString()),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      )),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Icon(Icons.info),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Form Submitted Successfully!',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
