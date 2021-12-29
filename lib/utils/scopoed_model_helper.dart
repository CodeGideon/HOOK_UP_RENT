import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of(context, rebuildOnChange: true);
  }
}
