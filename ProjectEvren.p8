pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- main

function _init()
	cls()
	
	p_init()
	
end


function _update()
	p_update()
	
end	


function _draw()
	cls()
	
	p_draw()

end
-->8
-- player

function p_init()	
	p = {
		angle_deg= 0,
		angle = 0/360,
		
		angle_speed =	10/360,
		
		speed=0,
		
		x=63,
		y=63,
		dx=0,
		dy=0,
		
		thrust = 0.9,
		friction = 0.75
	}
end
	
	
function p_update()

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
	
	p.speed = sqrt(p.dx*p.dx+p.dy*p.dy)
	
	p.x += p.dx
	p.y -= p.dy
	
	p.angle_degrees = 360 * p.angle
end
	
	
function p_draw()
		spr(p.sprite, p.x, p.y)
		
		print(p.speed, 1)
		print(p.angle_degrees)
	
end

-->8
-- bodies
-->8
-- gravity
-->8
-- render

function pd_rotate(
																			x,y,
																			rot,
																			mx,my,
																			w,
																			flip1, scale
																		)
			
 scale = scale or 1
 w *= scale * 4


 local cs = cos(rot) * .125 
 																	/ scale
 local ss = sin(rot) * .125 
 																	/ scale
 
 local sx = mx + cs * -w
 local sy = my + ss * -w
 
 local hx = flip1 and -w or w

 local halfw = -w
 
 for py=y-w, y+w do
  tline(
				x-hx,        py, 
				x+hx,        py, 
				sx-ss*halfw, sy+cs*halfw, 
				cs,          ss
		)
  halfw+=1
 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700660066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000600000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000600000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700660066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
