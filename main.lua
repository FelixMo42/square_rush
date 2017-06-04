math.randomseed( os.time() )

f15 = love.graphics.newFont(15)
f32 = love.graphics.newFont(32)
love.graphics.setFont(f15)

red = 0
green = 43
blue = 0

function love.update(dt)
	local x = love.mouse.getX()
	local y = love.mouse.getY()

	if love.mouse.isDown(1) and x > 370 and y > 410 and x < 370 + 75 and y < 410 + 30 then
		require "start"
	end

	red = math.min(red + dt * 8  , 139)
	blue = math.min(blue + dt * 17, 226)
end

function love.draw()
	love.graphics.setFont(f32)
	love.graphics.setColor(red,green,blue)
	love.graphics.printf("Square Rush",0,155,800,"center")


	love.graphics.setFont(f15)
	love.graphics.rectangle("line",370,410,75,30)
	love.graphics.printf("start",370,415,75,"center")
end