#!/bin/bash
# sync the local copy with latest changes from the upstream git repository.

usage() { echo "Usage: $0 [-p <string>] [-r <string>]" 1>&2; exit 1; }

while getopts ":p:r:" o; do
    case "${o}" in
        p)
            p=${OPTARG}
            #((s == 45 || s == 90)) || usage
            ;;
        r)
            r=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${p}" ] || [ -z "${r}" ]; then
    usage
fi

echo "patch= ${p}"
echo "repo = ${r}"

# TODO : Check here for return code of "git am" for failure.
#
# If <filename.patch> already applied, then :
# - This is probably a cookbook re-run,
#   or
# - The latest upstream source now comes with the patch applied.
# Display/Log an info message about this and skip to the end of the script.

# Patch latest upstream source with a local patch
echo "Attempting to apply ${p} to ${r}..."
# cd <local-clone-dir>
# git am <filename.patch>

# TODO : Check here for return code of "git am" for failure.
#
# In case <filename.patch> no longer applies
# to the latest version of the source from upstream repo,
# display/log the error and abort immediately.

echo "Successfully applied ${p} to ${r}."

# Continue with rest of the tasks.
