# -*- coding: utf-8 -*-
import os
import socket
import subprocess
from libqtile import qtile
from libqtile import hook
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.command import lazy
from typing import List  # noqa: F401
from libqtile.backend.x11 import window
from libqtile.confreader import ConfigError
from libqtile.widget import base
XEMBED_PROTOCOL_VERSION = 0

# Variable
mod = "mod4"
terminal = "kitty"
my_browser = "firefox"
my_editor = "kitty -e nvim"
my_file_manager = "kitty -e vifmrun"

keys = [
    # Launch stuff
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(my_browser), desc="Launches my web browser"),
    Key([mod], "c", lazy.spawn("qalculate-gtk"), desc="Spawn a command using a prompt widget"),
    Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, 'control'], "j",
        lazy.layout.shrink().when(layout='monadtall'),
        lazy.layout.grow_down().when(layout='columns')
    ),
    Key([mod, 'control'], "k",
        lazy.layout.grow().when(layout='monadtall'),
        lazy.layout.grow_up().when(layout='columns')
    ),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # MonadTall
    Key([mod, "control"], "o", lazy.layout.maximize()),
    # Columns
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    # Move to the groups
    Key([mod], "period", lazy.screen.next_group(), desc = "Move to the group on the right"),
    Key([mod], "comma", lazy.screen.prev_group(), desc = "Move to the group on the left"),
    Key([mod], "Tab", lazy.screen.toggle_group(), desc = "Move to the last visited group"),

    # Toggle between different layouts as defined below
    Key([mod, "control"], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Toggle between layouts"),

    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Audio control
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),

    # Screen brightness control
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 15")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 15")),

    # Cmus control
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

    # Screenshot
    Key([], "Print", lazy.spawn("flameshot screen")),
    Key([mod], "Print", lazy.spawn("flameshot gui")),
    
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle fullscreen"),

    Key([mod], "f", lazy.group['file_manager'].dropdown_toggle('file')),
    Key([mod], "w", lazy.group['myWiki'].dropdown_toggle('openWiki')),
    Key([mod], "m", lazy.group['ncmpcpp'].dropdown_toggle('music')),
]

# Workspaces
groups = [
        Group("1"),
        Group("2"),
        Group("3"),
        Group("4"),
        Group("5"),
        Group("6"),
        Group("7"),
        Group("8", matches=[Match(wm_class=["Inkscape"])], layout="max"),
        Group("9", matches=[Match(wm_class=["telegram-desktop"])]),
        ]

for i in groups:
    keys.extend([
        Key(
            [mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name),
        ),
        Key(
            [mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name),
        ),
    ])

groups.append(
   ScratchPad("file_manager", 
              [DropDown("file", "kitty -e ranger",
                        x=0.12, y=0.12, width=0.75, height=0.7,on_focus_lost_hide=False)])
)
groups.append(
   ScratchPad("myWiki",
              [DropDown("openWiki", "kitty -e nvim -c ':VimwikiIndex'",
                        x=0.2, y=0.05, width=0.6, height=0.9, on_focus_lost_hide=False, opacity=1.0)])
)
groups.append(
   ScratchPad("ncmpcpp",
              [DropDown("music", "kitty -e ncmpcpp",
                        x=0.2, y=0.05, width=0.6, height=0.45, on_focus_lost_hide=False, opacity=1.0)])
)

# Colors
colors = {
          'background': '#202734',
          'foreground': '#CBCCC6',
          "black0": '#191E2A',
          "red0": '#FF3333',
          "green0": '#BAE67E',
          "yellow0": '#FFA759',
          "blue0": '#73D0FF',
          "magenta0": '#FFD580',
          "cyan0": '#95E6CB',
          "white0": '#C7C7C7',
          "black1": '#686868',
          "red1": '#F27983',
          "green1": '#A6CC70',
          "yellow1": '#FFCC66',
          "blue1": '#5CCFE6',
          "magenta1": '#FFEE99',
          "cyan1": '#95E6CB',
          "ice1": '#bbccdd',
          "white1": '#FFFFFF'
          }

# Default theme for layouts
layout_theme = {"border_width": 2,
                "margin": 12,
                "border_focus": colors["yellow1"],
                "border_normal": colors["background"]
                }

