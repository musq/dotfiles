# Contributing Guidelines

<br>


## Contributors

### 1. Commits

Use [`git-commit-template`](src/config/git/commit-template) for commit messages guidelines. [More information](https://gist.github.com/adeekshith/cd4c95a064977cdc6c50) on this.

Read about [Conventional Commits](https://www.conventionalcommits.org).

#### Always

- Provide proper comments

#### Maybe

- Try not to keep more than 72 chars per line

#### Never

- Commit any sensitive information
- Commit trailing whitespaces
- Keep an empty line at the end of any file

### 2. Creating Pull Requests

- Rebase your `fix` branch on top of the `target` branch before
creating a PR
- Update [README.md](README.md) to reflect breaking changes

<br>


## Maintainers

### 1. Merging Pull Requests

- Do not use GitHub's `Merge Changes` button to merge PRs. It creates
unnecessary merge commits
- Fetch the `fix` branch locally using GitHub's `pull` refspec
- Rebase the `fix` branch on the `target` branch
- Merge `fix` branch in `target` branch

Source: https://git-scm.com/book/en/v2/GitHub-Maintaining-a-Project#_pr_refs

### 2. Releases

Strictly follow [Semantic Versioning](https://semver.org/).

#### Use [semantic-release](https://github.com/semantic-release/semantic-release):

| Action | Snippet |
|:---|:---|
| Install | `npm install -g semantic-release@15` |
| [Access Token](https://github.com/settings/tokens/new) | `export GITHUB_TOKEN=XXXXXXXXXXXXXX` |
| Dry run | `semantic-release -d` |
| Release | `semantic-release` |

<br>


## Code of Conduct

The Code of Conduct is adapted from the
[Contributor Covenant](https://contributor-covenant.org), version
[1.4](https://contributor-covenant.org/version/1/4/).
