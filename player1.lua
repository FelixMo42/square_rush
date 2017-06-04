p1 = {
	x = 0,
	y = 0,
	speed = 200,
	point = 0,
	time = 25,
}

p1.timer = p1.time

function p1.moveX(a)
	p1.x = p1.x + a
end

function p1.moveY(a)
	p1.y = p1.y + a
end

function p1.bounus()
	if p1.point == 20 then
		p1.speed = 250
	end
end

function p1.update(dt)
	if love.keyboard.isDown("d") then
		p1.moveX(dt * p1.speed)
	end
	if love.keyboard.isDown("a") then
		p1.moveX(-dt * p1.speed)
	end
	if love.keyboard.isDown("w") then
		p1.moveY(-dt * p1.speed)
	end
	if love.keyboard.isDown("s") then
		p1.moveY(dt * p1.speed)
	end

	if love.keyboard.isDown("space") then
		p1.x = 0
		p1.y = 0
		p1.point = 0
	end

	if p1.x > t.x and p1.x + 60 < t.x + 70 and p1.y > t.y and p1.y + 60 < t.y + 70 then
		p1.x = 0
		p1.y = 0
		p1.point = p1.point + 1
		p1.time = p1.time - 1
		p1.timer = p1.time
		targetRandom()
	end

	p1.timer = p1.timer - dt
	if p1.timer <= 0 then
		p1.time = p1.time + 0.5
		p1.timer = p1.time
		p1.x = 0
		p1.y = 0
		p1.point = p1.point - 1
		if p1.point <= 0 then p1.point = 0 end
	end

	p1.bounus()
end