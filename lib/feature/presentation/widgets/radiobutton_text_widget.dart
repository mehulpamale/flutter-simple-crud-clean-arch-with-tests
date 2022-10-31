import 'package:flutter/material.dart';

///
class RadioButtonTextWidget extends StatelessWidget {
  /// onChange Function
  final ValueChanged<String> onChanged;

  ///
  final String text;

  ///
  final String option;

  ///
  final String radioButtonGroup;

  ///
  final EdgeInsets? padding;

  ///
  const RadioButtonTextWidget({
    Key? key,
    required this.onChanged,
    required this.text,
    required this.option,
    required this.radioButtonGroup,
    this.padding,
  }) : super(key: key);

  ///
  void onValueChange() {
    onChanged(option);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onValueChange,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Radio<String>(
                  value: option,
                  onChanged: (value) {
                    onChanged(option);
                  },
                  groupValue: radioButtonGroup,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
