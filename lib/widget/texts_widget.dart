import 'package:flutter/material.dart';

class TextsWidgetView extends StatelessWidget {
  const TextsWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    var texts = Theme.of(context);
    List<TextModel> textStyles = [
      TextModel("Body Large", texts.textTheme.bodyLarge),
      TextModel("Body Medium", texts.textTheme.bodyMedium),
      TextModel("Body Small", texts.textTheme.bodySmall),
      TextModel("Display Large", texts.textTheme.displayLarge),
      TextModel("Display Medium", texts.textTheme.displayMedium),
      TextModel("Display Small", texts.textTheme.displaySmall),
      TextModel("Headline Large", texts.textTheme.headlineLarge),
      TextModel("Headline Medium", texts.textTheme.headlineMedium),
      TextModel("Headline Small", texts.textTheme.headlineSmall),
      TextModel("Label Large", texts.textTheme.labelLarge),
      TextModel("Label Medium", texts.textTheme.labelMedium),
      TextModel("Label Small", texts.textTheme.labelSmall),
      TextModel("Title Large", texts.textTheme.titleLarge),
      TextModel("Title Medium", texts.textTheme.titleMedium),
      TextModel("Title Small", texts.textTheme.titleSmall),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          TextModel textModel = textStyles[index];
          return Text(
            textModel.label,
            style: textModel.textStyle,
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: textStyles.length,
      ),
    );
  }
}

class TextModel {
  final String label;
  final TextStyle? textStyle;

  TextModel(this.label, this.textStyle);
}
