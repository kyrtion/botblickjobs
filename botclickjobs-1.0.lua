script_name("BotClick")
script_authors("kyrtion")
script_version('1.0')
script_description("This Script Auto Click Button For Others Job In Paradox RP")

local sampev = require "lib.samp.events"

local scrVersion = '1.0'
local hex = '0xAAADC6'
local prefix = '{AAADC6}[BotClick]: {E8EAED}'

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
    --
    sampAddChatMessage(prefix..'Скрипт загружен | Версия: '..scrVersion, hex)
    print('Script loaded | Version: '..scrVersion)
	sampRegisterChatCommand("botclick",
    function()
        status = not status
        sampAddChatMessage(prefix..''..(status and "Активирован, чтобы выключить введите /botclick" or "Деактивирован, чтобы включить введите /botclick"), hex)
	end)
end

function sampev.onTextDrawSetString(id, text)
    lua_thread.create(
    function()
        if id == 2052 and status then
            --sampAddChatMessage('onTextDrawSetString | id: '..id..' | text: '..text, -1)
            --wait(340)
            if text == "N" then sendButton("N") end
            if text == "Y" then sendButton("Y") end
            if text == "F" then sendButton("F") end                
        end
    end)
end

function sampev.onShowTextDraw(id, data)
    lua_thread.create(
    function()
        if id == 2052 and status then
            --sampAddChatMessage('onShowTextDraw | id: '..id..' | data.text: '..data.text, -1)
            --wait(340)
            if data.text == "N" then sendButton("N") end
        	if data.text == "Y" then sendButton("Y") end
        	if data.text == "F" then sendButton("F") end
        end
    end)
end

function sendButton(VK)
	if VK == "N" then
		lua_thread.create(
			function()
				wait(792)
				setGameKeyState(10, -1)
				setGameKeyState(0, -1)
			end
		)
	elseif VK == "Y" then
		lua_thread.create(
			function()
				wait(681)
				setGameKeyState(11, -1)
				setGameKeyState(0, -1)
			end
		)
	elseif VK == "F" then
		lua_thread.create(
			function()
				wait(718)
				setGameKeyState(15, -1)
				setGameKeyState(0, -1)
			end
		)
	end
end