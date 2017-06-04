p2 = {
	x = love.graphics.getWidth() - 60,
	y = 0,
	speed = 200,
	point = 0,
	time = 25,
}

p2.timer = p2.time

function p2.moveX(a)
	p2.x = p2.x + a
end

function p2.moveY(a)
	p2.y = p2.y + a
end

function p2.bounus()
	if p2.point == 20 then
		p2.speed = 250
	end
end

function p2.update(dt)
	if love.keyboard.isDown("right") then
		p2.moveX(dt * p2.speed)
	end
	if love.keyboard.isDown("left") then
		p2.moveX(-dt * p2.speed)
	end
	if love.keyboard.isDown("up") then
		p2.moveY(-dt * p2.speed)
	end
	if love.keyboard.isDown("down") then
		p2.moveY(dt * p2.speed)
	end

	if p2.x > t.x and p2.x + 60 < t.x + 70 and p2.y > t.y and p2.y + 60 < t.y + 70 then
		p2.x = love.graphics.getWidth() - 60
		p2.y = 0
		p2.point = p2.point + 1
		p2.time = p2.time - 1
		p2.timer = p2.time
		targetRandom()
	end

	p2.timer = p2.timer - dt
	if p2.timer <= 0 then
		p2.time = p2.time + 0.5
		p2.timer = p2.time
		p2.x = love.graphics.getWidth() - 60
		p2.y = 0
		p2.point = p2.point - 1
		if p2.point <= 0 then p2.point = 0 end
	end

	p2.bounus()
end