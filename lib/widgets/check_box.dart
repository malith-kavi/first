import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String name;
  final bool initialChecked;
  final Function(bool isChecked) onChanged;
  final double checkBoxSize;
  final double textSize;
  final double checkBoxPadding;

  const CustomCheckBox({
    required this.name,
    required this.onChanged,
    this.initialChecked = false,
    this.checkBoxSize = 20,
    this.textSize = 16,
    this.checkBoxPadding = 10,
    Key? key,
    required bool isChecked,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue!;
              widget.onChanged(isChecked);
            });
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          activeColor:
              isChecked ? Color.fromARGB(255, 58, 71, 192) : Colors.blue,
        ),
        SizedBox(width: widget.checkBoxPadding),
        Text(
          widget.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: widget.textSize,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
