# Submission Reminder App

The **Submission Reminder App** is a simple shell-based application that helps identify students who have **not yet submitted** their assignments.  
It automatically sets up a structured environment, checks submission records, and reminds students about pending submissions.

---

## 📦 Project Structure

Once you run the setup script (`create_environment.sh`), it will generate a directory called:

submission_reminder_<yourName>/




---

## ⚙️ Script Descriptions

| File | Purpose |
|------|----------|
| **create_environment.sh** | Creates the full environment, directories, and necessary files for the reminder app. |
| **copilot_shell_script.sh** | Lets you change the assignment name dynamically and rerun the reminder app. |
| **startup.sh** | Launches the reminder app. |
| **reminder.sh** | Reads assignment info and displays which students haven’t submitted. |
| **functions.sh** | Contains helper functions used by the reminder app. |
| **submissions.txt** | Stores student names, assignments, and submission statuses. |
| **config.env** | Holds configuration values like the assignment name and reminder intervals. |

---

## 🚀 How to Set Up the Environment

1. **Make the setup script executable:**
   ```bash
   chmod +x create_environment.sh



