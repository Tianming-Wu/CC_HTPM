
function monitor_init()
    mon.setCursorPos(1,1); mon.blit(" MONITOR"..string.rep(" ",msx-8),string.rep("0",msx),string.rep("b",msx)); --paint monitor title
end