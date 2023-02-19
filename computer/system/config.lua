
--local require "io";

function config_parse()
    local file = io.open("\\config\\config.json","r");
    if file == nil then logto("[Config] Open of file failed.", true); return; end
---@diagnostic disable-next-line: param-type-mismatch
    local content = file.read(file, "a");
    logto("[Config] loaded content:", true);
    logto(content);
    cfgtb = textutils.unserialiseJSON(content);

end