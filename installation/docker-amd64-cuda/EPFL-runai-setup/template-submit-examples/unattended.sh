runai submit \
  --name example-unattended \
  --image registry.rcp.epfl.ch/claire/moalla/deep-alignment:amd64-cuda-moalla-latest \
  --pvc runai-claire-moalla-scratch:/claire-rcp-scratch \
  --working-dir /claire-rcp-scratch/home/moalla/deep-alignment/run \
  -e PROJECT_ROOT_AT=/claire-rcp-scratch/home/moalla/deep-alignment/run \
  -g 1 --cpu 8 --cpu-limit 8 --memory 64G --memory-limit 64G \
  -- python -m deep_alignment.template_experiment some_arg=2 wandb.mode=offline

# template_experiment is an actual script that you can run.
# or -- zsh deep_alignment/reproducibility-scripts/template-experiment.sh

# To separate the dev state of the project from frozen checkouts to be used in unattended jobs you can observe that
# we're pointing to the .../run instance of the repository on the PVC.
# That would be a copy of the deep-alignment repo frozen in a commit at a working state to be used in unattended jobs.
# Otherwise while developing we would change the code that would be picked by newly scheduled jobs.

# Useful commands.
# runai describe job example-unattended
# runai logs example-unattended
