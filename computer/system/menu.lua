
function menu_init()
    menu_root();
end

function menu_root()
    menuesi = "root";
    mon.setCursorPos(1,10); mon.blit(" MENU"..string.rep(" ", msx-5),string.rep("0",msx),string.rep("b",msx)) --paint menu title
    
    mon.setCursorPos(2,12); mon.write("SYSTEM");
    mon.setCursorPos(2,14); mon.write("RESOURCE");
end

function menu_clear()
    for l=11,19,1 do
        mon.setCursorPos(1,l); mon.clearLine();
    end
end

function menu_system()
    if menuesi == "system" then menu_clear(); menu_root(); return; end
    menu_clear(); menu_root(); menuesi = "system";
    mon.setCursorPos(2,12); mon.blit("SYSTEM", "000000", "bbbbbb");

    mon.setCursorPos(15,12); mon.write("Shutdown");
    mon.setCursorPos(15,14); mon.write("Restart");
    mon.setCursorPos(15,16); mon.write("About");
end

function menu_resource()
    if menuesi == "resource" then menu_clear(); menu_root(); return; end
    menu_clear(); menu_root(); menuesi = "resource";
    mon.setCursorPos(2,14); mon.blit("RESOURCE", "00000000", "bbbbbbbb");
end