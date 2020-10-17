#!/usr/bin/env python3

import dbus

trunclen = 20

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')
    spotify_properties = dbus.Interface(spotify_bus, 'org.freedesktop.DBus.Properties')

    metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')

    song = metadata['xesam:title']
    artist = ', '.join(metadata['xesam:artist'])
    album = metadata['xesam:album']

    def ellipsize(item):
        if len(item) > trunclen:
            item = item[0:trunclen].strip()
            item += '...'

            if ('(' in item) and (')' not in item):
                item += ')'

        return item

    song = ellipsize(song)
    artist = ellipsize(artist)
    album = ellipsize(album)

    output = '%s - %s %%{F#99f9faf9}[%s]%%{F-}' % (song, artist, album)
    print(output)

except Exception:
    print('')
