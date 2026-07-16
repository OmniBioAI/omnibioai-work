# omnibioai-work

Runtime working directory for the OmniBioAI platform. This directory stores all artifacts, outputs, and intermediate files generated during workflow execution, tool runs, and analysis pipelines.

All contents are runtime-generated and excluded from version control via `.gitignore`. The directory structure is preserved via `.gitkeep` files.

## Directory Structure

```
omnibioai-work/
├── runs/                     # General tool and analysis runs (not tracked)
├── workflow_runner_runs/      # Workflow execution run outputs (not tracked)
├── workflow_runner_exec/      # Workflow execution working directories (not tracked)
├── fastq_qc_runs/            # FASTQ QC pipeline outputs (not tracked)
├── fastq_trimmer_runs/       # FASTQ trimmer pipeline outputs (not tracked)
├── pathway_enrichment_runs/  # Pathway enrichment analysis outputs (not tracked)
├── out/                      # General output directory (not tracked)
├── storage/                  # Persistent storage (not tracked)
├── object_storage/           # Object storage (not tracked)
├── objects/                  # Runtime objects (not tracked)
└── object_registry.json      # Object registry index
```

## Setup

This directory is referenced in the OmniBioAI docker-compose stack via the `WORK_DIR` environment variable:

```env
WORK_DIR=/home/manish/Desktop/machine/omnibioai-work
```

It is mounted into multiple services:

```yaml
volumes:
  - ${WORK_DIR}/runs:/app/work/runs
  - ${WORK_DIR}/objects:/app/work/objects
  - ${WORK_DIR}/workflow_runner_exec:/app/work/workflow_runner_exec
  - ${WORK_DIR}/workflow_runner_runs:/app/work/workflow_runner_runs
  - ${WORK_DIR}/pathway_enrichment_runs:/app/work/pathway_enrichment_runs
```

On first run after cloning, execute the setup script to recreate all required directories:

```bash
bash setup.sh
```

## Cleaning Up

To clear all runtime artifacts and start fresh:

```bash
bash cleanup.sh
```

> **Warning:** This will permanently delete all run outputs, workflow results, and stored objects.

## Related Repositories

- [`omnibioai`](../omnibioai) — main Django workbench application
- [`omnibioai-tes`](../omnibioai-tes) — task execution service that writes to `runs/`
- [`omnibioai-workflow-bundles`](../omnibioai-workflow-bundles) — workflows that write to `workflow_runner_runs/`
- [`omnibioai-data`](../omnibioai-data) — input data directory