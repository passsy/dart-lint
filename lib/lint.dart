/// The lint package ships an opinionated, community-driven set of lint rules for Dart and Flutter projects. Like pedantic but stricter
///
/// To enable `lint`,
/// 1. Add it to your dev_dependencies
/// ```yaml
/// dev_dependencies:
///   lint: ^1.0.0
/// ```
///
/// 2. Include the rules into your `analysis_options.yaml`
/// ```yaml
/// include: package:lint/analysis_options.yaml
/// ```
library lint;

export 'package:lint/fire_and_forget.dart';
