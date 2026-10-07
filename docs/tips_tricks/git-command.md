---
title: 'Git Commands'
lastUpdated: '2025-01-15'
---

# 🔧 Git Commands & Tips

## Overview
This section contains useful Git commands and tips for version control, branching, merging, and common workflows.

---

## 📋 Basic Commands

### Repository Setup
```bash
# Initialize a new repository
git init

# Clone a repository
git clone <repository-url>

# Check repository status
git status

# View commit history
git log
git log --oneline
git log --graph --oneline --all
```

### Staging and Committing
```bash
# Stage all changes
git add .

# Stage specific file
git add <filename>

# Stage specific directory
git add <directory>/

# Commit changes
git commit -m "Your commit message"

# Stage and commit in one step
git commit -am "Your commit message"

# Amend last commit
git commit --amend -m "Updated commit message"
```

---

## 🌿 Branching

### Branch Operations
```bash
# List all branches
git branch
git branch -a  # Include remote branches

# Create new branch
git branch <branch-name>

# Switch to branch
git checkout <branch-name>
git switch <branch-name>  # Newer syntax

# Create and switch to branch
git checkout -b <branch-name>
git switch -c <branch-name>  # Newer syntax

# Delete branch
git branch -d <branch-name>  # Safe delete
git branch -D <branch-name>   # Force delete

# Rename current branch
git branch -m <new-branch-name>
```

---

## 🔄 Merging and Rebasing

### Merge Operations
```bash
# Merge branch into current branch
git merge <branch-name>

# Merge with no fast-forward (creates merge commit)
git merge --no-ff <branch-name>

# Abort merge
git merge --abort
```

### Rebase Operations
```bash
# Rebase current branch onto another
git rebase <branch-name>

# Interactive rebase (last 3 commits)
git rebase -i HEAD~3

# Continue rebase after resolving conflicts
git rebase --continue

# Abort rebase
git rebase --abort
```

---

## 🔀 Remote Operations

### Remote Repository Management
```bash
# List remote repositories
git remote -v

# Add remote repository
git remote add <name> <url>

# Remove remote
git remote remove <name>

# Fetch from remote
git fetch <remote-name>

# Pull changes
git pull <remote-name> <branch-name>
git pull  # From default remote and branch

# Push changes
git push <remote-name> <branch-name>
git push  # To default remote and branch

# Push and set upstream
git push -u <remote-name> <branch-name>

# Force push (use with caution)
git push --force
git push --force-with-lease  # Safer force push
```

---

## 📝 Undoing Changes

### Discard Changes
```bash
# Discard changes in working directory
git checkout -- <file>
git restore <file>  # Newer syntax

# Checkout file in another branch
git checkout <commit-hash> -- <file>

# Discard all changes
git checkout -- .
git restore .  # Newer syntax

# Unstage file
git reset HEAD <file>
git restore --staged <file>  # Newer syntax
```

### Reset Operations
```bash
# Soft reset (keeps changes staged)
git reset --soft HEAD~1

# Mixed reset (keeps changes unstaged)
git reset HEAD~1
git reset --mixed HEAD~1

# Hard reset (discards all changes)
git reset --hard HEAD~1

# Reset to specific commit
git reset --hard <commit-hash>
```

### Revert Operations
```bash
# Revert a commit (creates new commit)
git revert <commit-hash>

# Revert last commit
git revert HEAD
```

---

## 🔍 Viewing and Searching

### View Changes
```bash
# View changes in working directory
git diff

# View staged changes
git diff --staged
git diff --cached

# View changes between commits
git diff <commit1> <commit2>

# View file at specific commit
git show <commit-hash>:<file-path>
```

### Search History
```bash
# Search commit messages
git log --grep="search term"

# Search code changes
git log -S "search term"

# Search by author
git log --author="author name"

# Search by date
git log --since="2024-01-01" --until="2024-12-31"
```

---

## 🏷️ Tags

### Tag Operations
```bash
# List tags
git tag

# Create lightweight tag
git tag <tag-name>

# Create annotated tag
git tag -a <tag-name> -m "Tag message"

# Push tags to remote
git push <remote-name> <tag-name>
git push --tags  # Push all tags

# Delete tag
git tag -d <tag-name>
git push <remote-name> --delete <tag-name>  # Delete remote tag
```

---

## 🧹 Cleanup and Maintenance

### Cleanup Operations
```bash
# Remove untracked files
git clean -n  # Dry run
git clean -f  # Force remove

# Remove untracked files and directories
git clean -fd

# Prune remote tracking branches
git remote prune <remote-name>
```

### Stash Operations
```bash
# Stash changes
git stash
git stash save "Stash message"

# List stashes
git stash list

# Apply stash
git stash apply
git stash apply stash@{0}  # Apply specific stash

# Pop stash (apply and remove)
git stash pop

# Drop stash
git stash drop stash@{0}

# Clear all stashes
git stash clear
```

---

## ⚡ Useful Tips

### Aliases
```bash
# Create useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
```

### Configuration
```bash
# Set user name and email
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Set default editor
git config --global core.editor "code --wait"  # VS Code
git config --global core.editor "vim"          # Vim

# Set default branch name
git config --global init.defaultBranch main

# View configuration
git config --list
git config --global --list
```

### Common Workflows
```bash
# Update fork from upstream
git fetch upstream
git merge upstream/main
git push origin main

# Squash commits (interactive rebase)
git rebase -i HEAD~n  # n = number of commits
# Change 'pick' to 'squash' for commits to combine

# Find large files in history
git rev-list --objects --all | \
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | \
  awk '/^blob/ {print substr($0,6)}' | \
  sort --numeric-sort --key=2 | \
  tail -10
```

---

## 🚨 Troubleshooting

### Common Issues
```bash
# Recover deleted file
git checkout HEAD -- <file>

# Fix line ending issues
git config --global core.autocrlf true   # Windows
git config --global core.autocrlf input  # macOS/Linux

# Ignore file that was already tracked
git rm --cached <file>
# Then add to .gitignore

# Fix merge conflicts
# 1. Edit conflicted files
# 2. Stage resolved files
git add <resolved-file>
# 3. Complete merge
git commit
```

---

## 📚 Additional Resources
- [Official Git Documentation](https://git-scm.com/doc)
- [GitHub Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)

