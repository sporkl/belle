# BELLE

Bad Ecumenical Love Layout Engine

## What is it?

It is a simple hbox and vbox layout engine (I'd also like to add scrolling soon), but is general enough to work with anything. I personally plan on using it primarily with SUIT, but it should work with anything regardless of whethere you're doing something with a UI or not.

## Example

```lua
function love.load()
    belle = require "belle"
end


function love.draw()
    belle.hbox(0, 0, love.graphics.getWidth(), love.graphics.getHeight(), 5, 
        {
            {1, function(x0, y0, w0, h0)
                    belle.pbox(x0, y0, w0, h0, 100,
                        function(x1, y1, w1, h1)
                            love.graphics.setColor(1, 1, 1)
                            love.graphics.rectangle("fill", x1, y1, w1, h1)
                        end
                    )
                end
            },
            {1, function(x1, y1, w1, h1)
                    belle.pvbox(x1, y1, w1, h1, 5, 
                        {
                            {1, function(x2, y2, w2, h2)
                                    love.graphics.setColor(1, 0, 0)
                                    love.graphics.rectangle("fill", x2, y2, w2, h2)
                                end
                            },
                            {5, function(x3, y3, w3, h3)
                                    love.graphics.setColor(0, 1, 0)
                                    love.graphics.rectangle("fill", x3, y3, w3, h3)
                                end
                            },
                            {2, function(x4, y4, w4, h4)
                                    love.graphics.setColor(0, 0, 1)
                                    love.graphics.rectangle("fill", x4, y4, w4, h4)
                                end
                            }
                        }
                    )
                end
            }

        }
    )
e
```

# Explanation

To add BELLE to your project, just clone this repository into your project directory and put `require "belle"` where needed.

BELLE has 2 core functions, belle.hbox and belle.vbox. They basically are the same, but one lays out things vertically and the other horizontally. <sub> Wow! That's so amazing! Never would have guessed! </sub> They both take 6 arguments:

```lua
belle.hbox(x, y, width, height, padding, t)
belle.vbox(x, y, width, height, padding, t)
```

Most of the arguments are pretty self-explanatory. `padding` is the space between layed out things.

`t`, however, is mildly complicated. The argument `t` should be a table. That table should have tables as elements. Each of those tables should have a number as the first element and a function that takes 4 arguments as the second element. For example, the following is a valid argument for `t`:

```lua
{
    {3, function(x0, y0, w0, h0) love.graphics.rectangle("fill", x0, y0, w0, h0) end},
    {5, function(x1, y1, w1, h1) love.graphics.rectangle("fill", x1, y1, w1, h1) end},
}
```

The first element of the sub-tables, the number, represents the amount of space each drawn element takes up, relative to the other drawn elements. (TODO: add diagram because it is hard to explain with words). Just try out running the example and tweaking this number to get a sense for what it does.

The second element of the sub-tables, the function, should draw whatever element you want, given the x, y, width and height. There are examples in the example and above valid argument for `t`.

I apologize if this is unclear. I need to work on my technical writing.

A mildly interesting thing you can do, as demonstrated in the example, is nesting hboxes and vboxes.

If you want an hbox or vbox to have its own background, you need to do it yourself. Sorry.

## Total function list

```lua
belle.hbox(x, y, w, h, pad, t)
belle.vbox(x, y, w, h, pad, t)
belle.phbox(x, y, w, h, pad, t)
belle.pvbox(x, y, w, h, pad, t)
belle.pbox(x, y, w, h, pad, f)
```

The "p" stands for pad. `pbox` takes just a function, not the table of tables thingy, and pads it. `phbox` and `pvbox` just pad a `hbox` or `vbox`. `hbox` and `vbox` padding is the space between each element.

## Other Information

__Dependencies:__ none

__Website:__ https://gitlab.com/comradesparklepony/belle

__License:__ MIT.

__Contributing:__ Please do! I use GitLab.

__Contact:__ comrade sparkle pony at gmail dot com

Please let me know if you have any questions.