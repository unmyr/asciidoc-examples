---
name: asciidoc-pages-build
description: "Use when modifying an AsciiDoc-to-HTML build or GitHub Pages workflow, including legacy Asciidoctor actions, Docker build images, Pages artifacts, and build validation."
---

# AsciiDoc Pages Build

Use this skill when maintaining a GitHub Pages workflow that builds AsciiDoc documents with a Makefile. Preserve the project's existing build and deployment behavior unless the requested change requires otherwise.

## Repository Build Contract

- Inspect the workflow, Makefiles, and AsciiDoc configuration to identify the build command, output directory, required tools, and generated assets.
- Do not assume the output directory or required Asciidoctor extensions; confirm them from the repository.
- Preserve existing build arguments, working directories, asset-copy behavior, and deployment configuration unless they must change.
- Check whether the build uses Graphviz, image assets, custom stylesheets, or other tools and extensions.

## Replacing Legacy Asciidoctor Actions

Some third-party Asciidoctor actions may be stale or depend on old container images. For example, `tonynv/asciidoctor-action@v2` was released in June 2020. Before relying on an action, check its release history, source, and maintenance activity.

When replacing a legacy build action:

1. Identify the exact command it runs and any environment or filesystem assumptions.
2. Prefer invoking a maintained Asciidoctor container directly when it can provide the required toolchain.
3. Verify that the selected image includes all required tools and extensions; do not assume different image releases have identical contents.
4. Pin the selected image by a verified OCI digest. Never reuse a digest from another image release or invent/truncate a digest.
5. Run the existing Makefile command in the container, preserving the repository's expected working directory and output paths.

Example for a repository whose build is `make -C docs adoc`:

```yaml
- name: Build HTML with Asciidoctor
  run: |
    docker run --rm \
      --user "$(id -u):$(id -g)" \
      --volume "$GITHUB_WORKSPACE:/documents" \
      --workdir /documents \
      asciidoctor/docker-asciidoctor@sha256:<verified-digest> \
      make -C docs adoc