import 'package:flutter/material.dart';

class RatingFormField extends FormField<int> {
  RatingFormField({
    Key? key,
    FormFieldSetter<int>? onSaved,
    FormFieldValidator<int>? validator,
    int? initialValue = 0,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<int> state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => InkWell(
                  onTap: () {
                    state.didChange(index + 1);
                  },
                  child: Icon(
                    index < state.value! ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                ),
              ),
            );
          },
        );
}
