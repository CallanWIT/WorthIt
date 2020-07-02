local WIT, core = ...

local TableHelper = {}

core.TableHelper = TableHelper

function TableHelper.ShallowCopy(from)
    local to = {}
    for k, v in pairs(from) do
        to[k] = v
    end
    return to
end

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

function TableHelper.IndexOf(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end

    return nil
end

function TableHelper.RemoveValue(t, value)
    local index = TableHelper.IndexOf(t, value)

    if index then
        table.remove(t, index)
    end

    return t
end
