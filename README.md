# Lint for Dart/Flutter


[![Pub](https://img.shields.io/pub/v/lint.svg)](https://pub.dartlang.org/packages/lint)

`lint` is a hand-picked, open-source, community-driven collection of lint rules for Dart and Flutter projects.
The set of rules follows the [Effective Dart: Style Guide](https://dart.dev/guides/language/effective-dart/style).

This package can be used as a replacement for [`package:pedantic`](https://github.com/dart-lang/pedantic) for those who prefer stricter rules.

## Install

Add `lint` as dependency to your `pubspec.yaml`
```yaml
dev_dependencies:
  lint: 0.3.0+dart203
```

Create a `analysis_options.yaml` file in the root of your project and import the `lint` rules:

```yaml
include: package:lint/analysis_options.yaml
```

If you're writing a package with a public API you should use the `package` version instead
```yaml
include: package:lint/analysis_options_package.yaml
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