script_name("MCHelper")
script_authors("kyrtion")
script_version('1.0')
script_description("This Script Helper For Medic Center Paradox RP")
script_properties("work-in-pause")

local sampev = require "lib.samp.events"

--scrName = '[Helper]'
local scrVersion = '1.0'
local hex = '0xEAADC6'
local prefix = '{EAADC6}[MCHelper] {F8EAED}'
--local directIni = 'moonloader\\config\\mchelper.ini'

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
    sampAddChatMessage(prefix..'Скрипт загружен | Версия: '..scrVersion, hex)
    print('Script loaded | Version: '..scrVersion)

    sampRegisterChatCommand('he', function(arg) sampSendChat('Здравствуйте, я Ваш лечащий врач Михаил Соннет, что вас беспокоит?', -1) end)

    sampRegisterChatCommand('tip',
    function(arg)
        --head(1)/stomach(2)/hand(3)/dick(4)/throat(5)/tooth(6)/nose(7)
        sampAddChatMessage(prefix..'Укажите tip только цифрой (например: /heal 441 3)', hex)
        sampAddChatMessage(prefix..'Голова = 1  |  Живот = 2  |  Рука/нога = 3  |  Пол.орган = 4  |  Горло = 5  |  Зуб = 6  |  Насморк = 7', hex)
        --sampAddChatMessage(prefix..'ТИП-2 << Пол.орган = 4  |  Горло = 5  |  Зуб = 6  |  Насморк(нос) = 7', hex)
    end)
        
    sampRegisterChatCommand('heal', 
    function(arg)
        if arg == nil and arg == '%s*' then
            sampAddChatMessage(prefix..'Используйте: /heal [id] [/tip]', hex)
        elseif arg:find('(%d+) (.+)') then
            id, tip = arg:match('(%d+) (.+)')
            if tip == '1' then--голова +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('От головной боли я выпишу Вам "Ибупрофен"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(2000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '2' then--живот +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me прощупал живот пациента')
                    wait(2000)
                    sampSendChat('У Вас обычный спазм, я выпишу Вам лекарство - "Но-шпа"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '3' then--рука/нога +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me осмотрел конечность пациента')
                    wait(2000)
                    sampSendChat('У Вас обычная боль в суставах, я выпишу Вам лекарство "Финалгон"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '4' then--орган +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me осмотрел конечность пациента')
                    wait(2000)
                    sampSendChat('У Вас аденома простаты, я выпишу Вам лекарство "Золотой конёк"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '5' then--горло +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me осмотрел рот, раскрыл горло и осмотрел горловину')
                    wait(2000)
                    sampSendChat('У Вас воспаление горла, я выпишу Вам "Лизобакт"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '6' then--зуб +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me нагнул голову ближе ко рту пациента, приоткрыл его рот и начал осматривать')
                    wait(2000)
                    sampSendChat('У Вас воспаление дёсна, я выпишу Вам "Нимесил"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '7' then--нос +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me нагнув голову ближе к носу пациента, снял мини-фонарик с пояса, и посветил в нос')
                    wait(2000)
                    sampSendChat('У Вас насморк, я выпишу Вам "Снуп"')
                    wait(2000)
                    sampSendChat('Стоимость данного лекарства для Вас - 50$')
                    wait(2000)
                    sampSendChat('/me достав лекарство из мед. сумки, передал лекарство пациенту')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            else
                sampAddChatMessage(prefix..'Используйте: /heal [id] [/tip]', hex)
            end
        else
            sampAddChatMessage(prefix..'Используйте: /heal [id] [/tip]', hex)
        end
    end)


end

function sampev.onServerMessage(color, msg)
    --print(color..' | '..msg)
    -- if  (color == 13369599 and msg:find('Отправил:') and msg:find('тел.')) or
    --     (color == 10027263 and msg:find('Объявление отредактировал сотрудник CNN:')) then
    --     print(color, msg)
    --     return false
    -- end
    --print(color, msg)
end