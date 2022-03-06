# MuseScore Tidy Tab Plugin

A MuseScore plugin to tidy tablature scores by applying these changes:

+ In voices 1 and 2
  + Set rests, stems, hooks & beams to a preset colour
  + Set the vertical offset position of rests
+ In voices 3 and 4
  + Hide rests, stems, hooks and beams

The settings can be changed by editing the plugin properties in TidyTabScore.qml
+ property var **inkElm** : "#A0A0A0"; // element ink colour
+ property var **offRest0** : -4; // Offset for voice 1 rests
+ property var **offRest1** : 4.5; // Offset for voice 2 rests

### License

Copyright (C) 2022 yonah_ag

This program is free software; you can redistribute it or modify it under the terms of the GNU General Public License version 3 as published by the Free Software Foundation and appearing in the LICENSE file.  
See https://github.com/yonah-ag/musescore-tidy-tab-score/blob/main/LICENSE

### Installation

This plugin requires version 3.6.x of MuseScore.  
Download TidyTabScore.qml then follow the handbook instructions:  
https://musescore.org/en/handbook/3/plugins

### Using the Plugin

From the **Plugins** menu select **Tidy Tab Score**.

![01](https://github.com/yonah-ag/musescore-tidy-tab-score/blob/main/images/TidyTab01.png)

### Additional Info

Link to official MuseScore Project page for this plugin:  
https://musescore.org/en/project/tidy-tab-score
