local tela_inicial = {}

function tela_inicial.load()
	bac_tel_inic = love.graphics.newImage("Imagens/Menu/tela_inicial.png")
	music_menu = love.audio.newSource("music/menu.mp3", "stream")
	love.audio.play(music_menu)
	music_menu:setLooping(true)
  volume = music_menu:setVolume(0.5)
end

function tela_inicial.draw()
	love.graphics.draw(bac_tel_inic,0,0,0,love.graphics.getWidth()/bac_tel_inic:getWidth(),love.graphics.getHeight()/bac_tel_inic:getHeight(),0,0)
end

return tela_inicial
