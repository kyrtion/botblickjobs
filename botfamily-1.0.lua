script_name("BotFamily")
script_authors("kyrtion")
script_version('1.0')
script_description("This Script Bot For Family In Paradox Rp") --TSBFFIPR
script_properties("work-in-pause")

local sampev = require "lib.samp.events"
local ini = require 'inicfg'

local scrVersion = '1.0'
local hex = '0xAAADC6'
local prefix = '{AAADC6}[BotFamily] {E8EAED}'
local tag = '[BotFamily]'
local directIni = 'moonloader\\config\\botfamily.ini'

local dover1 = 'Eddy_McLaren'
local dover2 = 'Stuart_Ledger'
local myNick = 'Mikhail_Sonnet'

statusRand = false

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
    sampAddChatMessage(prefix..'Скрипт загружен | Версия: '..scrVersion, hex)
    print('Script loaded | Version: '..scrVersion)

    -- sampRegisterChatCommand('check',
    -- function()
    --     sampAddChatMessage(tostring(statusRand), hex)
    -- end)
end

function sampev.onServerMessage(color, msg)

    --print(color..' | '..msg)
    -- -65281 | SMS от Daniel_West, тел: 484716: a
    -- -65281 | SMS к Daniel_West, тел: 484716: -->
    -- -1 | {33AAFF}[Family] Сообщение от руководителя семьи:
    -- if  (color == 13369599 and msg:find('Отправил:') and msg:find('тел.')) or
    --     (color == 10027263 and msg:find('Объявление отредактировал сотрудник CNN:')) then
    --     print(color, msg)
    --     return false
    -- end
    --print(color, msg) --color == -1 and  {33AAFF}


    if color == -1 and msg:find('{33AAFF}[Family] Игрок' and '(%w+_%w+) %[(%d+)%]' and 'вступил в семью') and (not msg:find('zEeKakNp') and (not msg:find('Бот'))) then
        --msg:find('{33AAFF}[Family] Игрок (%w+_%w+) %[(%d+)%] вступил в семью') then --{33AAFF}[Family] Игрок Alexander_Buntin [27] вступил в семью
        nick, id = msg:match('Игрок (%w+_%w+) %[(%d+)%]')
        lua_thread.create(
        function()
            wait(0)
            sampSendChat('/fc '..tag..' Приветствую '..nick..'  •  Чат семьи: /fc [текст]  •  discord.gg/zEeKakNp')
            wait(1000)
        end)
        

    elseif color == -1 and msg:find('{33AAFF}[Family]' and '(%w+_%w+) %[(%d+)%] пожертвовал' and 'на баланс семьи') and (not msg:find('zEeKakNp')) and (not msg:find('Бот')) then
        --{33AAFF}[Family] Страж Donald_Derrian [120] пожертвовал {33CC66}$1000{33AAFF} на баланс семьи
        nick, id = msg:match('(%w+_%w+) %[(%d+)%] пожертвовал')
        lua_thread.create(
        function()
            wait(0)
            sampSendChat('/fc '..tag..' '..nick..', спасибо за поддержку <3')
            wait(1000)
        end)

    
    -- -1 На банковском счете: {33CC66}5000$
    elseif color == -1 and msg:find('На банковском счете: {33CC66}') and (not msg:find('Бот')) then
        lua_thread.create(
        function()
            wait(0)
            sampSendChat('/fc '..tag..' '..msg)
            wait(1000)
        end)


    elseif color == -1 and msg:find('%{33AAFF}%[Family%] Сообщение от руководителя семьи') then
        lua_thread.create(
        function()
            wait(3000)
            sampSendChat('/fc '..tag..' Активирован')
            wait(1000)
        end)
    end


    -- cmd
    if (color == -1) and (msg:find(dover1) or msg:find(dover2) or msg:find(myNick)) then
        if msg:find('!капча (%d+)') then
            sec = msg:match('!капча (%d+)')
            lua_thread.create(
            function()
                if msg:find(myNick) and (not msg:find('BotFamily')) then
                    wait(1000)
                else
                    wait(0)
                end
                sampSendChat('/fc '..tag..' Капча начнется через '..sec..' сек')
                wait( 1000*(tonumber(sec)) )
                math.randomseed(os.time())
                rand = math.random(100000, 999999)
                statusRand = true
                sampSendChat('/fc '..tag..' Введите >> '..tostring(rand)..' << чтобы стать первым!')
            end)
        end
    end

    if msg:find(myNick) and msg:find('!vig (%d+) (.*)') then
        nickGive = msg:match('(%w+_%w+)')
        id, reason = msg:match('!vig (%d+) (.*)')
        lua_thread.create(
        function()
            if msg:find(myNick) and (not msg:find('BotFamily')) then
                wait(1000)
            else
                wait(0)
            end
            sampSendChat(tag..' '..nickGive..' выдал выговор ')
            wait(500)
        end)
    end

    if statusRand == true then
        if msg:find('(%w+_%w+) %[(%d+)%]: '..rand) and (statusRand == true)and (not msg:find('BotFamily')) then
            nick, id = msg:match('(%w+_%w+) %[(%d+)%]')
            lua_thread.create(
            function()
                wait(0)
                sampSendChat('/fc [BotFamily] Игрок '..nick..' ['..id..'] выиграл!')--Капча >> '..rand..'
                statusRand = false
            end)
        end
    end

    -- if color == -1 and msg:find('{33AAFF}[FC] ' and '(%w+_%w+) %[(%d+)%]') and (not msg:find('zEeKakNp')) then
    --     lua_thread.create(
    --     function()
    --         wait(0)
    --         nick, id = msg:match('(%w+_%w+) %[(%d+)%]')
    --         sampAddChatMessage('>> /fc Приветствую '..nick..' | /fc - чат семьи | Discord: zEeKakNp', hex)
    --     end)
    -- end
end





