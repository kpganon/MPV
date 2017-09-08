<p align="center"><img src="http://i.imgur.com/qmxCXRC.png" alt="MPV logo" width="128" height="128"/></p>
<p align="center"><img src="https://i.imgur.com/TpkpA9R.gif" height="480" width="860"/></p>
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

| Keybind       | Action        |
| ------------- |:-------------:|
| **Mouse wheel ↑+↓**     | volume control |
| **Ctrl+V**      | paste url into mpv      | 
| **Shift+Enter** | show playlist      |
| **Ctrl+←/→ arrows** | skip back/forward in playlist   |
| **p** | save current playlist to .m3u (saved to %APPDATA%\mpv\Playlists)¹   |
| **Ctrl+r** | reload video  |
| **F1+left click** | click+drag to pan video   |
| **Shift+mousewheel ↑+↓** | zoom in/out of video   |
| **Alt+←/→** | rotate video   |
| **Alt+d** | remove all video filters   |
| **insert** | quit player (alternative to q)   |
| **Alt+1** | toggle borderless   |
| **Shift+v** | cycle video player scale   |
| **l** | toggle file loop   |
| **i** | show video stats   |
| **c** | crop video   |
| **b** | download subs   |
| **s** | take a screenshot²   |
| **Shift+w** | start <a href="https://github.com/ElegantMonkey/mpv-webm">webm.lua</a>   |
| **Shift+drag url onto mpv** | add link to playlist   |
| **Ctrl+e** | download currently playing video to desktop using youtube-dl³   |
| **d/Ctrl+d** | deinterlace/automatically detect which filter to use   |
* ¹ edit <a href="https://github.com/kpganon/MPV/blob/master/scripts/playlistmanager.lua#L6">line 6</a> if playlists don't save
* ² edit <a href="https://github.com/kpganon/MPV/blob/master/mpv.conf#L32">line 32</a> if screenshots fail
* ³ edit <a href="https://github.com/kpganon/MPV/blob/master/input.conf#L26">line 26</a> to change download directory
<h6><i>See <a href="https://github.com/kpganon/MPV/blob/master/input.conf">input.conf</a> for more</i></h6>
<h1>Installed userscripts</h1>

### <a href="https://github.com/jonniek/mpv-scripts/blob/master/appendURL.lua">appendURL</a>
    * Paste url (Ctrl+v)
    
### <a href="https://github.com/Argon-/mpv-config/blob/master/scripts/autosub.lua">autosub</a>
    * Download subtitles for active file (b)
    
   <h6><i>Requires <a href="https://github.com/Diaoul/subliminal">subliminal</a></i></h6>
    
### <a href="https://github.com/ElegantMonkey/mpv-webm">mpv-webm</a>
    * Quick webms (Shift+w)
    * Only works with local media and streamed mp4s 
    
   <h6><i>See <a href="https://github.com/kpganon/MPV/blob/master/README.MD#additional">below</a> for alternative methods</i></h6>
  
### <a href="https://github.com/occivink/mpv-scripts/blob/master/drag-to-pan.lua">drag-to-pan</a>
      * Pan video (F1+left click)
      
### <a href="https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autodeint.lua">autodeint(<i>erlace</i>)</a>
    * Detect which deinterlace filter to use (Ctrl+d)
    
### <a href="https://github.com/aidanholm/mpv-easycrop">easycrop</a>
    * Crop video (Ctrl+f)
    
### <a href="https://github.com/Argon-/mpv-stats">mpv-stats</a>
    * Show video info (i)
 
 ### <a href="https://github.com/jonniek/mpv-playlistmanager">mpv-playlistmanager</a>
    * Create/manage playlists 
    
| Keybind       | Action        |    
 | ------------- |:-------------:|    
 | **Shift+Enter** | show playlist items   |
 | **↑ & ↓ arrows+Enter** | move up/down playlist items   |
 | **⌫ Backspace** | remove item from playlist   |
 | **p** | save playlist to .m3u  | 

  <h6>* Dynamic keybinds will only work when the playlist is visible</h6>
    
<h3>Passive</h3>

### <a href="https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autoload.lua">autoload</a>
    * Automatically loads all files within a directory into a playlist
    
### <a href="https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/ontop-playback.lua">ontop-playback</a>
    * Disables always-on-top while video is paused
    
<h2>Additional</h2>
https://github.com/mpv-player/mpv/wiki/User-Scripts

https://github.com/occivink/mpv-scripts
