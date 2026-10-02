param(
    [Parameter(Mandatory = $true)]
    [string]$OutputDir
)
$SourceDir = $PWD.Path

wslc run --rm `
--user "1000:1000" `
--volume "${SourceDir}:/documents" `
--volume "${OutputDir}:/output" `
--workdir /documents asciidoctor/docker-asciidoctor@sha256:23c022800c00bd7b73fe4e3deca49c77500f0fb34035b131cfed3f835e8d9de9 `
make -C docs adoc CP_OPTS=-n DIST_DIR=/output
