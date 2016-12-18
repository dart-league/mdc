import 'dart:html';

import 'package:mdc/mdc.dart' as mdc;

void main() {
  mdc.autoInit();

  FormElement form = querySelector('#greeting-form');

  form.onSubmit.listen(onSubmit);
}

void onSubmit(Event event) {
  event.preventDefault();
  String firstname = getInputValue('#firstname');
  String lastname = getInputValue('#lastname');

  String greeting = 'Hello';

  if (firstname.isNotEmpty || lastname.isNotEmpty) {
    greeting += ', ';

    if (firstname.isNotEmpty && lastname.isNotEmpty) {
      greeting += firstname + ' ' + lastname;
    } else if (lastname.isNotEmpty) {
      greeting += 'Mx. ' + lastname;
    } else {
      greeting += firstname;
    }
  }
  greeting += '!';

  ParagraphElement p = querySelector('#greeting');
  p.text = greeting;
}

String getInputValue(String selector) {
  InputElement input = querySelector(selector);
  return input.value;
}
