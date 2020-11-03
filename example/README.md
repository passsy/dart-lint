Add `lint` as dependency to your pubspec.yaml

```yaml
dev_dependencies:
  lint: ^1.3.0
```

Add a `analysis_options.yaml` to the root of you project.

```yaml
include: package:lint/analysis_options.yaml

# Not happy with the default? Customize the rules depending on your needs. 
# Here are some examples:
linter:
  rules:
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

    # Use parameter order as in json response
    always_put_required_named_parameters_first: false

    # Util classes are awesome!
    avoid_classes_with_only_static_members: false
```

Hit save and see the `dartanalyzer` executing the lint checks in you favorite editor.