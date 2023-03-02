import 'package:flutter/material.dart';

class RatingFormField extends FormField<int> {
  static const int numberOfStars = 5;
  RatingFormField({
    Key? key,
    FormFieldSetter<int>? onSaved,
    FormFieldValidator<int>? validator,
    InputDecoration? decoration,
    int? initialValue,
  }) : super(
          key: key,
          initialValue: initialValue ?? 0,
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value < 1 || value > 5) {
              return 'Please choose a rating';
            }
            return validator?.call(value);
          },
          builder: (FormFieldState<int> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      numberOfStars, (index) => _buildStar(index + 1, state)),
                ),
                if (state.hasError)
                  Text(
                    state.errorText!,
                    style: TextStyle(
                        color: Theme.of(state.context).colorScheme.error),
                  ),
              ],
            );
          },
        );

  static const double _starSize = 48;

  static Widget _buildStar(int value, FormFieldState<int> state) {
    final icon = Icon(
      value <= state.value! ? Icons.star : Icons.star_border,
      size: _starSize,
      color: Theme.of(state.context).primaryColor,
    );
    return GestureDetector(
      onTap: () {
        state.didChange(value);
      },
      child: icon,
    );
  }
}
