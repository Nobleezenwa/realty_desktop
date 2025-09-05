#!/bin/bash
# pubpu.sh
# You need to have a remote repo added named 'public' before running this script
# Temporarily append .gitignore.public to .gitignore, commit, push an orphan branch with no history to public main, then clean up

# Edit this
PRIVATE_BRANCH=realty_desktop

set -e  # exit on first error

# Ensure .gitignore.public exists
if [[ ! -f .gitignore.public ]]; then
    echo "Error: .gitignore.public not found."
    exit 1
fi

# Backup current .gitignore
if [[ -f .gitignore ]]; then
    cp .gitignore .gitignore.private.bak
else
    echo "Warning: No existing .gitignore found, creating backup as empty file."
    touch .gitignore.private.bak
fi

# Stage and commit changes on current branch
echo "Staging and committing changes on current branch..."
git add -A
COMMIT_MSG="${1:-Public commit}"
git commit -m "$COMMIT_MSG" || echo "ℹ️ No changes to commit."

# Define a cleanup function to always restore
cleanup() {
    echo "♻ Restoring original .gitignore..."
    mv .gitignore.private.bak .gitignore 2>/dev/null || true
}
trap cleanup EXIT  # Run cleanup on script exit, success or fail

# Append public ignore rules to existing .gitignore
cat .gitignore.public >> .gitignore
echo "📄 Added public .gitignore rules to existing rules..."

#
echo "Setting up temporary branch without history for public..."

# Create a new orphan branch with no history
git checkout --orphan public-stage

# Reset history
git reset

# Now add all files from working directory (including your new .gitignore)
git add -A

# Commit the files freshly
git commit -m "$COMMIT_MSG"

# Force push orphan branch to public remote main branch
echo "🚀 Pushing orphan branch to public main..."
git push public public-stage:main -f

# Switch back to original branch
git checkout "$PRIVATE_BRANCH"

# Delete the orphan branch locally
git branch -D public-stage
echo "Cleaned up temporary branch for public..."

echo "🎉 Public commit and push completed."

