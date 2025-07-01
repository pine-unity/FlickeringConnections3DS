require("nest").init({console = "3ds"})

function love.draw(screen)
    local width, height = love.graphics.getDimensions(screen)
    if screen == "bottom" then 
        love.graphics.setColor(1, 1, 1);
        love.graphics.rectangle("fill", 0, 0, width, height)
    else
        love.graphics.setColor(0.6, 0.4, 1);
        love.graphics.rectangle("fill", 0, 0, width, height)
    end

end

function love.gamepadpressed(joystick, button)
    love.event.quit()
end