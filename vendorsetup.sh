export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C.UTF-8"
export USE_CCACHE=1 # use ccache
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 20G; # 20GB cache
lunch twrp_RMX1991-eng
