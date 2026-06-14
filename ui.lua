
function ui_init()
	camx = p.x-64
	camy = p.y-64
	
	sel_item = 1
	clr_selected = 11
	clr_unselected = 5
	
	main_menu = {
		"new", 
		"continue",
		"options"
	}
	
	z_menu = {
		"switch engine mode",
		"stellar map",
		"options",
		"save",
		"exit to menu"
	}
	
	options = {
		"mini map",
		"stellar map",
		"orbit prediction"
	}
end


function ui_update()
	camx = p.x-64
	camy = p.y-64
	
	--if  then --more code
		
	--end
	
end


function ui_draw()
	camera(camx, camy)
	map(0, 0, 0, 0, 128, 128)
	
	
	print(p.angle_degrees, camx + 8, camy + 8, 10)
end