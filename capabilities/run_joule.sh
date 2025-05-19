#!/bin/bash

# Exit immediately on error
set -e

# Function to print error message and exit
handle_error() {
    echo "❌ Error on line $1: $2"
    exit 1
}

# Trap errors and pass line number and command to handler
trap 'handle_error $LINENO "$BASH_COMMAND"' ERR

echo "🚀 Starting Joule automation script..."
cd /Users/I740756/sf_onb/sap_joule_example/capabilities


# Step 1: Navigate to helloworld directory
echo "📂 Changing to 'helloworld' directory..."
cd helloworld

# Step 2: Compile with joule
echo "🛠️ Compiling with 'joule compile'..."
joule compile

# Step 3: Go back to the previous directory
echo "🔙 Returning to parent directory..."
cd ..

# Step 4: Deploy with joule
echo "🚚 Deploying with 'joule deploy'..."
joule deploy

# Step 5: Launch test_r
echo "🚀 Launching 'test_r' with 'joule lunch test_r'..."
joule launch test_r

echo "✅ All steps completed successfully!"
