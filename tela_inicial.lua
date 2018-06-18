local tela_inicial = {}

function tela_inicial.load()
  bac_tel_inic = love.graphics.newImage("Imagens/Menu/tela_inicial.png")
  music_menu_inicial = love.audio.newSource("music/menu.mp3", "stream")
  obj = {{x = (love.graphics.getWidth() * 143)/1366, y = (love.graphics.getHeight() * 345)/768, w = (love.graphics.getWidth() * 178)/1366, h = (love.graphics.getHeight() * 370)/768, acao = function() love.event.quit() end},
		 {x = (love.graphics.getWidth() * 502)/1366, y = (love.graphics.getHeight() * 433)/768, w = (love.graphics.getWidth() * 250)/1366, h = (love.graphics.getHeight() * 282)/768, acao = function() switch_menu(2,getSt()) end},
		 tm = 2}
end

function tela_inicial.getObj()
  return obj
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
  love.graphics.rectangle("fill",obj[2].x,obj[2].y,obj[2].w,obj[2].h)
end

return tela_inicial
