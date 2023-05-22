belle = {}

-- pbox (just pads)
function belle.pbox(x, y, w, h, pad, f)
    f(x + pad, y + pad, w - (2 * pad), h - (2 * pad))
end

-- hbox
function belle.hbox(x, y, w, h, pad, t)
    -- y-position of each sub-element
    local sub_y = y
    -- height of each sub-element
    local sub_height = h

    ---- find the width of a hypothetical element with ratio number 1
    -- sum of ratio numbers
    local ratio_sum = 0 
    for i=1,#t do
        ratio_sum = ratio_sum + t[i][1]
    end

    -- total amount of space that can actually put elements in
    -- basically, full width with padding removed
    local total_usable_width = w - ((#t * pad) - pad)

    -- width of a hypothetical element with ratio number 1
    local ratio1_width = total_usable_width / ratio_sum

    -- render each item
    local sub_x = x
    for i=1,#t do
        local sub = t[i]
        local sub_ratio = sub[1]
        local sub_width = ratio1_width * sub_ratio
        sub[2](sub_x, sub_y, sub_width, sub_height)
        sub_x = sub_x + sub_width + pad
    end
end

-- vbox
function belle.vbox(x, y, w, h, pad, t)
    -- x-position of each sub-element
    local sub_x = x
    -- width of each sub-element
    local sub_width = w

    ---- find the height of a hypothetical element with ratio number 1
    -- sum of ratio numbers
    local ratio_sum = 0 
    for i=1,#t do
        ratio_sum = ratio_sum + t[i][1]
    end

    -- total amount of space that can actually put elements in
    -- basically, full height with padding removed
    local total_usable_height = h - ((#t * pad) - pad)

    -- height of a hypothetical element with ratio number 1
    local ratio1_height = total_usable_height / ratio_sum

    -- render each item
    local sub_y = y
    for i=1,#t do
        local sub = t[i]
        local sub_ratio = sub[1]
        local sub_height = ratio1_height * sub_ratio
        sub[2](sub_x, sub_y, sub_width, sub_height)
        sub_y = sub_y + sub_height + pad
    end
end

function belle.phbox(x, y, w, h, pad, t)
    belle.pbox(x, y, w, h, pad,
        function(x0, y0, w0, h0) belle.hbox(x0, y0, w0, h0, pad, t) end
    )
end

function belle.pvbox(x, y, w, h, pad, t)
    belle.pbox(x, y, w, h, pad,
        function(x0, y0, w0, h0) belle.vbox(x0, y0, w0, h0, pad, t) end
    )
end


return belle