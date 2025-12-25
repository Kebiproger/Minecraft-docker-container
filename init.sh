#!/bin/bash

(
    echo "[ALWAYS-RUN] Waiting for command pipe to be ready..."
    
    while [ ! -p /tmp/minecraft-console-in ]; do
        sleep 2
    done
    
    echo "[ALWAYS-RUN] Pipe found, waiting for final server startup..."
    sleep 20
    
    mc-send-to-console "op Nickname"  # change 'Nickname' to your Minecraft username
    mc-send-to-console "gamerule keepInventory true"
    echo "[ALWAYS-RUN] Commands sent successfully."
) &

exec /start
