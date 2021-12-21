[![Pub](https://img.shields.io/pub/v/lint.svg)](https://pub.dartlang.org/packages/lint) 
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

# Lint for Dart/Flutter

<p align="center">
  <img src="https://user-images.githubusercontent.com/1096485/66209493-bc0ec900-e6b7-11e9-80c6-222e778f0c8d.png">
</p>

`lint` is a hand-picked, open-source, community-driven collection of lint rules for Dart and Flutter projects.
The set of rules follows the [Effective Dart: Style Guide](https://dart.dev/guides/language/effective-dart/style).

This package can be used as a replacement for [`package:lints`](https://pub.dev/packages/lints) or the discontinued [`package:pedantic`](https://github.com/dart-lang/pedantic) for those who prefer stricter rules.

`lint` tries to be strict but not annoying.

## Install

Add `lint` as dependency to your `pubspec.yaml`. Version `^1.0.0` means you're automatically getting the latest version for `lint` when running `pub upgrade`
```yaml
dev_dependencies:
  lint: ^1.0.0
```

Create an `analysis_options.yaml` file in the root of your project with the following content:

```yaml
# This file configures the analyzer to use the lint rule set from `package:lint`

# For apps, use the default set
include: package:lint/analysis_options.yaml

# Packages, that may be distributed (i.e. via pub.dev) should use the package 
# version, resulting in a better pub score.
# include: package:lint/analysis_options_package.yaml

# You might want to exclude auto-generated files from dart analysis
analyzer:
  exclude:
    #- '**.freezed.dart'

# You can customize the lint rules set to your own liking. A list of all rules
# can be found at https://dart-lang.github.io/linter/lints/options/options.html
linter:
  rules:
    # Util classes are awesome!
    # avoid_classes_with_only_static_members: false
    
    # Make constructors the first thing in every class
    # sort_constructors_first: true

    # Choose wisely, but you don't have to
    # prefer_double_quotes: true
    # prefer_single_quotes: true
```

## Lint badge

You're using lint in your open-source project? 
Add the badge to your `README.md` show that you honor strict lint rules


[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
```md
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
```

## Comparison with other lint packages

A detailed comparison of all linting packages for dart can be found at https://rydmike.com/blog_flutter_linting.html

`lint` is among the strictest but not the strictest. It tires to find the right balance between useful and annoying.

## Comparison to discontinued package:pedantic

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
