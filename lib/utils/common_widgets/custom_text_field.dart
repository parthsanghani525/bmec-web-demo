import 'package:flutter/material.dart';

typedef VoidCallbackFunction = void Function(dynamic value);
typedef VoidEmptyParameterCallbackFunction = void Function();
typedef StringCallbackFunction = String? Function(dynamic value);

Widget customTextField(
    {String? labelText,
      String? hintText,
      StringCallbackFunction? validation,
      Widget? suffix,
      Color? styleColor,
      VoidCallbackFunction? onSaved,
      int? maxLength,
      TextEditingController? controller,
      bool? obscureText,
      Widget? suffixIcon,
      VoidEmptyParameterCallbackFunction? onPress,
      VoidCallbackFunction? onChanged,
      TextInputType? textInputType,
      bool? readOnly}) {
  return SizedBox(
    width: double.infinity,
    child: TextFormField(
      controller: controller,
        onChanged: onChanged ,
        onSaved: onSaved,
        maxLength: maxLength ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: styleColor?? Colors.black),
        onTap: onPress ,
        readOnly: readOnly ?? false,
        validator: validation,
        obscureText: obscureText ?? false,
        keyboardType: textInputType ,
        decoration: InputDecoration(
          suffix: suffix ,
          suffixIcon: suffixIcon ,
          suffixStyle: const TextStyle(color: Colors.blue),
          labelText: labelText,
          labelStyle: const TextStyle(
              color:Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12),
          hintText: hintText,
          hintStyle: const TextStyle(
                color:  Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12),
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              width: 2.0,
              color:Colors.blue,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        )),
  );
}