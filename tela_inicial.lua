local tela_inicial = {}
local obj

function tela_inicial.load()
  bac_tel_inic = love.graphics.newImage("Imagens/Menu/tela_inicial.png")
  music_menu_inicial = love.audio.newSource("music/menu.mp3", "stream")
  obj = {tm = 3,{x = cons_w * 143 ,y = cons_h * 345,w = cons_w * 178,h = cons_h * 370,acao = function() love.event.quit()      end},                {x = cons_w * 502 ,y = cons_h * 433,w = cons_w * 250,h = cons_h * 282,acao = function() o_menu = getSt() switch_menu(2,getSt()) end},
                {x = cons_w * 1000,y = cons_h * 433,w = cons_w * 250,h = cons_h * 282,acao = function() switch_menu(4,getSt()) setX(cons_w* 950) end}}
	       
end

function tela_inicial.coli(key,per)
  if key == "return" then
    for i = 1,obj.tm,1 do
			if col.retangulo_retangulo(obj[i],per) then obj[i].acao() end
    end
  end  
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
end

return tela_inicial
