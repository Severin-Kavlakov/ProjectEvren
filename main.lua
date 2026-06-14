function _init()
	cls()
	opn_main_menu=true
	
	if opn_main_menu == true then
		
	else
		plr_init()
		trail_init()
		ui_init()
	end
end


function _update()
	plr_update()
	trail_update()
	ui_update()
end	


function _draw()
	cls()

	plr_draw()
	ui_draw()
	trail_draw()
end