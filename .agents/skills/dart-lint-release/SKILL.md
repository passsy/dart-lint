---
name: dart-lint-release
description: Prepare complete releases of passsy/dart-lint, assess every new rule in substantial apps, provide combined project trials, and complete authorized publishing, tagging, and GitHub releases. Use when adding SDK lint support or preparing or delivering a release of package lint.
---

# Prepare a dart-lint release

Work in the `passsy/dart-lint` repository (`name: lint` in `pubspec.yaml`).
The default outcome is a reviewable local patch. Creating commits, pushing, tagging,
publishing to pub.dev, or creating a GitHub release requires authorization for that
action; a request to prepare a release does not grant it.

Complete the full release inventory, every rule's assessment, integration, and
metadata preparation in one continuous task. Do not stop after an individual rule
or require permission to continue to the next. Deliver one combined review per
project so the author can open the project once and inspect all new rules together.

## Establish the release range

- Read the working tree status, `pubspec.yaml`, `CHANGELOG.md`, the README compatibility
  table, and the YAML files under `lib/`. Preserve unrelated local changes.
- Identify the target Dart SDK, the previously supported SDK, and the intended
  **package** version. Dart and package versions are separate. If the target SDK is
  missing, ask for it. A missing package version need not block rule research;
  propose one from local release conventions before finalizing metadata.
- Read all public configurations: `lib/casual.yaml`, `lib/strict.yaml`,
  `lib/package.yaml`, and the legacy `analysis_options*.yaml` wrappers. Follow their
  include chain. Package mode inherits strict rules; do not duplicate inherited
  additions there. Account for its own overrides when a rule changes or disappears.

## Next release: Dart 3.13

Start from the Dart 3.12 work on `dart3.12`, prepared as lint 2.13.0.
Verify that work has merged and the package was published before treating it as the baseline because a release branch does not prove publication.
For Dart 3.13 use `dart3.13`; 2.14.0 is the expected package version only if 2.13.0 is the published preceding version and 2.14.0 is unused.
Discover the 3.13 rule inventory afresh against the 3.12 SDK baseline.

For Dart 3.13, revisit `var_with_no_type_annotation` against its upstream state before changing or removing it.
The prepared Dart 3.12 configuration enables it in strict, casual and inherited package mode as a semantics-preserving migration guard.
Dart 3.13 keeps the rule registered but it becomes a no-op for libraries using the 3.13 language version.

After each release, refresh this section for the next SDK and remove completed release-specific instructions.
Retain future revisit or enablement gates, but do not accumulate stable policy, past inventories or private trial history.

## Follow the repository's release history

Inspect recent SDK branches, their commits and release tags before planning delivery:
`git branch -a`, `git log --reverse --stat <previous-base>..<sdk-branch>`, and
`git show <version-bump-or-rule-commit>`. Confirm conventions from actual history;
do not assume a generic release PR workflow.

- Work on `dart{major.minor}` (for example `dart3.10`). Check local and remote refs
  before creating it; preserve existing branch work and uncommitted edits. Base the
  release on the current default branch, including merged prerequisite cleanups.
- Structure the release as `1 + N` commits: one metadata commit plus exactly one commit for each of the `N` added or changed rules.
  This is not a fixed three-commit layout; the number of commits follows the number of rule changes.
- Prepare a metadata commit first, named like `Bump for Dart 3.10 version`: package version, SDK constraint, README compatibility row, and changelog release heading.
  Include the release-guidance refresh in this metadata commit instead of creating a separate bookkeeping commit.
  Assessment and validation can finish before arranging this commit sequence.
- Follow with exactly one commit per added or changed rule, named like `Enable unnecessary_ignore for strict mode` or `Add use_null_aware_elements (disabled)`.
  Keep a rule's strict, casual and package decisions together, along with every changelog, documentation, test, and configuration change belonging to that rule.
  Include its changelog entry in that commit when it changes enabled behavior; newly added disabled entries historically have no changelog bullet.
  This makes each rule independently cherry-pickable.
  Do not split one rule across commits, group multiple rules into one commit, or squash the whole SDK update into one release commit.
- Match the existing changelog: short Enable/Disable/Remove bullets with rule links
  and a brief mode qualifier. Keep substantial rationale, issue links and future
  enablement TODOs in the YAML comments. Preserve the existing release heading and
  SDK requirement format. Describe changes relative to the previous published
  package version: use "Disable" only when that mode previously shipped the rule
  enabled. A false override for a newly introduced rule is not a user-visible
  disabling; describe only the modes where the new rule becomes enabled.
