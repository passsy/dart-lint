# Changelog

## 1.10.0 

Requires Dart `sdk: '>=2.17.0'`

- Removal of [`invariant_booleans`](https://dart-lang.github.io/linter/lints/invariant_booleans.html)

## 1.9.0 (Future release)

Requires Dart `sdk: '>=2.16.0-44.0.dev <3.0.0'`

## 1.8.2

[pana](https://github.com/dart-lang/pana) lint rules have been relaxed. No need for those two rules in the `package` version:
- Remove [`lines_longer_than_80_chars`](https://dart-lang.github.io/linter/lints/lines_longer_than_80_chars.html) from `analysis_options_package.yaml`
- Remove [`prefer_single_quotes`](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html) from `analysis_options_package.yaml`

## 1.8.1

Requires Dart `sdk: '>=2.15.0-7.0.dev <3.0.0'`

- Enable [`always_use_package_imports`](https://dart-lang.github.io/linter/lints/always_use_package_imports.html)
- Enable [`avoid_double_and_int_checks`](https://dart-lang.github.io/linter/lints/avoid_double_and_int_checks.html)
- Enable [`use_is_even_rather_than_modulo`](https://dart-lang.github.io/linter/lints/use_is_even_rather_than_modulo.html)
- [`parameter_assignments`](https://dart-lang.github.io/linter/lints/parameter_assignments.html) is now a warning (was hint)
- [`missing_required_param`](https://dart-lang.github.io/linter/lints/missing_required_param.html) is now a error (was warning)
- [`missing_return`](https://dart-lang.github.io/linter/lints/missing_return.html) is now an error (was warning)
- ignore any errors in auto-generated flutter file `lib/generated_plugin_registrant.dart`

### Package

- Enable [`library_private_types_in_public_api`](https://dart-lang.github.io/linter/lints/library_private_types_in_public_api.html)
- Enable [`lines_longer_than_80_chars`](https://dart-lang.github.io/linter/lints/lines_longer_than_80_chars.html)
- Enable [`prefer_single_quotes`](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html)

Big thanks to @rydmike for comparing all popular lint packages, identifying missing rules for this `lint`

## 1.8.0

Requires Dart `sdk: '>=2.15.0-7.0.dev <3.0.0'`

- Enable [`avoid_dynamic_calls`](https://dart-lang.github.io/linter/lints/avoid_dynamic_calls.html)

## 1.7.2

Requires Dart `sdk: '>=2.14.0-360.0.dev <3.0.0'`

- Enable [`eol_at_end_of_file`](https://dart-lang.github.io/linter/lints/eol_at_end_of_file.html)

## 1.7.1

Requires Dart `sdk: '>=2.14.0-172.0.dev <3.0.0'`

- Enable [`depend_on_referenced_packages`](https://dart-lang.github.io/linter/lints/depend_on_referenced_packages.html)
- Enable [`noop_primitive_operations`](https://dart-lang.github.io/linter/lints/noop_primitive_operations.html)
- Enable [`prefer_final_parameters`](https://dart-lang.github.io/linter/lints/prefer_final_parameters.html)
- Enable [`use_test_throws_matchers`](https://dart-lang.github.io/linter/lints/use_test_throws_matchers.html)

## 1.7.0

Requires Dart `sdk: '>=2.14.0-2.0.dev <3.0.0'`

- Enable [`prefer_null_aware_method_calls`](https://dart-lang.github.io/linter/lints/prefer_null_aware_method_calls.html)
- Enable [`require_trailing_commas`](https://dart-lang.github.io/linter/lints/require_trailing_commas.html)


## 1.6.0

Requires Dart `sdk: >=2.13.0 <3.0.0`

- Enable [`avoid_multiple_declarations_per_line`](https://dart-lang.github.io/linter/lints/avoid_multiple_declarations_per_line.html)
- Enable [`deprecated_consistency`](https://dart-lang.github.io/linter/lints/deprecated_consistency.html)
- Enable [`use_if_null_to_convert_nulls_to_bools`](https://dart-lang.github.io/linter/lints/use_if_null_to_convert_nulls_to_bools.html)
- Enable [`use_build_context_synchronously`](https://dart-lang.github.io/linter/lints/use_build_context_synchronously.html)
- Enable [`use_named_constants`](https://dart-lang.github.io/linter/lints/use_named_constants.html)

## 1.5.3

- Remove [avoid_dynamic_calls](https://dart-lang.github.io/linter/lints/avoid_dynamic_calls.html), which is not part of the stable Dart 2.12 release

## 1.5.2

Release for stable Dart `2.12.0`
- Enable [avoid_dynamic_calls](https://dart-lang.github.io/linter/lints/avoid_dynamic_calls.html)
- Enable [avoid_type_to_string](https://dart-lang.github.io/linter/lints/avoid_type_to_string.html)
- Enable [cast_nullable_to_non_nullable](https://dart-lang.github.io/linter/lints/cast_nullable_to_non_nullable.html)
- Enable [null_check_on_nullable_type_parameter](https://dart-lang.github.io/linter/lints/null_check_on_nullable_type_parameter.html)
- Enable [tighten_type_of_initializing_formals](https://dart-lang.github.io/linter/lints/tighten_type_of_initializing_formals.html)
- Enable [unnecessary_null_checks](https://dart-lang.github.io/linter/lints/unnecessary_null_checks.html)

## 1.5.1

Min SDK is `2.12.0-0`

Widen SDK contraints as long as nnbd is still in beta. 

## 1.5.0

Min SDK is `2.12.0`

- NNBD support

## 1.4.0-dev.d210.1

Release for Dart 2.10.0 with Linter v0.1.118

Min SDK is `2.10.0-5.0.dev`

- Enable [`use_late_for_private_fields_and_variables`](https://dart-lang.github.io/linter/lints/use_late_for_private_fields_and_variables.html)
- Enable [`unnecessary_nullable_for_final_variable_declarations`](https://dart-lang.github.io/linter/lints/unnecessary_nullable_for_final_variable_declarations.html)

## 1.3.0

Release for Dart 2.9.0 with Linter v0.1.117

Min SDK is `2.9.0-16.0.dev`

- Enable [`sized_box_for_whitespace`](https://dart-lang.github.io/linter/lints/sized_box_for_whitespace.html)
- Enable [`exhaustive_cases`](https://dart-lang.github.io/linter/lints/exhaustive_cases.html)

## 1.3.0-dev.d29.1

Dart SDK: >= 2.9.0-4.0.dev • (Linter v0.1.115)

- Enable [`sized_box_for_whitespace`](https://dart-lang.github.io/linter/lints/sized_box_for_whitespace.html)

## 1.2.0

Release for Dart 2.8.1 with Linter v0.1.114

Min SDK is `2.8.0-dev.16.0`

- Enable [`avoid_redundant_argument_values`](https://dart-lang.github.io/linter/lints/avoid_redundant_argument_values.html)
- Enable [`missing_whitespace_between_adjacent_strings`](https://dart-lang.github.io/linter/lints/missing_whitespace_between_adjacent_strings.html)
- Enable [`no_runtimeType_toString`](https://dart-lang.github.io/linter/lints/no_runtimeType_toString.html)
- Enable [`unnecessary_string_interpolations`](https://dart-lang.github.io/linter/lints/unnecessary_string_interpolations.html)
- Enable [`unnecessary_raw_strings`](https://dart-lang.github.io/linter/lints/unnecessary_raw_strings.html)
- Enable [`unnecessary_string_escapes`](https://dart-lang.github.io/linter/lints/unnecessary_string_escapes.html)
- Enable [`leading_newlines_in_multiline_strings`](https://dart-lang.github.io/linter/lints/leading_newlines_in_multiline_strings.html)

- Enable [`use_key_in_widget_constructors`](https://dart-lang.github.io/linter/lints/use_key_in_widget_constructors.html) for packages

## 1.2.0-dev.d28.2

Raise min sdk to `2.8.0-dev.16.0`

## 1.2.0-dev.d28.1

- Dart 2.8 pre-release
- Enable [`avoid_redundant_argument_values`](https://dart-lang.github.io/linter/lints/avoid_redundant_argument_values.html)
- Enable [`missing_whitespace_between_adjacent_strings`](https://dart-lang.github.io/linter/lints/missing_whitespace_between_adjacent_strings.html)
- Enable [`no_runtimeType_toString`](https://dart-lang.github.io/linter/lints/no_runtimeType_toString.html)
- Enable [`unnecessary_string_interpolations`](https://dart-lang.github.io/linter/lints/unnecessary_string_interpolations.html)
- Enable [`unnecessary_raw_strings`](https://dart-lang.github.io/linter/lints/unnecessary_raw_strings.html)
- Enable [`unnecessary_string_escapes`](https://dart-lang.github.io/linter/lints/unnecessary_string_escapes.html)
- Enable [`leading_newlines_in_multiline_strings`](https://dart-lang.github.io/linter/lints/leading_newlines_in_multiline_strings.html)

## 1.1.1

- Fix syntactical error which breaks custom rules [#5](https://github.com/passsy/dart-lint/issues/5)

## 1.1.0

Release for Dart 2.7
- Enable [`prefer_is_not_operator`](https://dart-lang.github.io/linter/lints/prefer_is_not_operator.html)
- Enable [`avoid_unnecessary_containers`](https://dart-lang.github.io/linter/lints/avoid_unnecessary_containers.html)

## 1.0.0

Release for Dart 2.6
 - Enable [`camel_case_extensions`](https://dart-lang.github.io/linter/lints/camel_case_extensions.html)

## 0.3.1

- Add `Example` tab to https://pub.dev/packages/lint

## 0.3.0

- Disable `one_member_abstracts` [#2](https://github.com/passsy/dart-lint/issues/2)
- Disable `sort_constructors_first` [#1](https://github.com/passsy/dart-lint/issues/1)

New version schema:

- `0.3.0+dart202`: Dart 2.2 Release `sdk: '>=2.2.0 <2.3.0'`
- `0.3.0+dart203`: Dart 2.3 Release `sdk: '>=2.3.0 <2.4.0'`
- `0.3.0+dart204`: Dart 2.4 Release `sdk: '>=2.4.0 <2.5.0'`
- `0.3.0+dart205`: Dart 2.5 Release `sdk: '>=2.5.0 <3.0.0'`

## 0.2.3

- Release for Dart 2.5 enables
  - `avoid_print`

## 0.2.2

- Release for Dart 2.4 enables
  - `prefer_if_null_operators`
  - `sort_child_properties_last`
  - `unsafe_html`

## 0.2.1

- Release for Dart 2.3 enables 
  - `prefer_for_elements_to_map_fromIterable`
  - `prefer_if_elements_to_conditional_expressions`
  - `prefer_inlined_adds`
  - `prefer_spread_collections`

## 0.2.0

- Fix `analysis_options_package.yaml` (wrong import)
- Release for Dart 2.2. All incompatible rules are removed

## 0.1.1
- `pubspec.yaml` `homepage` fix

## 0.1.0

- app rule set `analysis_options_package.yaml`
- package rule set `analysis_options_package.yaml`
