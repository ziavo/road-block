local HttpService = game:GetService('HttpService');
------------
local library = {};
------------
do
    function library:JsonEncode(table)
        return HttpService:JSONEncode(table);
    end;
    function library:JsonDecode(string)
        return HttpService:JSONDecode(string);
    end;

    function library:LoadData()
        if not isfolder(Configurations.DataKey) then 
            makefolder(Configurations.DataKey, library:JsonEncode(Configurations));
        end;
        if not isfile(Configurations.DataKey..'/Settings.json') then 
            writefile(Configurations.DataKey..'/Settings.json', library:JsonEncode(Configurations.Settings));
        end;
        ------
        wait();
        Configurations.Settings = library:JsonDecode(readfile(Configurations.DataKey..'/Settings.json'));
    end;
    --library:LoadData();

    function library:SaveData()
        if isfolder(Configurations.DataKey) then
            if isfile(Configurations.DataKey..'/Settings.json') then
                writefile(Configurations.DataKey..'/Settings.json', library:JsonEncode(Configurations.Settings));
                return;
            end;
        end;
    end;
end;
------------
return library;
