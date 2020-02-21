if GetLocale() ~= "zhTW" then return end
local L

-----------------
--  Razorgore  --
-----------------
L = DBM:GetModLocalization("Razorgore")

L:SetGeneralLocalization{
	name = "狂野的拉佐格爾"
}
L:SetTimerLocalization{
	TimerAddsSpawn	= "小怪重生"
}
L:SetOptionLocalization{
	TimerAddsSpawn	= "為第一次小怪重生顯示計時器"
}
L:SetMiscLocalization{
	Phase2Emote	= "在寶珠的控制力消失之前逃走。",
	YellPull 	= "入侵者闖進孵化室了！拉響警報！無論如何都要保護蛋！"
}
-------------------
--  Vaelastrasz  --
-------------------
L = DBM:GetModLocalization("Vaelastrasz")

L:SetGeneralLocalization{
	name	= "墮落的瓦拉斯塔茲"
}

L:SetMiscLocalization{
	Event	= "太遲了，朋友"
}
-----------------
--  Broodlord  --
-----------------
L = DBM:GetModLocalization("Broodlord")

L:SetGeneralLocalization{
	name	= "幼龍領主勒西雷爾"
}

L:SetMiscLocalization{
	Pull	= "你們根本不應該在這裡出現！我要殺掉你們！"
}

---------------
--  Firemaw  --
---------------
L = DBM:GetModLocalization("Firemaw")

L:SetGeneralLocalization{
	name = "費爾默"
}

---------------
--  Ebonroc  --
---------------
L = DBM:GetModLocalization("Ebonroc")

L:SetGeneralLocalization{
	name = "埃博諾克"
}

----------------
--  Flamegor  --
----------------
L = DBM:GetModLocalization("Flamegor")

L:SetGeneralLocalization{
	name = "弗萊格爾"
}

------------------
--  Chromaggus  --
------------------
L = DBM:GetModLocalization("Chromaggus")

L:SetGeneralLocalization{
	name = "克洛瑪古斯"
}
L:SetWarningLocalization{
	WarnBreath		= "%s"
}
L:SetTimerLocalization{
	TimerBreathCD	= "%s 冷卻",
	TimerBreath		= "%s 施放",
	TimerVulnCD		= "弱點冷卻"
}
L:SetOptionLocalization{
	WarnBreath		= "為克洛瑪古斯其中一個吐息顯示警告",
	TimerBreathCD	= "顯示吐息冷卻",
	TimerBreath		= "顯示吐息施放",
	TimerVulnCD		= "顯示弱點冷卻"
}
L:SetMiscLocalization{
	Breath1	= "第一次吐息",
	Breath2	= "第二次吐息",
	VulnEmote	= "因皮膚閃著微光而驚訝退縮"
}

----------------
--  Nefarian  --
----------------
L = DBM:GetModLocalization("Nefarian-Classic")

L:SetGeneralLocalization{
	name = "奈法利安"
}
L:SetWarningLocalization{
	WarnAddsLeft		= "剩下 %d 擊殺",
	WarnClassCall		= "%s 點名"
}
L:SetTimerLocalization{
	TimerClassCall		= "%s 點名結束"
}
L:SetOptionLocalization{
	TimerClassCall		= "為職業點名持續時間顯示計時器",
	WarnAddsLeft		= "提示離第二階段開始剩多少擊殺",
	WarnClassCall		= "提示職業點名"
}
L:SetMiscLocalization{
	YellP1		= "讓賽事開始吧！",
	YellP2		= "幹得好",
	YellP3		= "不可能",
	YellShaman	= "薩滿",
	YellPaladin	= "聖騎士",
	YellDruid	= "德魯伊",
	YellPriest	= "牧師",
	YellWarrior	= "戰士",
	YellRogue	= "盜賊",
	YellWarlock	= "術士",
	YellHunter	= "獵人",
	YellMage	= "法師",
	YellDK		= "死亡騎士",
	YellMonk	= "武僧"
}
