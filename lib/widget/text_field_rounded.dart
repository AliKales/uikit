import 'package:flutter/material.dart';

class TextFieldRounded extends StatelessWidget {
  const TextFieldRounded({
    Key? key,
    this.labelText,
    this.hintText,
    this.textEditingController,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? textEditingController;
  final Function(String text)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return labelText == null
        ? _textField(context)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelText!, style: Theme.of(context).textTheme.titleLarge),
              _textField(context),
            ],
          );
  }

  DecoratedBox _textField(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: textEditingController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hintText),
      ),
    );
  }
}
