#!/usr/bin/env bash
# Creates required runtime directories on a fresh clone
set -e

dirs=(
  runs
  workflow_runner_runs
  workflow_runner_exec
  fastq_qc_runs
  fastq_trimmer_runs
  pathway_enrichment_runs
  out
  storage
  object_storage
  objects
)

for d in "${dirs[@]}"; do
  mkdir -p "$d"
  touch "$d/.gitkeep"
done

echo "✓ Runtime directories created."