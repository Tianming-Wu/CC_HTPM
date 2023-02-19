
function ld_init(mon)
    _lmon = mon;
    local msx,msy = _lmon.getSize();
    sx = msx/2+1-10; sy = msy/2+1;

    _lmon.setCursorPos(msx/2+1-7,msy/2);
    _lmon.write("SYSTEM STARTUP");

    _lmon.setCursorPos(1,msy);
    _lmon.write("HTPM v0.1.83.10598 (c)Tianming");
end

function ld_upd(current)
    local e = current/100*20;
    _lmon.setCursorPos(sx, sy);
    _lmon.blit(
        string.rep(" ", 20),
        string.rep("0", 20),
        string.rep("0",e) .. string.rep("f",20-e)
    )
end

function ld_finished()
    mon.setCursorPos(sx,sy); mon.write(string.rep(" ",20));
    mon.setCursorPos(msx/2+1-4,msy/2+1); mon.write("FINISHED");
    sleep(0.5); mon.clear();
end

function ld_posterror(errormsg)
    local len = string.len(errormsg);
    local ux = msx/2+1-(len/2); local uy = msy/2+1;
    _lmon.setCursorPos(ux, uy);
    _lmon.write(errormsg);
end