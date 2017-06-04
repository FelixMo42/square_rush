up = {
	x = 0,
	y = 0
}

up.powers = {
	function() end,
	function(p)
		p.x = math.random(0,love.graphics.getWidth()-60)
		p.y = math.random(0,love.graphics.getHeight()-60)
	end,
	function(p)
		p.point = p.point + 0.5
	end,
	function(p)
		p.speed = p.speed + 10
	end,
	function(p)
		p.speed = p.speed - 10
	end,
	function(p)
		p.x = math.random(0,love.graphics.getWidth()-60)
		p.y = p.y + 25
	end
}

function up.load()
	up.x = math.random(0,love.graphics.getWidth()-10)
	up.y = math.random(0,love.graphics.getHeight()-10)
end

function up.update(dt)
	if up.x > p1.x and up.y > p1.y and up.x + 10 < p1.x + 60 and up.y + 10 < p1.y + 60 then
		up.power(p1)
		up.load()
	end
	if up.x > p2.x and up.y > p2.y and up.x + 10 < p2.x + 60 and up.y + 10 < p2.y + 60 then
		up.power(p2)
		up.load()
	end
end

function up.draw()
	love.graphics.rectangle("fill",up.x,up.y,10,10)
end

function up.power(p)
	up.powers[ math.random(1,#up.powers) ](p)
end