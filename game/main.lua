require("nest").init({console = "3ds"})

function love.load()
    playbutton = {}
    playbutton.x = 0
    playbutton.y = 0
    playbutton.width = 0
    playbutton.height = 0

    exitbutton = {}
    exitbutton.x = 0
    exitbutton.y = 0
    exitbutton.width = 0
    exitbutton.height = 0

    gameloadbool = 0

    player = {}
    player.customization_mode = 0
    player.x = 0
    player.y = 0
    player.dy = 1
    player.ay = -5
    player.vx = 1
    player.vy = 0


end

function love.update(dt)

end

function love.draw(screen)
    local width, height = love.graphics.getDimensions(screen)
    if screen == "bottom" then 

        if gameloadbool == 0 then

            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", 0, 0, width, height)

            love.graphics.setColor(0.6, 0.4, 1)

            playbutton.x = width / 4
            playbutton.y = (height / 4) - (height / 12)
            playbutton.width = width / 2
            playbutton.height = height / 6

            -- play button
            love.graphics.rectangle("fill", playbutton.x, playbutton.y, playbutton.width, playbutton.height)

            -- customization button
            love.graphics.rectangle("fill", width / 4, (height / 2) - (height / 12), width / 2, height / 6)

            -- credits button (is this needed???? it's in the og game)
            love.graphics.rectangle("fill", width / 4, (3 * height / 4) - (height / 12), width / 2, height / 6)
            
        else
            love.graphics.setColor(0.4, 0.5, 0.8)
            love.graphics.rectangle("fill", 0, 0, width, height)

            exitbutton.x = width / 4
            exitbutton.y = (height / 2) - (height / 12)
            exitbutton.width = width / 2
            exitbutton.height = height / 6

            -- exit button
            love.graphics.setColor(0.7, 0.5, 0.8)
            love.graphics.rectangle("fill", exitbutton.x, exitbutton.y, exitbutton.width, exitbutton.height)

        end

    else

        if gameloadbool == 0 then
            love.graphics.setColor(0.6, 0.4, 1)
            love.graphics.rectangle("fill", 0, 0, width, height)

            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Flickering Connections for 3DS")
        else
            love.graphics.setColor(0.4, 0.5, 1)
            love.graphics.rectangle("fill", 0, 0, width, height)

            -- load player
            player.x = (width / 2) - (width / 12)
            player.y = height / 2
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", player.x, player.y, width / 6, width / 6)
        end

    end

end

function love.touchpressed(id, x, y, dx, dy, pressure)

    if gameloadbool == 0 then
        if x > playbutton.x and x < (playbutton.x + playbutton.width) then
            if y > playbutton.y and y < (playbutton.y + playbutton.height) then
                gameloadbool = 1
            end
        end
    else
        if x > exitbutton.x and x < (exitbutton.x + exitbutton.width) then
            if y > exitbutton.y and y < (exitbutton.y + exitbutton.height) then
                gameloadbool = 0
            end
        end
    end
end



function love.gamepadpressed(joystick, button)
    if not joystick then
        return
    end

    if joystick:isGamepadDown("dpright") then
        player.x = player.x + player.vx
    elseif joystick:isGamepadDown("dpleft") then
        player.x = player.x - player.vx
    end
end
