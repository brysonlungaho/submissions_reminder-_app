# !/usr/bin/bash
# create_environment.sh
# Creates the Submission Reminder App environment

# Prompt for user name
read -p "Kindly enter your name: " yourname

main_dir="submission_reminder_${yourname}"

# Create directories
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/config"

echo "Creating your submission reminder environment..."

#1 functions.sh
cat > "$main_dir/modules/functions.sh" << 'EOF'
#!/usr/bin/bash
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"                while IFS=, read -r student assignment status; do                                      student=$(echo "$student" | xargs)                                                 assignment=$(echo "$assignment" | xargs)                                           status=$(echo "$status" | xargs)                                                   if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF
#2 submissions.txt
cat > "$main_dir/assets/submissions.txt" << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Edwin, Shell Navigation, submitted
Wahura, Shell Basics, not submitted
Joanne, Git, not submitted
Shannel, Shell Navigation, submitted
Carmz, Git, not submitted
EOF

#3 config.env
cat > "$main_dir/config/config.env" << 'EOF'
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=3
EOF

#4 reminder.sh
cat > "$main_dir/app/reminder.sh" << 'EOF'
#!/usr/bin/bash
source ./config/config.env
source ./modules/functions.sh

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions ./assets/submissions.txt
EOF

#5 startup.sh
cat > "$main_dir/startup.sh" << 'EOF'
#!/usr/bin/bash
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR" || exit 1

chmod +x app/.sh modules/.sh 2>/dev/null

echo "========================================"
echo "     Starting Submission Reminder App"
echo "========================================"

if [ -f "app/reminder.sh" ]; then
    bash app/reminder.sh
    echo "----------------------------------------"
    echo "Reminder App executed successfully!"
else
    echo "Error: reminder.sh not found!"
fi
EOF

# Make scripts executable
chmod +x "$main_dir/startup.sh" "$main_dir/app/".sh "$main_dir/modules/".sh

 echo "Environment created successfully in $main_dir"
echo "To start the app, run:"
echo "  ./submission_reminder_${yourname}/startup.sh"


