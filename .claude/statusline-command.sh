#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract data using jq
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
session_name=$(echo "$input" | jq -r '.session_name // empty')
output_style=$(echo "$input" | jq -r '.output_style.name // empty')
context_remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Git information (using --no-optional-locks to avoid locking issues)
git_branch=""
git_status=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    git_branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Check for changes
    if ! git -C "$cwd" --no-optional-locks diff --quiet 2>/dev/null || \
       ! git -C "$cwd" --no-optional-locks diff --cached --quiet 2>/dev/null; then
        git_status="*"
    fi

    # Check for ahead/behind
    ahead=$(git -C "$cwd" --no-optional-locks rev-list --count @{u}..HEAD 2>/dev/null || echo 0)
    behind=$(git -C "$cwd" --no-optional-locks rev-list --count HEAD..@{u} 2>/dev/null || echo 0)

    if [ "$behind" -gt 0 ]; then
        git_status="${git_status}⇣"
    fi
    if [ "$ahead" -gt 0 ]; then
        git_status="${git_status}⇡"
    fi
fi

# Build status line components
status_parts=()

# Path (blue, like oh-my-posh config)
status_parts+=("$(printf '\033[34m%s\033[0m' "$cwd")")

# Git info (grey, like oh-my-posh config)
if [ -n "$git_branch" ]; then
    git_info=" ${git_branch}${git_status}"
    status_parts+=("$(printf '\033[90m%s\033[0m' "$git_info")")
fi

# Session name (if set)
if [ -n "$session_name" ]; then
    status_parts+=("$(printf '\033[35m[%s]\033[0m' "$session_name")")
fi

# Model name (yellow)
status_parts+=("$(printf '\033[33m%s\033[0m' "$model")")

# Output style (if not default)
if [ -n "$output_style" ] && [ "$output_style" != "default" ]; then
    status_parts+=("$(printf '\033[36m%s\033[0m' "$output_style")")
fi

# Context remaining (if available, show when under 50%)
if [ -n "$context_remaining" ]; then
    remaining_int=$(printf "%.0f" "$context_remaining")
    if [ "$remaining_int" -lt 50 ]; then
        if [ "$remaining_int" -lt 20 ]; then
            # Red when critically low
            status_parts+=("$(printf '\033[31mctx:%s%%\033[0m' "$remaining_int")")
        else
            # Yellow when getting low
            status_parts+=("$(printf '\033[33mctx:%s%%\033[0m' "$remaining_int")")
        fi
    fi
fi

# Join all parts with space separator
printf "%s" "${status_parts[0]}"
for ((i=1; i<${#status_parts[@]}; i++)); do
    printf " %s" "${status_parts[$i]}"
done


