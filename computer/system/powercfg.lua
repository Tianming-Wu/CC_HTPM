
function pw_shutdown()
    mon.setBackgroundColor(colors.black); mon.clear(); shell.run("shutdown");
end

function pw_restart()
    mon.setBackgroundColor(colors.black); mon.clear(); shell.run("reboot");
end