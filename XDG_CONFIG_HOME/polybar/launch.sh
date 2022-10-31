# Terminate already running bar instances
killall -q polybar
# Launch Polybar, using default config location ~/.config/polybar/config.ini
#polybar example 2>&1 | tee -a /tmp/polybar.log & disown\

# took from https://github.com/polybar/polybar/issues/763
# capable of running multiple bars, one for monitor, works for single monitor too
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi
