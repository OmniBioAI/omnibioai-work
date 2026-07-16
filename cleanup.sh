#!/usr/bin/env bash
# Clears all runtime artifacts while preserving directory structure
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

echo "WARNING: This will delete all runtime artifacts. Press Ctrl+C to cancel."
read -t 10 -p "Continuing in 10 seconds..." || true
echo ""

for d in "${dirs[@]}"; do
  if [ -d "$d" ]; then
    find "$d" -mindepth 1 ! -name '.gitkeep' -delete
    echo "✓ Cleared $d/"
  fi
done

echo "✓ Cleanup complete. Directory structure preserved."