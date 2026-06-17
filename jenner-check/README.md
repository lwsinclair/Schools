# Jenner compatibility bundles

This directory was added by a pull request from the
[Jenner](https://jenneranalytics.com) project. Each `tNNN_*` subdirectory
is a small, self-contained SAS bundle derived from code in this
repository. Running a bundle sends its SAS to the Jenner API and checks
the result against a snapshot we captured, so you can confirm Jenner
reproduces the behavior of your own programs.

## What's in here

```
jenner-check/
├── README.md            # this file
├── run_jenner.sh        # mac / linux runner
├── run_jenner.bat       # windows runner
├── run_jenner.sas       # base SAS runner (%include)
└── tNNN_…/
    ├── script.sas       # the SAS under test (adapted from your repo)
    ├── autoexec.sas     # options + any setup the bundle needs
    ├── expected.json    # stable fields pinned from a passing run
    ├── expected/        # human-readable snapshot (log, output, file URLs)
    └── meta.json        # which file in your repo this came from
```

## How to run it

From inside `jenner-check/`:

```bash
./run_jenner.sh --all              # run every bundle
./run_jenner.sh t002_macro_minmaxgrades   # run one
./run_jenner.sh --list             # list bundles
```

On Windows use `run_jenner.bat`; from a Base SAS session,
`%include 'run_jenner.sas';`. Each run prints `status`, `exit_code`, and
a log excerpt, and the suite ends with an `N pass, M fail` summary.

## The bundles

- **t002_macro_minmaxgrades** — a caller for your `%minmaxgrades` macro
  (`Macros/MinMaxGrades.sas`), exercising the adult-only / grade-min /
  grade-max logic over a small enrollment file.
- **t003_macro_block10_to_seniorhigh** — a caller for
  `%Block10_to_seniorhigh` (`Macros/Block10_to_seniorhigh.sas`), mapping
  Census block IDs to Senior High Attendance Zones.
- **t004_school_formats_grade** — the `$SchType` format from
  `Prog/School Formats.sas`, applied and tabulated.

## Optional: Jenner Compatible badge

```markdown
[![Jenner Compatible](https://jenneranalytics.com/badges/jenner-compatible.svg)](https://jenneranalytics.com)
```

## Don't want future PRs from us?

Reply with `no-more-prs` anywhere in a comment, or open an issue titled
`jenner-check: opt out`, and we'll stop automated PRs to this repo.
