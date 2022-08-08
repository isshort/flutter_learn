import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef FutureStringResult = Future<String?> Function();

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomTextField Title')),
      body: Column(
        children: [
          Stack(
            children: [
              const Divider(
                indent: 190,
                endIndent: 190,
                height: 33,
                thickness: 3,
                color: Colors.black,
              ),
              Positioned.fill(
                  // right: KZero.toDouble,
                  child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.close,
                    )),
              ))
            ],
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      this.validator,
      required this.label,
      this.isEnable,
      required this.onAction})
      : super(key: key);
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String label;
  final FutureStringResult onAction;
  final bool? isEnable;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Future<void> _updateController(String? value) async {
    if (value == null || value.isEmpty) return;
    widget.textEditingController.text = value;
  }

  Future<void> callAction() async {
    final result = await widget.onAction.call();
    _updateController(result);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: callAction,
      enabled: true,
      controller: widget.textEditingController,
      inputFormatters: const [],
      validator: (value) {
        return null;
      },
      // suffixIcon:
      // labelText
      // autofillHints: ,
    );
  }
}
