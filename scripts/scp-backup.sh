# Backuper
set -x

# --- Configuration ---
SOURCE_FILE="FILL"
SOURCE_DIR="FILL"
DATE_SUFFIX=$(date +"%Y-%m-%d")
ZIP_NAME="backup_$DATE_SUFFIX.zip"
ZIP_PASSWORD="FILL"

REMOTE_USER="pi"
REMOTE_HOST="raspberrypi.local"
REMOTE_PATH="/home/pi/"

# --- 1. Prepare Workspace ---
echo "--- Preparing files ---"
mkdir -p ./temp_backuper

echo "Creating $PWD/temp_backuper"

cp "$SOURCE_FILE" ./temp_backuper/
cp -r "$SOURCE_DIR" ./temp_backuper/

# --- 2. Zip with Password ---
# We use -e for encrypt and -r for recursive
echo "--- Encrypting ZIP file ---"

# brew install p7zip
7z a -p"$ZIP_PASSWORD" "$ZIP_NAME" ./temp_backuper/*

# --- 4. Verify Zip Creation ---
if [ ! -f "$ZIP_NAME" ]; then
    echo "ERROR: The zip file was not created!"
    exit 1
else
    echo "SUCCESS: $ZIP_NAME created ($(du -h "$ZIP_NAME" | cut -f1))"
fi

# --- 3. SCP to Remote Server ---
# No password needed here because of your SSH keys!
echo "--- Transferring via SSH Key ---"
scp "$ZIP_NAME" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

if [ $? -eq 0 ]; then
    echo "Successfully transferred $ZIP_NAME to $REMOTE_HOST"
else
    echo "Transfer failed. Check your SSH key connection."
fi

# --- 4. Cleanup ---
rm -rf ./temp_backuper
rm "$ZIP_NAME"

echo "Done."
