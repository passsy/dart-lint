[![Pub](https://img.shields.io/pub/v/lint.svg)](https://pub.dartlang.org/packages/lint) 
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

# Lint for Dart/Flutter


<p align="center">
  <img src="https://user-images.githubusercontent.com/1096485/66209493-bc0ec900-e6b7-11e9-80c6-222e778f0c8d.png">
</p>

`lint` is a hand-picked, open-source, community-driven collection of lint rules for Dart and Flutter projects.
The set of rules follows the [Effective Dart: Style Guide](https://dart.dev/guides/language/effective-dart/style).

This package can be used as a replacement for [`package:pedantic`](https://github.com/dart-lang/pedantic) for those who prefer stricter rules.

## Install

Add `lint` as dependency to your `pubspec.yaml`
```yaml
dev_dependencies:
  lint: ^1.0.0
```

Create a `analysis_options.yaml` file in the root of your project and import the `lint` rules:

```yaml
include: package:lint/analysis_options.yaml
```

If you're writing a package with a public API you should use the `package` version instead
```yaml
include: package:lint/analysis_options_package.yaml
```

## Enable/Disable rules

`lint` is customizable, you can add or remove rules, depending on your needs. 
To do so adjust your `analysis_options.yaml`.

```yaml
include: package:lint/analysis_options.yaml

linter:
  rules:
    # ------ Disable individual rules ----- #
    #                 ---                   #
    # Turn off what you don't like.         #
    # ------------------------------------- #

    # Use parameter order as in json response
    always_put_required_named_parameters_first: false
    
    # Util classes are awesome!
    avoid_classes_with_only_static_members: false


    # ------ Enable individual rules ------ #
    #                 ---                   #
    # These rules here are good but too     #
    # opinionated to enable them by default #
    # ------------------------------------- #

    # Make constructors the first thing in every class
    sort_constructors_first: true

    # The new tabs vs. spaces. Choose wisely
    prefer_single_quotes: true
    prefer_double_quotes: true

    # Good packages document everything
    public_member_api_docs: true
    
    # Blindly follow the Flutter code style, which prefers types everywhere
    always_specify_types: true
  
    # Back to the 80s
    lines_longer_than_80_chars: true
```

## Lint badge

You're using lint in your open-source project? 
Add the badge to your `README.md` show that you honor strict lint rules


[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
```md
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
```

## Comparison to package:pedantic

Google publicly shares their internal rules as `package:pedantic` in open-source.
It represents what Google is enforcing internally throughout all Dart code.
For a lint rule to be added to pedantic, Google has to change all code which doesn't follow the style.

This strict practice results in only 27/150+ rules to be enabled.
While some are contradictory to each other and can not enabled together, a big chunk of rules isn't enabled because it requires too much work to update all of Googles existing code.

For developers outside Google, it is the norm to have separate lint rules per project.
One project might enable more rules then others.

`lint` enables a majority of lint rules, leaving out contradictory and very opinionated rules.

 
## License

```
Copyright 2019 Pascal Welsch

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
