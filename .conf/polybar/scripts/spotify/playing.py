#!/usr/bin/env python3

import dbus

trunclen = 30

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")

    spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")

    def get_property(property: str):
        return spotify_properties.Get("org.mpris.MediaPlayer2.Player", property)

    status = 1 if get_property("PlaybackStatus") == 'Playing' else 0

    print(status)

except Exception:
    print(1)
