#!/bin/bash
source /opt/redbot/venv/bin/activate
redbot-setup --instance-name $INAME --data-path /opt/redbot --backend json
redbot $INAME -p $PREFIX --owner $OWNER --token $BOT_TOKEN