# Tape Backup Script for Windows

This script is designed to back up a Windows 7 backup image to tape. 
The Windows computer creates backups in a designated folder specified by this program, which then transfers those backups to the tape drive. 
The script comes preconfigured with default settings tailored to the original user. Be sure to update the script with your own settings as needed.

## Prerequisites

- Ensure you have the correct permissions to run the script. The script must be executed as the root user.
- Make sure to load the correct tape before running the script.
- If the backup size exceeds the tape capacity, the script will prompt you to insert a new tape.

## Script Details

- **Date Format Variables**:
  - `NOW`: Current date and time in the format `Month-Day-Year-Hour-Minute`.
  - `Month`: Full name of the current month.
  - `year`: Current year.

- **Tape Path**: The default tape device path is `/dev/st0`. Update this if your tape device is different.

- **Permission Check**: The script checks if it is being run as the root user. If not, it exits with an error message.

- **Tape Operations**:
  - Rewinds the tape before starting the backup process.
  - Changes directory to the specified backup folder (`/media/main/backup/THOR` by default). Update this path if your backup folder is located elsewhere.
  - Adds a timestamp to a file (`WindowsImageBackup/DATE.txt`) indicating when the backup started.
  - Runs the `tar` command to backup the `WindowsImageBackup` directory to the tape. The `--checkpoint=5000` option is used to display progress every 5000 files, and `--multi-volume` allows for multi-volume archives.

- **Completion**: Outputs a message indicating the backup process is complete and suggests verifying the backup on the tape.

## Usage

1. Open a terminal.
2. Navigate to the directory containing the `backup.sh` script.
3. Run the script with root privileges:
   ```sh
   sudo ./backup.sh
   ```

## Customization

- **Tape Device Path**: Update the `TAPE` variable with the path to your tape device.
- **Backup Folder**: Change the directory path in the `cd` command to your backup folder location.

Ensure you verify and adjust these settings according to your environment before executing the script.
