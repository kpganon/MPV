<p align="center"><img src="http://i.imgur.com/qmxCXRC.png" alt="MPV logo" width="128" height="128"/></p>
<p align="center"><img src="https://i.imgur.com/TpkpA9R.gif" height="480"/></p>
<p align="center"><a href="https://imgur.com/a/ldJ9D">Usage</a></p>
<div class="header">
  <h1>MPV CONFIG</h1>
</div>
https://mpv.io

https://mpv.io/manual/stable/#synopsis

<h1>[Installation]</h1>

* refer to [this](https://github.com/kpganon/Guides/blob/master/mpv%20guide%20v1.3.txt) guide
* place all files into your %APPDATA%\mpv folder
* edit .conf files accordingly

<h1>[Keybinds]</h1>

__Default__: https://mpv.io/manual/stable/#keyboard-control

Colons can be used to align columns.

| Keybind       | Action        |
| ------------- |:-------------:|
| **Mouse wheel up+down**     | volume control |
| **Ctrl+V**      | paste url into mpv      | 
| **Shift+Enter** | show playlist      |
| **Ctrl+arrow keys l/r** | skip back/forward in playlist   |
| **p** | save current playlist to .m3u (saved to %APPDATA%\mpv\Playlists)   |
| **Ctrl+r** | reload video  |
| **F1+left click | click+drag to pan video   |
| **Shift+mousewheel up or down** | zoom in/out of video   |
| **Alt+left/right arrow** | rotate video   |
| **Alt+d** | remove all video filters   |
| **insert** | quit player (alternative to q)   |
| **Alt+1** | toggle borderless   |
| **Shift+v** | cycle video player scale   |
| **l** | toggle file loop   |
| **i** | show video stats   |
| **Ctrl+f** | crop video   |
| **Shift+w** | start <a href="https://github.com/ElegantMonkey/mpv-webm">webm.lua</a>   |
| **Ctrl+e** | download currently playing video to desktop using youtube-dl   |
<h6><i>See <a href="https://github.com/kpganon/MPV/blob/master/input.conf">input.conf</a> for more</i></h6>


* __Mouse wheel up+down__ .....................volume control
* __Ctrl+V__ ..................................paste url into mpv
* __Shift+Enter__ .............................show playlist
* __Shift+< & Shift+>__ .......................skip back/forward in playlist
* __p__ .......................................save current playlist to .m3u (saved to %APPDATA%\mpv\Playlists)
* Ctrl+r.......................................reload video
* __F1+drag__ .................................click+drag to pan video
* __Shift+mousewheel up or down__..............zoom in/out of video
* __Alt+d__....................................remove all video filters
* __Alt+left/right arrow__......................rotate video
* __insert__....................................quit player (alternative to q)
* __Alt+1__.....................................toggle borderless
* __Shift+v__...................................cycle video player scale
* __l__.........................................toggle file loop
* __i__.........................................show video stats
* __Ctrl+f__....................................crop video
* __d__.........................................deinterlace (ctrl+d + d again to use enhanced deinterlace filter)
* __Ctrl+f__....................................crop video
* __Shift+w__...................................start webm.lua
* __Ctrl+e__.....................................download currently playing video to desktop using youtube-dl
<h6><i>See <a href="https://github.com/kpganon/MPV/blob/master/input.conf">input.conf</a> for more</i></h6>

<h1>Installed userscripts</h1>

## <a href="https://github.com/jonniek/mpv-scripts/blob/master/appendURL.lua">appendURL</a>
    * Paste url (__Ctrl+v__)
    
## <a href="https://github.com/Argon-/mpv-config/blob/master/scripts/autosub.lua">autosub</a>
    * Download subtitles for active file. <i>Requires <a href="https://github.com/Diaoul/subliminal">subliminal</a></i>
    
## <a href="https://github.com/ElegantMonkey/mpv-webm">
    * Quick webms (__Shift+w__)
    * only works with local media and streamed mp4s 
  
## <a href="https://github.com/occivink/mpv-scripts/blob/master/drag-to-pan.lua">drag-to-pan</a>
      * Pan video (__F1+left click__)
      
<h3>Passive</h3>

## <a href="https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autoload.lua">autoload</a>
    * Automatically loads all files in active file's folder into a playlist
    
## <a href="https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autodeint.lua">autodeint(erlance)</a>

<h6>Additional</h6>
https://github.com/mpv-player/mpv/wiki/User-Scripts
https://github.com/occivink/mpv-scripts
