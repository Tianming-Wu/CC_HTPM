---@diagnostic disable: undefined-field, param-type-mismatch
function logfx_gettimetag()
    return string.format("%s %s", os.date("local"), textutils.formatTime(os.time("local")));
end

function logfx_init()
    lgtf = io.open("\\log\\htpm.log", "w");

    lgtf.write(lgtf, string.format("[%s] Label: %s\n",  logfx_gettimetag(), os.computerLabel()));
    lgtf.write(lgtf, string.format("[%s] ID: %s\n", logfx_gettimetag(), os.computerID()));

end

function logto(logstr, forceDebug)
    local logstr_make = string.format("[%s] %s\n",  logfx_gettimetag(), logstr);
    lgtf.write(lgtf, logstr_make);
    if forceDebug or (cfgtb and cfgtb.config and cfgtb.config.debug and cfgtb.config.debug==true) then
        print(logstr_make);
    end
end