require "player1"
require "player2"
require "powerUps"

t = {
	x = math.random(0 , love.graphics.getWidth() - 70),
	y = math.random(0 , love.graphics.getHeight() - 70)
}

timer = 60

up.load()

function targetRandom()
	t.x = math.random(0 , love.graphics.getWidth() - 70)
	t.y = math.random(0 , love.graphics.getHeight() - 70)
end

function love.update(dt)
	if timer > 0 then
		p1.update(dt)
		p2.update(dt)
		up.update(dt)
		timer = timer - dt
	end
end

function love.draw()
	if timer > 0 then
		--power up
		up.draw()
		--player 1
		love.graphics.setColor(50,0,255,200)
		love.graphics.print("timer: "..p1.timer,10,love.graphics.getHeight()-30)
		love.graphics.print("points: "..p1.point,10,love.graphics.getHeight()-15)
		love.graphics.rectangle("fill",p1.x,p1.y,60,60)
		--player 2
		love.graphics.setColor(255,0,50,200)
		love.graphics.printf(p2.timer.." :timer",10,love.graphics.getHeight()-30,love.graphics.getWidth() - 10,"right")
		love.graphics.printf(p2.point.." :points",10,love.graphics.getHeight()-15,love.graphics.getWidth() - 10,"right")
		love.graphics.rectangle("fill",p2.x,p2.y,60,60)
		--target
		love.graphics.setColor(255,255,255)
		love.graphics.printf(timer,0,10,love.graphics.getWidth(),"center")
		love.graphics.rectangle("line",t.x,t.y,70,70)
	else
		--win screen
		if p1.point > p2.point then
			love.graphics.printf("PLAYER 1 WINS!!!",10,love.graphics.getHeight()-30,love.graphics.getWidth() - 10,"center")
		elseif p1.point == p2.point then
			love.graphics.printf("PLAYER 2 WINS!!!",10,love.graphics.getHeight()-30,love.graphics.getWidth() - 10,"center")
		else
			love.graphics.printf("TIE",10,love.graphics.getHeight()/2,love.graphics.getWidth() - 10,"center")
		end
	end
end