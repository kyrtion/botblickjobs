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
    sampAddChatMessage(prefix..'������ �������� | ������: '..scrVersion, hex)
    print('Script loaded | Version: '..scrVersion)

    sampRegisterChatCommand('he', function(arg) sampSendChat('������������, � ��� ������� ���� ������ ������, ��� ��� ���������?', -1) end)

    sampRegisterChatCommand('tip',
    function(arg)
        --head(1)/stomach(2)/hand(3)/dick(4)/throat(5)/tooth(6)/nose(7)
        sampAddChatMessage(prefix..'������� tip ������ ������ (��������: /heal 441 3)', hex)
        sampAddChatMessage(prefix..'������ = 1  |  ����� = 2  |  ����/���� = 3  |  ���.����� = 4  |  ����� = 5  |  ��� = 6  |  ������� = 7', hex)
        --sampAddChatMessage(prefix..'���-2 << ���.����� = 4  |  ����� = 5  |  ��� = 6  |  �������(���) = 7', hex)
    end)
        
    sampRegisterChatCommand('heal', 
    function(arg)
        if arg == nil and arg == '%s*' then
            sampAddChatMessage(prefix..'�����������: /heal [id] [/tip]', hex)
        elseif arg:find('(%d+) (.+)') then
            id, tip = arg:match('(%d+) (.+)')
            if tip == '1' then--������ +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('�� �������� ���� � ������ ��� "���������"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(2000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '2' then--����� +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me �������� ����� ��������')
                    wait(2000)
                    sampSendChat('� ��� ������� �����, � ������ ��� ��������� - "��-���"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '3' then--����/���� +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me �������� ���������� ��������')
                    wait(2000)
                    sampSendChat('� ��� ������� ���� � ��������, � ������ ��� ��������� "��������"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '4' then--����� +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me �������� ���������� ��������')
                    wait(2000)
                    sampSendChat('� ��� ������� ��������, � ������ ��� ��������� "������� ����"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '5' then--����� +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me �������� ���, ������� ����� � �������� ���������')
                    wait(2000)
                    sampSendChat('� ��� ���������� �����, � ������ ��� "��������"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '6' then--��� +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me ������ ������ ����� �� ��� ��������, ��������� ��� ��� � ����� �����������')
                    wait(2000)
                    sampSendChat('� ��� ���������� ����, � ������ ��� "�������"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            elseif tip == '7' then--��� +
                lua_thread.create(
                function()
                    wait(0)
                    sampSendChat('/me ������ ������ ����� � ���� ��������, ���� ����-������� � �����, � �������� � ���')
                    wait(2000)
                    sampSendChat('� ��� �������, � ������ ��� "����"')
                    wait(2000)
                    sampSendChat('��������� ������� ��������� ��� ��� - 50$')
                    wait(2000)
                    sampSendChat('/me ������ ��������� �� ���. �����, ������� ��������� ��������')
                    wait(1000)
                    sampSendChat('/heal '..id)
                    wait(0)
                end)
            else
                sampAddChatMessage(prefix..'�����������: /heal [id] [/tip]', hex)
            end
        else
            sampAddChatMessage(prefix..'�����������: /heal [id] [/tip]', hex)
        end
    end)


end

function sampev.onServerMessage(color, msg)
    --print(color..' | '..msg)
    -- if  (color == 13369599 and msg:find('��������:') and msg:find('���.')) or
    --     (color == 10027263 and msg:find('���������� �������������� ��������� CNN:')) then
    --     print(color, msg)
    --     return false
    -- end
    --print(color, msg)
end