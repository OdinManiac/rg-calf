#!/bin/bash

# Create logs directory if it doesn't exist
mkdir -p logs

echo "Starting 10 parallel runs of main.py..."

# Launch 10 instances in parallel
for i in {1..10}; do
    # Set a unique run ID for MLflow tracking
    # export MLFLOW_RUN_ID="parallel_run_$i"
    
    # Run the Python script in the background and redirect output to a log file
    uv run main.py > "logs/run_$i.log" 2>&1 &
    
    # Store the process ID
    pids[$i]=$!
    
    echo "Started run $i with PID ${pids[$i]}"
done

# Wait for all processes to complete
echo "Waiting for all processes to complete..."
wait

echo "All runs completed!" 