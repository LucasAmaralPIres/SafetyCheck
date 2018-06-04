local tela_inicial = {}

function tela_inicial.load()
	bac_tel_inic = love.graphics.newImage("Imagens/Menu/tela_inicial.png")
	music_menu_inicial = love.audio.newSource("music/menu.mp3", "stream")
end

function tela_inicial.play_musica()
 	love.audio.play(music_menu_inicial)
	music_menu_inicial:setLooping(true)
end

function tela_inicial.stop_musica()
  love.audio.stop(music_menu_inicial)
end

function tela_inicial.draw()
	love.graphics.draw(bac_tel_inic,0,0,0,love.graphics.getWidth()/bac_tel_inic:getWidth(),love.graphics.getHeight()/bac_tel_inic:getHeight(),0,0)
end

return tela_inicial
