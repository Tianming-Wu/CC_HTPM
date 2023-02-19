print("Running main.lua");

require "config";
config_parse();

print("[Monitor] Initializing...");
mon = peripheral.find("monitor");
if not mon == nil then
    print("[Monitor]ERROR: CANNOT FIND VALID MONITOR\n  #mon is nil");
    os.exit();
else
    if not mon.isColor() then
        mon.setCursorPos(18,9);
        mon.write("INVALID DISPLAY");
        print("[Monitor] FATAL: Monitor does not support color.");
        os.exit();
    end
    mon.clear();
end

msx, msy = mon.getSize();
print("[Monitor] current size ".. msx .. "*" .. msy);

mon.setCursorBlink(false);
mon.setBackgroundColor(colors.black); mon.setTextColor(colors.white);
mon.clear();

print("[System] Starting up...");

require "loadscreen"
ld_init(mon); --init the load screen!
--Finish all the init work here, otherwise "ERROR" it.

print("[Rednet] Starting on side top...");
rdn = rednet.open("top");
if rdn == false then ld_posterror("Failed to open Rednet"); sleep(1); os.exit(); end
print("[Rednet] Started");
ld_upd(10);

sleep(1);

--Finish init, and clear the screen.
ld_finished();
print("[System] Startup finished");

mon.setBackgroundColor(colors.white);
mon.setTextColor(colors.black);
mon.clear();

require "monitor"
require "menu"

monitor_init();
menu_init();

menuesi = "root";

while(true) do --this is the main message loop.
---@diagnostic disable-next-line: undefined-field
    local event,side,x,y=os.pullEvent("monitor_touch");
    print("[Monitor] touched at (" .. x .. ", " .. y .. ")");

    if(x>=2 and x<=7)and(y==12)then menu_system(); --this series of commands process the touching events.
    elseif(x>=2 and x<=9)and(y==14)then menu_resource();
    elseif menuesi == "system" then
        if(x>=2 and x<=7)and(y==12)then menu_system();
        elseif(x>=15 and x<=23)and(y==12)then mon.setBackgroundColor(colors.black); mon.clear(); shell.run("shutdown");
        elseif(x>=15 and x<=22)and(y==14)then mon.setBackgroundColor(colors.black); mon.clear(); shell.run("reboot"); end
    elseif false then

    
    end
    
    sleep(0.1);
end