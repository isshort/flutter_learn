import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:use_case_todo/custom_card/custom_text_field.dart';

enum CardType { master, visa }

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (newValue.selection.baseOffset == 0) return newValue;
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex.isEven && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class PaymentCardBody extends StatelessWidget {
  PaymentCardBody({
    super.key,
  });
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expireDate = TextEditingController();
  final TextEditingController secretCod = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: cardNumber,
          label: 'card Number',
          keyBoardType: TextInputType.phone,
          mask: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            CardNumberInputFormatter(),
          ],
          hinText: 'Card Number',
          // color: context.colors.onSecondary,
        ),
        const SizedBox(
          height: 23,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                keyBoardType: TextInputType.number,
                controller: expireDate,
                label: 'date ',
                hinText: 'MM/YY',
                mask: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  CardDateInputFormatter(),
                ],
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: secretCod,
                label: 'secret',
                hinText: 'CVC',
                mask: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