# Layouts to be used
layouts = [
    layout.MonadTall(**layout_theme, ratio = 0.55),
    layout.Columns(**layout_theme, grow_amount = 1, border_on_single = True),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.Floating(**layout_theme)
]

# Define prompt
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font = 'Iosevka Nerd Font',
    fontsize=17,
    padding=2,
    background=colors["foreground"]
)

extension_defaults = widget_defaults.copy()

# Widgets in status bar
screens = [
    Screen(
        top=bar.Bar([
            widget.GroupBox(
                font = "Iosevka Medium",
                fontsize = 18,
                margin_y = 3,
                margin_x = 0,
                padding_y = 5,
                padding_x = 3,
                borderwidth = 3,
                active = colors["white0"],
                inactive = colors["yellow0"],
                rounded = False,
                highlight_color = colors["black0"],
                highlight_method = "line",
                this_current_screen_border = colors["blue0"],
                this_screen_border = colors["green0"],
                other_current_screen_border = colors["blue0"],
                other_screen_border = colors["green0"],
                foreground = colors["foreground"],
                background = colors["background"]
                ),
            widget.TextBox(
                text = '|',
                font = "Iosevka Regular",
                background = colors["background"],
                foreground = colors["black1"],
                padding = 2,
                fontsize = 18
                ),
            widget.CurrentLayoutIcon(
                custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                foreground = colors["foreground"],
                background = colors["background"],
                padding = 0,
                scale = 0.8
                ),
            widget.CurrentLayout(
                foreground = colors["foreground"],
                background = colors["background"],
                padding = 5,
                ),
            widget.TextBox(
                text = '|',
                font = "Iosevka Regular",
                background = colors["background"],
                foreground = colors["black1"],
                padding = 2,
                fontsize = 18
                ),
            widget.WindowName(
                font = "Iosevka Medium",
                foreground = colors["ice1"],
                background = colors["background"],
                padding = 0,
                fontsize = 18
                ),
            widget.Prompt(
                prompt = 'Run: ',
                padding = 5,
                foreground = colors["foreground"],
                background = colors["background"]
                ),
            widget.Sep(
                linewidth = 0,
                padding = 6,
                foreground = colors["background"],
                background = colors["background"]
                ),
            widget.Memory(
                foreground = colors["background"],
                background = colors["yellow0"],
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
                measure_mem='G',
                format = '  {MemUsed:.2f}{mm}/{MemTotal:.2f}{mm} ',
                update_interval = 10,
                padding = 2
                ),
            widget.PulseVolume(
                foreground = colors["black0"],
                background = colors["cyan1"],
                padding = 2,
                update_interval = 0.1,
                fmt = ' 墳 {} '
                ),
            widget.Battery(
                foreground = colors["black0"],
                background = colors["green1"],
                low_percentage = 0.25,
                update_interval = 5,
                full_char = '⚡',
                charge_char = '🔌',
                discharge_char = '🔋',
                low_foreground = colors["black0"],
                low_background = colors["red1"],
                format = '{char} {percent:2.0%}',
                padding = 2
                ),
            widget.Clock(
                foreground = colors["black0"],
                background = colors["magenta1"],
                format = "%A, %Y-%m-%d, %H:%M ",
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(my_browser + " https://calendar.proton.me/")},
                padding = 2,
                fmt = '   {}'
                ),
            widget.Systray(
                background = colors["background"]
                    )],
            24,
        ),
        wallpaper = '/home/jim/Pictures/wallpaper/0026.jpg',
        wallpaper_mode = 'fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

floating_layout = layout.Floating(**layout_theme, float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='R_x11'),
    Match(wm_class='gnuplot_qt'),
    Match(wm_class='matplotlib'),
    Match(wm_class='Qalculate-gtk'),
    Match(wm_class='arandr'),
    Match(wm_class='Nvidia-settings'),
    Match(wm_class='Bitwarden'),
    Match(wm_class='Pavucontrol'),
    Match(wm_class='TelegramDesktop'),
    Match(wm_class='popup-bottom-center'),
    Match(wm_class='firefox', role='About'),
    Match(wm_class='firefox', role='Organizer'),
    Match(wm_class='RStudio', title='Plot Zoom'),
  ])

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/')
    subprocess.Popen([home + '.config/qtile/autostart.sh'])

