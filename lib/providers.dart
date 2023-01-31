import 'package:eddproject/personalization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personalizationProvider = ChangeNotifierProvider<PersonalizationProvider>(
  (ref) => PersonalizationProvider(),
);
