# kubeready
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg) ![Shell](https://img.shields.io/badge/Made%20with-Bash-orange.svg) ![CI](https://img.shields.io/badge/CI-GitHub%20Actions-blueviolet) ![Unit Tests](https://img.shields.io/badge/Unit%20Tests-GitHub%20Actions-blueviolet) ![CI Status](https://github.com/ramadasmr/kubeready/actions/workflows/ci.yaml/badge.svg?branch=main) ![GitHub Stars](https://img.shields.io/github/stars/ramadasmr/kubeready?style=social)


**kubeready** is a lightweight Bash utility that simplifies and extends `kubectl` commands by enabling flexible status checking of Kubernetes resources. It wraps multiple common kubectl commands along with parsing done in bash into a single intuitive CLI, focused on quickly showing resource readiness and issues.

Whether you're a developer, SRE, or DevOps engineer, `kubeready` makes it easier to view health and status of Kubernetes objects — nodes, pods, deployments, statefulsets, and daemonsets — with automatic filtering of common problem states.

## Why?

`kubectl` requires complex flag combinations and manual filtering to monitor resource health effectively. `kubeready` consolidates these operations into a simple CLI to speed up checking cluster health and comes in handy for CI/CD workflows.

---

#### ✨ Features

- 🔍 Check readiness and health of Kubernetes objects: nodes, pods, deployments, statefulsets, daemonsets
- 🚦 Detect common issue states automatically (e.g. Pending, CrashLoopBackOff, NotReady)
- 🎯 Supports filtering by namespace and specific resource names
- ⏳ Continuous monitoring with live status updates until resources are ready or errors found
- ⚙️ Dry-run mode to preview commands without execution
- 📖 Simple, minimal, and intuitive CLI with helpful usage instructions
- 🐚 Pure Bash script with zero dependencies beyond kubectl

---

#### 📥 Installation

##### Install via `curl`

```bash
curl -sSL https://raw.githubusercontent.com/ramadasmr/kubeready/main/install.sh | bash
```

This installs the `kubeready` command to `/usr/local/bin`. Make sure it’s in your `$PATH`.

##### Manual Steps

```bash
curl -L -o /usr/local/bin/kubeready https://raw.githubusercontent.com/ramadasmr/kubeready/refs/heads/main/kubeready
chmod a+x /usr/local/bin/kubeready

```

##### Verify installation

```bash
kubeready --help
```


#### 🚀 Usage

```bash
kubeready [object] <options>
```

##### Supported Objects

- `pods` – Kubernetes Pods
- `nodes` – Cluster Nodes
- `deployment` – Kubernetes Deployments
- `statefulset` – Kubernetes StatefulSets
- `daemonset` – Kubernetes DaemonSets

##### Command Options

| Option                         | Description                                                      |
|-------------------------------|------------------------------------------------------------------|
| `node`, `nodes`               | Check status at the node level                                   |
| `pod`, `pods`                 | Check status at the pod level                                    |
| `dep`, `deploy`, `deployment` | Check status at the deployment level                            |
| `sts`, `statefulset`          | Check status at the statefulset level                            |
| `ds`, `daemonset`             | Check status at the daemonset level                              |
| `-n`, `-ns`, `--namespace <namespace>` | Specify the namespace to use (not applicable to nodes)   |
| `--dry`                      | Dry run mode: show commands without executing                    |
| `-h`, `--help`               | Show help message                                                |

> **Note:** Namespace filtering applies only to pods, deployments, statefulsets, and daemonsets — not nodes.

#### ✅ Examples

```bash
./kubeready pods
./kubeready pods nginx
./kubeready nodes
./kubeready deployment myapp -n production
./kubeready daemonset -n kube-system --dry
./kubeready --help
```

#### 📄 License
MIT License – feel free to use, share, and contribute.

#### 🤝 Contributions
PRs and issues are welcome — especially to enhance resource support, flags, or CLI options.

##### To Contribute

1. Fork the repository
2. Create a new branch: `git checkout -b feature/my-feature`
3. Commit your changes
4. Push to your fork: `git push origin feature/my-feature`
5. Open a pull request

##### How to run tests

This project uses [BATS](https://github.com/bats-core/bats-core) for testing.
To run the tests, use the `bats` binary included in the repository:

```bash
./tests/bats/bin/bats tests
```

##### Ideas to Improve
- Add support for additional resource types
- Add unit tests or linting
