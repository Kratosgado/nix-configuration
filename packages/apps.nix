{ pkgs, ... }: {
  home.packages = with pkgs; [
    # blender
    # godot
    # blendfarm
    pcsx2
    # firefox
    obs-studio
    insomnia

    gimp
    # android-studio-full
    # android-studio
    jetbrains.idea-community
    discord
    google-chrome
    vlc
    vdhcoapp
    yt-dlp
    libreoffice
    docker
    dbeaver-bin
    mongodb-compass
    telegram-desktop
    zapzap
    redisinsight
    postgresql # for dadbod
  ];
}
