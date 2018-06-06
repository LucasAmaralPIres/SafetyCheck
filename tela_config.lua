local tela_config = {}
local pos_conf_x = 837.5
local vol = 0.5

function tela_config.load()
	bac_tel_config = love.graphics.newImage("Imagens/Menu/tela_config.png")
  volume = music_menu_inicial:setVolume(0.5)
end

function tela_config.draw()
  love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(bac_tel_config,0,0,0,love.graphics.getWidth()/bac_tel_config:getWidth(),love.graphics.getHeight()/bac_tel_config:getHeight(),0,0)
  if selecionado == 1 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x) / 1366,(love.graphics.getHeight() * 419) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x) / 1366,(love.graphics.getHeight() * 516.5) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
  elseif selecionado == 2 then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x) / 1366,(love.graphics.getHeight() * 419) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x) / 1366,(love.graphics.getHeight() * 516.5) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
  end
  end
function aumenta()
  pos_conf_x = pos_conf_x + 5
  volume = music_menu_inicial:setVolume(calcula_volume())
end

function diminui()
  pos_conf_x = pos_conf_x - 5
  volume = music_menu_inicial:setVolume(calcula_volume())
end

function tela_config.andar(key)
  if key == "right" and pos_conf_x < 1162 then 
    aumenta()
  elseif key == "left" and pos_conf_x > 512 then
    diminui()
  end 
end

function calcula_volume()
  vol = (pos_conf_x - 510) / 655
  return vol
end

function tela_config.play_musica()
  love.audio.play(music_menu_inicial)
	music_menu_inicial:setLooping(true)
end

function tela_config.stop_musica()
end

return tela_config
