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
    sampAddChatMessage(prefix..'������ �������� | ������: '..scrVersion, hex)
    print('Script loaded | Version: '..scrVersion)

    -- sampRegisterChatCommand('check',
    -- function()
    --     sampAddChatMessage(tostring(statusRand), hex)
    -- end)
end

function sampev.onServerMessage(color, msg)

    --print(color..' | '..msg)
    -- -65281 | SMS �� Daniel_West, ���: 484716: a
    -- -65281 | SMS � Daniel_West, ���: 484716: -->
    -- -1 | {33AAFF}[Family] ��������� �� ������������ �����:
    -- if  (color == 13369599 and msg:find('��������:') and msg:find('���.')) or
    --     (color == 10027263 and msg:find('���������� �������������� ��������� CNN:')) then
    --     print(color, msg)
    --     return false
    -- end
    --print(color, msg) --color == -1 and  {33AAFF}


    if color == -1 and msg:find('{33AAFF}[Family] �����' and '(%w+_%w+) %[(%d+)%]' and '������� � �����') and (not msg:find('zEeKakNp') and (not msg:find('���'))) then
        --msg:find('{33AAFF}[Family] ����� (%w+_%w+) %[(%d+)%] ������� � �����') then --{33AAFF}[Family] ����� Alexander_Buntin [27] ������� � �����
        nick, id = msg:match('����� (%w+_%w+) %[(%d+)%]')
        lua_thread.create(
        function()
            wait(0)
            sampSendChat('/fc '..tag..' ����������� '..nick..'  �  ��� �����: /fc [�����]  �  discord.gg/zEeKakNp')
            wait(1000)
        end)
        

    elseif color == -1 and msg:find('{33AAFF}[Family]' and '(%w+_%w+) %[(%d+)%] �����������' and '�� ������ �����') and (not msg:find('zEeKakNp')) and (not msg:find('���')) then
        --{33AAFF}[Family] ����� Donald_Derrian [120] ����������� {33CC66}$1000{33AAFF} �� ������ �����
        nick, id = msg:match('(%w+_%w+) %[(%d+)%] �����������')
        lua_thread.create(
        function()
            wait(0)
            sampSendChat('/fc '..tag..' '..nick..', ������� �� ��������� <3')
            wait(1000)
        end)

    
    -- -1 �� ���������� �����: {33CC66}5000$
    elseif color == -1 and msg:find('�� ���������� �����: {33CC66}') and (not msg:find('���')) then
        lua_thread.create(
        function()
            wait(0)
            sampSendChat('/fc '..tag..' '..msg)
            wait(1000)
        end)


    elseif color == -1 and msg:find('%{33AAFF}%[Family%] ��������� �� ������������ �����') then
        lua_thread.create(
        function()
            wait(3000)
            sampSendChat('/fc '..tag..' �����������')
            wait(1000)
        end)
    end


    -- cmd
    if (color == -1) and (msg:find(dover1) or msg:find(dover2) or msg:find(myNick)) then
        if msg:find('!����� (%d+)') then
            sec = msg:match('!����� (%d+)')
            lua_thread.create(
            function()
                if msg:find(myNick) and (not msg:find('BotFamily')) then
                    wait(1000)
                else
                    wait(0)
                end
                sampSendChat('/fc '..tag..' ����� �������� ����� '..sec..' ���')
                wait( 1000*(tonumber(sec)) )
                math.randomseed(os.time())
                rand = math.random(100000, 999999)
                statusRand = true
                sampSendChat('/fc '..tag..' ������� >> '..tostring(rand)..' << ����� ����� ������!')
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
            sampSendChat(tag..' '..nickGive..' ����� ������� ')
            wait(500)
        end)
    end

    if statusRand == true then
        if msg:find('(%w+_%w+) %[(%d+)%]: '..rand) and (statusRand == true)and (not msg:find('BotFamily')) then
            nick, id = msg:match('(%w+_%w+) %[(%d+)%]')
            lua_thread.create(
            function()
                wait(0)
                sampSendChat('/fc [BotFamily] ����� '..nick..' ['..id..'] �������!')--����� >> '..rand..'
                statusRand = false
            end)
        end
    end

    -- if color == -1 and msg:find('{33AAFF}[FC] ' and '(%w+_%w+) %[(%d+)%]') and (not msg:find('zEeKakNp')) then
    --     lua_thread.create(
    --     function()
    --         wait(0)
    --         nick, id = msg:match('(%w+_%w+) %[(%d+)%]')
    --         sampAddChatMessage('>> /fc ����������� '..nick..' | /fc - ��� ����� | Discord: zEeKakNp', hex)
    --     end)
    -- end
end





