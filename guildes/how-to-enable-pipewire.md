Install `pipewire` `pipewire-pulse` `wireplumber`
```systemctl --user enable pipewire
systemctl --user enable --now wireplumber
systemctl --user disable pulseaudio pulseaudio.socket
systemctl --user enable pipewire-pulse.socket pipewire-pulse
```
Now reboot
