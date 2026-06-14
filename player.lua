
function plr_init()	
	p = {
		angle_deg= 0,
		angle = 0/360,
		
		angle_speed =	6/360,
		
		speed=0,
		
		x=63,
		y=63,
		dx=0,
		dy=0,
		
		thrust = 0.3,
		friction = 0.8
	}
end
	
	
function plr_update()
	
	if btn(⬆️) then
		p.dx += cos(p.angle) * p.thrust     
		p.dy += sin(p.angle) * p.thrust
	end
	
	if btn(⬅️) then
		p.angle -= p.angle_speed
	end  
	 
	if btn(➡️) then
		p.angle += p.angle_speed
	end
	 
	if (p.angle>1) p.angle=0
	if (p.angle<0) p.angle=1
	
	
	p.dx *= p.friction
	p.dy *= p.friction
	
	p.x += p.dx
	p.y -= p.dy
	
	p.speed = sqrt(p.dx^2 + p.dy^2)
	p.angle_degrees = 360 * p.angle
end
	
	
function plr_draw()
		spr(1, p.x, p.y)
		
end



function trail_init()
	trail = {}
	colors = {7,10,9,5}	
end


function trail_update()

	if btn(⬆️) then
		add(trail, {
			x = p.x + 4,
			y = p.y + 4,
			l = 4,
			c = 0,
			r = 0
		})
	end
	
	for part in all(trail) do
		--increase divider
		--to increase n of trail
		part.l -= 1/ 1
		
		part.r += rnd(1)
		if (part.r>2) part.r = 2
		
		part.c += 1
		if (part.c>4) part.c = 4
		
		--leave a trace
		--by inverting ship speed
		if btn(⬆️) then
			part.x -= p.dx
			part.y += p.dy 
		end
		
		if (part.l < 0)	del(trail, part)
	end
	
end


function trail_draw()
	for part in all(trail) do
		circfill(part.x, part.y, part.r, colors[part.c])
	end
end