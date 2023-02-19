print("Running main.lua");

require "logfx"
logfx_init();

logto("[Monitor] Initializing...");
mon = peripheral.find("monitor");
if not mon == nil then
    logto("[Monitor]ERROR: CANNOT FIND VALID MONITOR\n  #mon is nil");
    os.exit();
else
    if not mon.isColor() then
        mon.setCursorPos(18,9);
        mon.write("INVALID DISPLAY");
        logto("[Monitor] FATAL: Monitor does not support color.");
        os.exit();
    end
    mon.clear();
end

msx, msy = mon.getSize();
logto("[Monitor] current size ".. msx .. "*" .. msy);

mon.setCursorBlink(false);
mon.setBackgroundColor(colors.black); mon.setTextColor(colors.white);
mon.clear();

logto("[System] Starting up...");

require "loadscreen"
ld_init(mon); --init the load screen!
--Finish all the init work here, otherwise "ERROR" it.

require "config";
config_parse();

logto("[Rednet] Starting on side top...");
rdn = rednet.open("top");
if rdn == false then ld_posterror("Failed to open Rednet"); sleep(1); os.exit(); end
logto("[Rednet] Started");
ld_upd(10);

sleep(1);

--Finish init, and clear the screen.
ld_finished();
logto("[System] Startup finished");

mon.setBackgroundColor(colors.white);
mon.setTextColor(colors.black);
mon.clear();

require "monitor"
require "menu"
require "powercfg"

monitor_init();
menu_init();

menuesi = "root";

while(true) do --this is the main message loop.
---@diagnostic disable-next-line: undefined-field
    local event,side,x,y=os.pullEvent("monitor_touch");
    logto("[Monitor] touched at (" .. x .. ", " .. y .. ")");

    if(x>=2 and x<=7)and(y==12)then menu_system(); --this series of commands process the touching events.
    elseif(x>=2 and x<=9)and(y==14)then menu_resource();
    elseif menuesi == "system" then
        if(x>=2 and x<=7)and(y==12)then menu_system();
        elseif(x>=15 and x<=23)and(y==12)then pw_shutdown();
        elseif(x>=15 and x<=22)and(y==14)then pw_restart(); end
    elseif false then

    
    end
    
    sleep(0.1);
end