local tela_config = {}
local pos_conf_x = 777

function tela_config.load()
	bac_tel_config = love.graphics.newImage("Imagens/Menu/tela_config.png")
end

function tela_config.draw()
	love.graphics.draw(bac_tel_config,0,0,0,love.graphics.getWidth()/bac_tel_config:getWidth(),love.graphics.getHeight()/bac_tel_config:getHeight(),0,0)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x) / 1366,(love.graphics.getHeight() * 340) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 20) / 768)
  love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x) / 1366,(love.graphics.getHeight() * 436.5) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 20) / 768)
end

function aumenta()
  pos_conf_x = pos_conf_x + 5
end

function diminui()
  pos_conf_x = pos_conf_x - 5
end

function tela_config.andar(key)
  if key == "right" and pos_conf_x < 1105 then 
    aumenta()
  elseif key == "left" and pos_conf_x > 449 then
    diminui()
  end 
end

return tela_config