- Keep unrelated sorting and syntax cleanups separate from the release. If they
  have already merged, incorporate them as the base rather than repeating them in
  release commits.
- Preserve the individual release commits when integrating the branch. Historical
  tags such as `v2.8.0` point at the final SDK-branch commit, not the later merge
  commit. Follow the publish → tag → GitHub Release sequence below. A release PR is
  optional unless requested or required by current repository policy.

This describes the prepared history, not additional authorization: create commits,
push, open PRs, merge, tag or publish only within the user's current delivery grant.
When commits are not authorized, leave the patch uncommitted and report the intended
commit split instead of using that boundary to postpone preparation.

## Discover the actual SDK changes

Start with the [upstream linter changelog](https://github.com/dart-lang/sdk/blob/main/pkg/linter/CHANGELOG.md),
but never treat its newest entries or an unreleased section as the target release.
Cover every SDK release after the previous baseline through the target, including
patches when relevant.

Verify candidates against the **target SDK tag or commit**, for example
`https://github.com/dart-lang/sdk/blob/<sdk-version>/pkg/linter/CHANGELOG.md`
and its `pkg/linter/lib/src/rules.dart` registry and rule implementations.
For older SDKs, follow that SDK's pinned linter dependency if it predates the merge
into the SDK repository. A changelog's linter version is not automatically a Dart
SDK version. If the changelog is ahead of the tag, target source registration wins.

Read each rule's documentation at `https://dart.dev/tools/linter-rules/<rule_name>`.
Use it to understand the diagnostic, examples, conflicts, and release information.
Current documentation can describe behavior or stability newer than the target;
use target source/history to settle historical differences. Do not invent SDK
minimums or mark a rule experimental from an old example. If availability cannot
be verified, leave that candidate pending and explain the missing evidence.

Build a concise inventory before editing: rule name, source/SDK availability,
new/removed/deprecated/changed status, proposed strict and casual settings, and why.
Show the complete inventory in an early progress update, including rules not yet
assessed; do not present only the first rule as though it were the release's scope.
Separate additions from changes to existing rules. Do not reinterpret every
upstream bug fix as a reason to change this package's policy.

## Assess whether each rule earns inclusion

This package is a curated set: **new rules are not enabled by default, even in
strict**. A rule must improve code enough to justify its noise, complexity, and
maintenance cost. A diagnostic can be technically correct and still encourage a
change the author would not want. Merely restating the rule's advertised purpose,
matching an earlier release, or proving that a synthetic example triggers it does
not establish value.

For each candidate, before choosing its setting:

1. Read existing reasoning in the YAML files, especially related enabled and
   disabled rules. Identify the concrete benefit, overlapping checks, conflicts,
   and plausible examples where complying makes code worse or merely more verbose.
2. Search upstream issues and linked fixes for the rule name, false positives,
   regressions, limitations, and unwanted suggestions. Check open and closed
   issues in `dart-lang/sdk` and, where relevant, `dart-lang/linter`. Record relevant
   links and whether fixes are present in the target SDK; a closed issue may only
   be fixed in a later version. Report search scope and access gaps. Finding no
   reports does not establish that there are no false positives.
   Read the full issue discussion and resolution: an intentional limitation or
   unsupported transformation is not automatically an unresolved false-positive bug.
   Keep a separate local reproduction distinct from what the linked issue reports.
   For a confirmed blocker fixed later, identify the first stable SDK containing
   the fix from tagged source and, when needed, an executable regression probe.
   Document the minimum-SDK enablement or revisit point in the rule comment; honor
   the author's selected enablement plan without adding unrelated gates.
3. **Test every new rule in at least one recent, fairly large active Dart/Flutter
   project**, including rules proposed for disabling. Use multiple projects when
   one does not cover the relevant patterns or platforms. Select projects and
   prepare isolated project trials as described below. Run a baseline
   and then enable all new rules together using the same SDK. Attribute findings
   by diagnostic code and assess every rule. Temporarily isolate a rule if needed
   to understand an interaction, then restore the combined configuration. Record the project
   revision, SDK, relevant coverage, exact command, and diagnostic delta. Adapt
   the trial's SDK when needed as described below; an SDK mismatch alone
   is not a reason to discard a representative app. Keep newer-SDK practical
   evidence separate from verification of the target SDK's behavior.
4. Inspect the resulting violations and representative before/after fixes. Decide
   whether each pattern catches a real defect, improves maintainability, merely
   adds work, produces a false positive, or remains uncertain. Report counts and
   the scope of any sampling, including repetitive low-value suggestions. A clean
   analyzer result after fixes is not evidence that the code is better. No hits
   may mean the project lacks relevant code, not that the rule is good or useless.
5. Cross-check relevant reported false-positive patterns against the trial project.
   Reproduce a plausible problem with the target SDK when necessary, distinguishing
   a synthetic reproduction from an occurrence found in real code. If a claimed
   benefit concerns generated output or runtime behavior, inspect or test that
   outcome when needed to judge the benefit; diagnostic activation alone is weaker
   evidence.

Present a short assessment for **each rule**: concrete benefit, real examples and
proposed changes, unwanted suggestions/false positives, upstream evidence, trial
coverage or gaps, and the strict/casual recommendation with its tradeoff. Show enough
before/after code for the author to judge whether they prefer the result. Include every
rule's assessment in the combined release handoff; evaluating rules together does
not reduce the depth required for any rule.

Project trials are mandatory; upstream research and synthetic probes supplement
them. If no suitable project can be analyzed, keep that assessment incomplete and
continue unaffected research. Do not silently waive the trial or declare the release
ready. If a completed trial finds no relevant violations, record that result and
look for relevant coverage in another recent project. Never manufacture a project
occurrence: distinguish real code findings from synthetic examples and state any
remaining coverage gap. Resolve pending decisions before finalizing a release.

## Select projects for combined trials

Choose projects afresh for each release, using recent project context supplied by
the author. Verify recent activity, revision, SDK constraints, approximate
first-party Dart code size, and patterns relevant to the rules. **Prefer substantial
apps that are actually used for general strict/casual rules.** Use packages for
package/public-API rules or as supplementary evidence. Explain exceptions based on
the rule; an easier SDK setup, generated-code tree or tiny sample app does not
establish representative coverage. Ask the author to select a project only when
available evidence does not yield a suitable one; continue other research meanwhile.

Keep trial changes isolated from active development and unrelated edits. Record
the base revision and combine all new rules and representative changes in one
reviewable trial per project. Preserve the author's work and keep trial changes
uncommitted. Reuse the current release's trial when safe instead of splitting the
review by rule.

**Temporarily changing Flutter/Dart in an isolated trial is allowed and expected
when needed.** Inspect the project's SDK manager and version pins, select or
install an isolated SDK, and update trial-local pins, SDK constraints, or
required dependency/lockfile settings as necessary to run a meaningful trial.
Keep the active checkout and global/default SDK selection unchanged. First make
the baseline analyze under the selected SDK, then enable the new rules with
that same setup. Record setup changes separately from the lint's diagnostic delta
and proposed code changes so the SDK migration does not obscure the rule's value.
Do not assume that merely lowering a constraint makes newer code compatible.

Check the package's effective language version as well as the analyzer executable.
Feature-gated rules can silently produce zero diagnostics when the pubspec SDK lower
bound is too old, even on a new SDK. For example, `use_null_aware_elements` requires
language version 3.8. If needed, raise only the trial's language floor and rerun pub
get, then establish the baseline again. Attribute diagnostics exposed by the new
language version to setup rather than to the candidate rules.

Prefer the target SDK for the trial when practical. If a current app needs a newer
SDK, still use it for practical-value evidence and explicitly identify the version;
verify target-SDK availability and behavior separately using target source and
compatible probes or a relevant compatible app snapshot. Such a newer-SDK trial
does not establish the target SDK's false-positive behavior. Investigate relevant
implementation differences before transferring conclusions, and retain a stated
validation gap if those differences cannot be resolved. Report a project as blocked
only after investigating the actual setup or migration problem, not from its
current SDK constraint alone. Avoid unrelated app refactors to force compatibility.

Leave **all new rules enabled together** in that trial's effective analysis
options, including rules recommended for disabling in the released rule set.
Resolve dependencies and verify that each configured rule actually runs. If rules
conflict and cannot run together, document the conflict and provide reproducible
alternate configurations in the same project trial. Keep configuration
and representative proposed code fixes uncommitted so the author can inspect the diff
in their editor. Apply only fixes needed to illustrate the assessment, including
examples of unwanted changes where useful; mark those as undesirable rather than
presenting them as recommendations. Preserve pre-fix diagnostics and a diff or
before/after excerpt so fixing an example does not erase the evidence. Include an
unfixed real example when available, and verify all delivered file/line links
against the final trial state. Retain the combined trial evidence for the author's review. Run the combined
configuration again after representative fixes to check interactions and record
the final review state, preserving the original per-rule diagnostic evidence.

For removed rules, trial the configuration removal or migration in a suitable real
project and link the affected configuration/code. Use a compatible earlier SDK if
examining the old rule's behavior; do not claim a removed rule can run in the target
SDK. Report when there is no affected source code to link.

Project identities, source excerpts, diagnostics and trial reports are private
review material. Keep them outside tracked package/release content. Do not upload
trial code or evidence to issues, PRs, gists or other external services. Release
notes and rule comments may contain general reasoning and public upstream links,
but not private project examples or local references.

## Choose each rule's setting

- **Strict:** enable when the assessment supports meaningful value that outweighs
  false positives, unwanted changes, and maintenance burden. Readability and
  consistency can provide value, but enforcement alone is not a justification.
  Disable rules with little benefit or excessive friction, even if technically
  correct and stable. Experimental status calls for evaluation, not an automatic
  decision in either direction.
- **Casual:** enable only when it prevents a concrete defect; describe that defect.
  Naming, formatting, uniformity, verbosity, and documentation requirements alone
  are insufficient. Otherwise include the rule as a commented-out entry.
- Add every new rule to **both** strict and casual, enabled or explicitly disabled.
  Keep an existing disabled choice unless changing that choice is part of the task.
- For a full SDK update, separately handle configured rules removed by that SDK,
  replacements, and evidenced incompatibilities. Check package mode and analyzer
  severity overrides too. Deprecation alone does not mean a rule was removed.
  Account for each removal or setting change separately in the assessment, while
  delivering the complete release patch together.

## Integrate the complete release

Assess and integrate every new rule, removal, and justified setting change in the
release. Keep reasoning and validation attributable to each rule, but continue
without per-rule checkpoints or requests for batching permission. Existing
uncommitted changes from this task are expected and do not require a stop before
adding the next rule. Preserve unrelated edits and do not commit automatically.

All new rules are enabled in the **trial projects** so the author can review their
combined impact. The **release's strict/casual configurations** retain the curated
settings justified by the assessments. Clearly report differences between the
trial configuration and the proposed shipped configuration.

Treat documentation and its rule entry as one block:

- Sort by the actual rule name, including commented-out rules in the same sequence.
  Do not form separate enabled and disabled sections.
- Insert between the correct alphabetical neighbors, never at the end unless that
  is the natural position. Keep each rule's comments directly above its entry.
- Use `#` comment lines inside a block and exactly one empty line between blocks.
- Explain the rule's purpose and, when disabled, the reason. Include the verified
  minimum SDK and canonical documentation link, following surrounding indentation.
- Preserve existing blocks byte-for-byte when adding a rule. Do not normalize old
  links, reword comments, toggle rules, or re-sort the file as incidental cleanup.
  Report pre-existing sorting problems separately; ensure the addition introduces
  no new ones.

Example of a disabled new block (replace placeholders with verified facts):

```yaml
    # Purpose of this rule. Disabled because of the specific policy or conflict.
    #
    # Dart SDK: >= X.Y.Z
    #
    # https://dart.dev/tools/linter-rules/rule_name
    # - rule_name
```

## Finalize after the rule queue is complete

After the complete inventory is assessed and integrated, finalize metadata in the
same task without waiting for another continuation. If a genuine blocker prevents
one assessment, complete unaffected work and report the incomplete part explicitly;
do not present the release as fully prepared while rules remain unassessed.

- Update `pubspec.yaml` with the intended unused package version and an SDK lower
  bound that supports every enabled rule. Preserve unrelated constraints.
- Add the README's Dart/package compatibility row and update directly affected
  instructions. Preserve older compatibility rows and valid broad version ranges.
- Write the changelog from the **actual behavior changes**, following the historical
  format above: SDK requirement, enabled/disabled/removed rules, mode-specific
  choices, and migration notes where needed. Document newly added disabled entries
  in their YAML blocks and local assessment rather than adding release-note bullets.
  Do not promise changes that are merely queued or overwrite a published entry.

## Validate and hand off

For every Markdown file changed during a release, keep one sentence per line and never hard-wrap prose at a fixed column such as 80 characters.
After every Markdown edit, run the system-installed `markdownlint-cli2 --config ~/.markdownlint-cli2.jsonc <changed-markdown-files>` from the repository and fix every reported issue before continuing.
Always pass the shared config explicitly; do not rely on config auto-discovery from the project directory.

For each rule, inspect the diff for scope, duplicate entries, enabled/disabled
state, alphabetical neighbors, attached comments, and block spacing. Count disabled
entries too. Compare unchanged blocks against the pre-edit state rather than
rewriting pre-existing formatting defects. Run `git diff --check` where available.

Keep the practical value assessment separate from configuration validation. Both
matter; passing the latter does not establish that a rule should be enabled.

Before calling a release ready, check YAML parsing and include resolution for all
public configurations. Use a disposable consumer package with a path dependency on
this checkout and analyze it separately with casual, strict, package, and legacy
entrypoints. Check configuration diagnostics (unknown/removed/incompatible rules)
as well as syntax. Run this with the **declared minimum Dart SDK**, recording
`dart --version`; a newer analyzer accepting the rules does not prove the minimum.
Use existing test/validation commands if the repository supplies them.

Run `dart pub publish --dry-run` on the final release files and inspect its archive
listing. If commits are authorized, rerun after committing so an uncommitted-files
warning does not obscure the final result. A dry run does not publish. After any
follow-up commit, refresh the release SHA in the handoff and tagging instructions;
do not keep recommending an earlier release candidate's commit.

If the minimum SDK or dependencies are unavailable, complete the local preparation
and report the exact validation gap; do not label the release fully verified.
Avoid adding permanent dependencies or fixtures just to perform these checks.
Summarize changed settings, versions, evidence, checks, and any remaining decisions.
Respect existing authorization; stop before any unauthorized publication action.

## Publish, tag, and create the GitHub Release

Release delivery is not finished at pub.dev publication: create and push the version
tag **after publishing**, then create the GitHub Release. Perform only the steps
authorized by the current request; preparing or merging a PR is not permission to
publish. If the author already completed a step, verify it and continue without
repeating it.

1. Record the exact validated release commit and package version. When authorized,
   publish that candidate to pub.dev. Verify the version is actually available and
   its metadata and public configurations match the candidate. A successful dry run
   or a merged PR is not publication evidence.
2. After publication, create an annotated `v<package-version>` tag at that exact
   candidate commit and push that tag when authorized. Check local and remote tags
   first. Reuse an existing matching tag, especially one created by the author;
   never recreate, move, or force-push a published tag. Stop on a mismatch and report
   it. Verify the remote tag's dereferenced commit, not just its name.
3. Create the GitHub Release using the existing remote tag. Check for an existing
   release first to avoid duplicates. With GitHub CLI, use `gh release create
   v<package-version> --verify-tag --notes-file <notes-file>` so a missing tag cannot
   be silently created at the default branch. Use only that version's changelog
   section as release notes, including its minimum SDK requirement; keep private
   trial evidence out. Match the repository's release naming conventions. Mark the
   newest stable release as latest; use `--latest=false` when backfilling older
   versions. Do not create a draft or prerelease for a published stable package.
4. Verify the published GitHub Release URL, tag, notes, draft/prerelease state and
   latest designation. Report pub.dev publication, remote tag, and GitHub Release
   status separately, including any step still awaiting authorization.

## Combined review handoff

Provide one release-preparation response covering the entire inventory:

- Each rule's strict/casual/package settings, concrete reasoning, known false
  positives, unwanted suggestions and uncertainty. Distinguish observed project
  occurrences from upstream reports not reproduced locally.
- One combined assessment per project, recording the base revision, SDK, exact
  analysis command, baseline and final diagnostic counts, and representative
  before/after examples for all new rules.
- Zero-hit results and other coverage gaps, with the relevant configuration and
  diagnostic evidence. Keep the private project evidence out of public release
  documentation and external messages.
- The release version, validation results, intended commit sequence or created
  commits, and any remaining decisions. Distinguish the prepared recommendation
  from the author's own review; do not claim the author prefers the resulting code
  before they have reviewed it.
