#!/usr/bin/env bash
CARD_ID=$(pactl list cards short | grep "bluez" | cut -f1)
SINK_PROFILE=$(pactl list sinks short | grep bluez | cut -f2 | cut -f3 -d'.')

if [ "$SINK_PROFILE" == "headset_head_unit" ]; then
  NEW_PROFILE="a2dp_sink"
elif [ "$SINK_PROFILE" == "a2dp_sink" ]; then
  NEW_PROFILE="headset_head_unit"
fi

# Debug statements
# echo Current profile "$SINK_PROFILE"
# echo New profile "$NEW_PROFILE"
# echo Will run "pactl set-card-profile $CARD_ID $NEW_PROFILE"

# Toggle the profile
pactl set-card-profile $CARD_ID $NEW_PROFILE
