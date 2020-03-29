# Changlog

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