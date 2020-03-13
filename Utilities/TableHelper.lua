local WIT, core = ...

local TableHelper = {}

core.TableHelper = TableHelper

function TableHelper.DeepCopy(from)
    local to = {}
    for k, v in pairs(from) do
        if type(v) == "table" then
            to[k] = TableHelper.DeepCopy(v);
        else
            to[k] = v;
        end
    end

    return to
end

function TableHelper.Concat(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end

    return t1
end
