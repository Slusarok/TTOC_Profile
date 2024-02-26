local Bot = TTOCInitScript("自定义打怪模板1029")
local Log = Bot.Log
local UI = Bot.UI
local Config = Bot.Config
local TTOC = ...
--SC为了安全可以自定义,比如BABA = TTOC ,比如YEYE = TTOC ,然后更换SC为你自定义的名字!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SC = TTOC
   
local text = {
      {Log='Info',Text="初始化战斗循环"},
      {If = "SC:GetPlayer().Class=='MAGE'",End = '法师不售卖' },
      {Settings = 'DoNotSellList', value = {'Rune of','传送','Hearthstone','炉石','Mining Pick','矿工锄','Skinning Knife','剥皮小刀','Primal','源生','Mote of','微粒','Air','空气','基尔加丹印记',"Mark of Kil'jaeden","Thieves'Tools",'潜行者工具','Flash Powder','闪光粉'}},
      {End = "法师不售卖"},

      {If = "SC:GetPlayer().Class == 'ROGUE' or SC:GetPlayer().Class == 'WARRIOR'",End = '近战不售卖' },
      {Settings = 'DoNotSellList', value = {'Rune of','传送','Hearthstone','炉石','Skinning Knife','剥皮小刀','Mining Pick','矿工锄','Primal','源生','Mote of','微粒','Air','空气','基尔加丹印记',"Mark of Kil'jaeden","Thieves'Tools",'潜行者工具','Flash Powder','闪光粉','Smoked Talbuk Venison','熏烤塔布羊排','Roasted Quail','烤鹌鹑','Bladespire Bagel','刀塔面圈','Clefthoof Ribs','裂蹄肋排','Homemade Cherry Pie','自制樱桃馅饼',"Mag'har Grainbread",'玛格汉面包',}},
      --售卖
      --{Settings = 'ForceSellList', value = {'亚麻布','毛料','丝绸','魔纹布','符文布','Linen Cloth','Wool Cloth','Silk Cloth','Mageweave Cloth','Runecloth'}},
      {End = "近战不售卖"},

      {If = "SC:GetPlayer().Class == 'SHAMAN' or SC:GetPlayer().Class == 'PRIEST' or SC:GetPlayer().Class == 'HUNTER' or SC:GetPlayer().Class == 'DRUID' or SC:GetPlayer().Class == 'PALADIN' or SC:GetPlayer().Class == 'WARLOCK'",End = '有蓝职业不售卖' },
      {Settings = 'DoNotSellList', value = {'Rune of','传送','Hearthstone','炉石','Skinning Knife','剥皮小刀','Mining Pick','矿工锄','Primal','源生','Mote of','微粒','Air','空气','基尔加丹印记',"Mark of Kil'jaeden",'Smoked Talbuk Venison','熏烤塔布羊排','Roasted Quail','烤鹌鹑','Bladespire Bagel','刀塔面圈','Clefthoof Ribs','裂蹄肋排','Homemade Cherry Pie','自制樱桃馅饼',"Mag'har Grainbread",'玛格汉面包',}},
      --售卖
      --{Settings = 'ForceSellList', value = {'亚麻布','毛料','丝绸','魔纹布','符文布','Linen Cloth','Wool Cloth','Silk Cloth','Mageweave Cloth','Runecloth',}},
      {End = "有蓝职业不售卖"},

      {If = "SC:GetPlayer().Class == 'HUNTER'", End = '猎人恢复设置'},
      --恢复生命值范围
      {Settings = 'FoodPercent', value = {70,85 ,}},
      --恢复法力值范围
      {Settings = 'DrinkPercent', value = {10 ,40 ,}},
      {End = '猎人恢复设置'},
      
      {If = "SC:GetPlayer().Class == 'ROGUE' or SC:GetPlayer().Class == 'WARRIOR'", End = '战士盗贼恢复设置'},
      --恢复生命值范围
      {Settings = 'FoodPercent', value = {70 ,90 ,}},
      --恢复法力值范围
      {Settings = 'DrinkPercent', value = {0 ,0 ,}},
      {End = '战士盗贼恢复设置'},

      {If = "SC:GetPlayer().Level < 58 and SC:GetPlayer().Class == 'SHAMAN' or SC:GetPlayer().Class == 'PRIEST' or SC:GetPlayer().Class == 'HUNTER' or SC:GetPlayer().Class == 'DRUID' or SC:GetPlayer().Class == 'PALADIN' or SC:GetPlayer().Class == 'WARLOCK'", End = '有蓝职业恢复设置'},
      --恢复生命值范围
      {Settings = 'FoodPercent', value = {70,85 ,}},
      --恢复法力值范围
      {Settings = 'DrinkPercent', value = {50 ,85 ,}},
      {End = '有蓝职业恢复设置'},

      {If = "SC:GetPlayer().Level >= 58 and SC:GetPlayer().Class == 'SHAMAN' or SC:GetPlayer().Class == 'PRIEST' or SC:GetPlayer().Class == 'HUNTER' or SC:GetPlayer().Class == 'DRUID' or SC:GetPlayer().Class == 'PALADIN' or SC:GetPlayer().Class == 'WARLOCK'", End = '有蓝职业恢复设置1'},
      --恢复生命值范围
      {Settings = 'FoodPercent', value = {70,85 ,}},
      --恢复法力值范围
      {Settings = 'DrinkPercent', value = {50 ,85 ,}},
      {End = '有蓝职业恢复设置1'},

      {If = "SC:GetPlayer().Level < 15 and SC:GetPlayer().Class == 'WARLOCK'", End = '术士职业恢复设置'},
      --恢复生命值范围
      {Settings = 'FoodPercent', value = {70,85 ,}},
      --恢复法力值范围
      {Settings = 'DrinkPercent', value = {50 ,85 ,}},
      {End = '术士职业恢复设置'},

      {If = "SC:GetPlayer().Level >= 15 and SC:GetPlayer().Class == 'WARLOCK'", End = '术士职业恢复设置1'},
      --恢复生命值范围
      {Settings = 'FoodPercent', value = {70,85 ,}},
      --恢复法力值范围
      {Settings = 'DrinkPercent', value = {50 ,85 ,}},
      {End = '术士职业恢复设置1'},

      {If = "SC:GetPlayer().PetActive == true", End = '设置宠物为被动型'},
      {Run = 'print("设置宠物为被动型")' },
      {Run = 'PetPassiveMode()' },
      {End = '设置宠物为被动型'},

      --如果我是法师的初始化
      {If = "SC:GetPlayer().Class=='MAGE'", End = 0},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化法师战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['奥术智慧'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冰甲术/霜甲术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['熔岩护甲'] = false"},
            {Run = "DMW.Settings.profile.Rotation['魔甲术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['魔法抑制'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法术反制'] = true"},
            {Run = "DMW.Settings.profile.Rotation['寒冰护体'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法力护盾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['生命低于'] = 20"},
            {Run = "DMW.Settings.profile.Rotation['智能拉怪'] = 2"},
            {If = "SC:GetPlayer().Level >= 4", End = 30},
            {Run = "DMW.Settings.profile.Rotation['寒冰箭'] = true"},
            {Run = "DMW.Settings.profile.Rotation['大火球'] = false"},
            {End = 30},
            {If = "SC:GetPlayer().Level < 4", End = 31},
            {Run = "DMW.Settings.profile.Rotation['寒冰箭'] = false"},
            {Run = "DMW.Settings.profile.Rotation['大火球'] = true"},
            {End = 31},
            {Run = "DMW.Settings.profile.Rotation['炎爆术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['召唤水元素'] = true"},
            {Run = "DMW.Settings.profile.Rotation['火焰冲击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冲击波'] = false"},
            {Run = "DMW.Settings.profile.Rotation['燃烧'] = false"},
            {Run = "DMW.Settings.profile.Rotation['灼烧'] = false"},
            {Run = "DMW.Settings.profile.Rotation['冰霜新星'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冰霜新星时后退'] = true"},
            {Run = "DMW.Settings.profile.Rotation['水元素冰霜新星'] = true"},
            {Run = "DMW.Settings.profile.Rotation['宠物自动攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['让宠物自动攻击目标'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冰锥术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['龙息术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['冰枪术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['奥术飞弹'] = false"},
            {Run = "DMW.Settings.profile.Rotation['急速冷却'] = false"},
            {Run = "DMW.Settings.profile.Rotation['急速冷却生命低于'] = 45"},
            {Run = "DMW.Settings.profile.Rotation['冰冷血脉'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冰冷血脉生命低于'] = 90"},
            {Run = "DMW.Settings.profile.Rotation['造水术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['造食术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['唤醒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['唤醒法力值百分比'] = 35"},
            {Run = "DMW.Settings.profile.Rotation['解除次级诅咒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['变形术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['使用法术石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制造法力石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法术石法力值'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['法力分流法力值百分比'] = 80"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0},

      --如果我是盗贼的初始化
      {If = "SC:GetPlayer().Class=='ROGUE'", End = 0.5},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化盗贼战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['自动攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['脚踢'] = true"},
            {Run = "DMW.Settings.profile.Rotation['取消攻击后摇'] = true"},
            {Run = "DMW.Settings.profile.Rotation['邪恶攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['毒刃'] = false"},
            {Run = "DMW.Settings.profile.Rotation['剔骨'] = true"},
            {Run = "DMW.Settings.profile.Rotation['切割'] = true"},
            {Run = "DMW.Settings.profile.Rotation['剑刃乱舞'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冲动'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['开怪模式'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['战斗剑PVE'] = true"},
            {Run = "DMW.Settings.profile.Rotation['菊花茶'] = false"},
            {Run = "DMW.Settings.profile.Rotation['无限晕锁'] = false"},
            {Run = "DMW.Settings.profile.Rotation['消失'] = true"},
            {Run = "DMW.Settings.profile.Rotation['闪避'] = true"},
            {Run = "DMW.Settings.profile.Rotation['开启闪避的血量百分比'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['疾跑'] = true"},
            {Log='Info',Text="初始化完成"},
      {End = 0.5},

      --如果我是猎人的初始化
      {If = "SC:GetPlayer().Class=='HUNTER'", End = 0.6},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化猎人战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['自动攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['目标是宠物时拉开距离'] = true"},
            {Run = "DMW.Settings.profile.Rotation['自动雄鹰守护'] = true"},
            {Run = "DMW.Settings.profile.Rotation['自动灵猴守护'] = true"},
            {Run = "DMW.Settings.profile.Rotation['多重射击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['奥术射击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['猎人印记'] = true"},
            {Run = "DMW.Settings.profile.Rotation['急速射击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['瞄准射击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['稳固射击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['逃脱'] = true"},
            {Run = "DMW.Settings.profile.Rotation['假死'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂野怒火'] = true"},
            {Run = "DMW.Settings.profile.Rotation['猛禽一击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['猫鼬撕咬'] = true"},
            {Run = "DMW.Settings.profile.Rotation['摔绊'] = false"},
            {Run = "DMW.Settings.profile.Rotation['杀戮命令'] = true"},
            {Run = "DMW.Settings.profile.Rotation['毒蛇钉刺'] = false"},
            {Run = "DMW.Settings.profile.Rotation['宠物自动攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['召唤宠物'] = true"},
            {Run = "DMW.Settings.profile.Rotation['复活宠物'] = true"},
            {Run = "DMW.Settings.profile.Rotation['胁迫'] = true"},
            {Run = "DMW.Settings.profile.Rotation['宠物嘲讽'] = true"},
            {Run = "DMW.Settings.profile.Rotation['治疗宠物'] = true"},
            {Run = "DMW.Settings.profile.Rotation['治疗宠物生命百分比'] = 50"},
            {Log='Info',Text="初始化完成"},
      {End = 0.6},

      --如果我是牧师的初始化
      {If = "SC:GetPlayer().Class=='PRIEST'", End = 0.7},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化牧师战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['开启DPS'] = true"},
            {Run = "DMW.Settings.profile.Rotation['优先攻击最后敌人'] = true"},
            {Run = "DMW.Settings.profile.Rotation['开怪前上盾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['使用[暗言术：痛]拉怪'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗言术：痛'] = true"},
            {Run = "DMW.Settings.profile.Rotation['沉默'] = true"},
            {Run = "DMW.Settings.profile.Rotation['精神鞭笞'] = true"},
            {Run = "DMW.Settings.profile.Rotation['精神鞭笞法力值百分比'] = 10"},
            {If = "SC:GetPlayer().Level < 10", End = 30},
            {Run = "DMW.Settings.profile.Rotation['惩击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['惩击法力值百分比'] = 10"},
            {Run = "DMW.Settings.profile.Rotation['心灵震爆'] = false"},
            {Run = "DMW.Settings.profile.Rotation['心灵震爆法力值百分比'] = 10"},
            {End = 30},
            {If = "SC:GetPlayer().Level >= 10", End = '大于十关惩击'},
            {Run = "DMW.Settings.profile.Rotation['惩击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['惩击法力值百分比'] = 10"},
            {Run = "DMW.Settings.profile.Rotation['心灵震爆'] = true"},
            {Run = "DMW.Settings.profile.Rotation['心灵震爆法力值百分比'] = 10"},
            {End = '大于十关惩击'},
            {Run = "DMW.Settings.profile.Rotation['心灵尖啸'] = true"},
            {Run = "DMW.Settings.profile.Rotation['心灵尖啸人数'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['吸血鬼的拥抱'] = true"},
            {Run = "DMW.Settings.profile.Rotation['吸血鬼之触'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗影恶魔'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗言术灭击杀'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗言术灭击杀死亡时间'] = 4"},
            {Run = "DMW.Settings.profile.Rotation['绝望祷言'] = false"},
            {Run = "DMW.Settings.profile.Rotation['心灵尖啸人数'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['心灵之火'] = true"},
            {Run = "DMW.Settings.profile.Rotation['祛病术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['驱散魔法'] = false"},
            {Run = "DMW.Settings.profile.Rotation['暗影守卫'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗影形态'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗影形态生命百分比'] = 21"},
            {Run = "DMW.Settings.profile.Rotation['清除暗影形态'] = 20"},
            {Run = "DMW.Settings.profile.Rotation['快速治疗'] = true"},
            {Run = "DMW.Settings.profile.Rotation['快速治疗百分比'] = 20"},
            {Run = "DMW.Settings.profile.Rotation['真言术：盾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['真言术：盾百分比'] = 85"},
            {Run = "DMW.Settings.profile.Rotation['恢复'] = true"},
            {Run = "DMW.Settings.profile.Rotation['恢复百分比'] = 85"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 真言术：韧'] = true"},
            {Run = "DMW.Settings.profile.Rotation['使用法术石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制造法力石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法术石法力值'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['法力分流法力值百分比'] = 80"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0.7},

      --如果我是术士的初始化
      {If = "SC:GetPlayer().Class=='WARLOCK'", End = 0.8},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化术士战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['自动Buff'] = true"},
            {Run = "DMW.Settings.profile.Rotation['邪甲术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['制造治疗石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制造灵魂石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['绑定灵魂石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['生命分流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['战斗中不使用生命分流'] = false"},
            {Run = "DMW.Settings.profile.Rotation['生命分流法力值'] = 70"},
            {Run = "DMW.Settings.profile.Rotation['生命分流生命值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['有仇恨不使用生命分流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['指定召唤宠物'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['恶魔支配指定召唤'] = false"},
            {Run = "DMW.Settings.profile.Rotation['智能召唤宠物'] = true"},
            {Run = "DMW.Settings.profile.Rotation['恶魔支配智能召唤'] = true"},
            {Run = "DMW.Settings.profile.Rotation['黑暗契约'] = false"},
            {Run = "DMW.Settings.profile.Rotation['战斗中不使用黑暗契约'] = false"},
            {Run = "DMW.Settings.profile.Rotation['黑暗契约法力值'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['黑暗契约宠物魔法值'] = 35"},
            {Run = "DMW.Settings.profile.Rotation['吞噬暗影'] = true"},
            {Run = "DMW.Settings.profile.Rotation['吞噬暗影生命值'] = 70"},
            {Run = "DMW.Settings.profile.Rotation['牺牲'] = true"},
            {Run = "DMW.Settings.profile.Rotation['牺牲生命值'] = 5"},
            {Run = "DMW.Settings.profile.Rotation['自动宠物攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗影箭'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['暗影箭法力值'] = 35"},
            {Run = "DMW.Settings.profile.Rotation['无魔杖暗影箭'] = true"},
            {Run = "DMW.Settings.profile.Rotation['dot敌人数量'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['诅咒增幅'] = true"},
            {Run = "DMW.Settings.profile.Rotation['诅咒'] = 2"},
            {Run = "DMW.Settings.profile.Rotation['轮流诅咒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['腐蚀术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['轮流腐蚀术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['献祭'] = true"},
            {Run = "DMW.Settings.profile.Rotation['轮流献祭'] = false"},
            {Run = "DMW.Settings.profile.Rotation['生命虹吸'] = false"},
            {Run = "DMW.Settings.profile.Rotation['轮流生命虹吸'] = false"},
            {Run = "DMW.Settings.profile.Rotation['暗影灼烧'] = false"},
            {Run = "DMW.Settings.profile.Rotation['吸取生命二'] = false"},
            {Run = "DMW.Settings.profile.Rotation['烧尽'] = true"},
            {Run = "DMW.Settings.profile.Rotation['痛苦无常'] = false"},
            {Run = "DMW.Settings.profile.Rotation['腐蚀之种子'] = true"},
            {Run = "DMW.Settings.profile.Rotation['吸取生命'] = true"},
            {Run = "DMW.Settings.profile.Rotation['吸取生命生命值'] = 90"},
            {Run = "DMW.Settings.profile.Rotation['生命通道'] = true"},
            {Run = "DMW.Settings.profile.Rotation['生命通道宠物HP'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['暗影防护结界'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暗影之怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['恐惧多余目标'] = false"},
            {Run = "DMW.Settings.profile.Rotation['恐惧术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['吸取灵魂'] = true"},
            {Run = "DMW.Settings.profile.Rotation['最大碎片数停止吸取灵魂'] = true"},
            {Run = "DMW.Settings.profile.Rotation['最大碎片数量'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['使用法术石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制造法力石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法术石法力值'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['法力分流法力值百分比'] = 80"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0.8},

      --如果我是圣骑的初始化
      {If = "SC:GetPlayer().Class=='PALADIN'", End = 0.9},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化圣骑战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['开启DPS'] = true"},
            {Run = "DMW.Settings.profile.Rotation['优先攻击最后的敌人'] = true"},
            {Run = "DMW.Settings.profile.Rotation['指定祝福'] = 2"},
            {Run = "DMW.Settings.profile.Rotation['队伍-王者祝福'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍-拯救祝福'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍-力量祝福'] = false"},
            {Run = "DMW.Settings.profile.Rotation['指定光环'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['野外惩戒智能光环'] = true"},
            {Run = "DMW.Settings.profile.Rotation['乘骑智能十字军光环'] = true"},
            {Run = "DMW.Settings.profile.Rotation['使用审判'] = true"},
            {Run = "DMW.Settings.profile.Rotation['指定圣印'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['惩戒智能审判'] = true"},
            {Run = "DMW.Settings.profile.Rotation['防骑智能审判'] = false"},
            {Run = "DMW.Settings.profile.Rotation['指定审判'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['智能公正审判'] = true"},
            {Run = "DMW.Settings.profile.Rotation['十字军打击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制裁之锤'] = true"},
            {Run = "DMW.Settings.profile.Rotation['驱邪术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['愤怒之锤'] = true"},
            {Run = "DMW.Settings.profile.Rotation['奉献'] = true"},
            {Run = "DMW.Settings.profile.Rotation['输出复仇之怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['正义之怒保持'] = false"},
            {Run = "DMW.Settings.profile.Rotation['使用复仇者之盾拉怪'] = false"},
            {Run = "DMW.Settings.profile.Rotation['神圣之盾保持'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 正义防御'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍-复活术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 复仇之怒治疗'] = false"},
            {Run = "DMW.Settings.profile.Rotation['清洁术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['纯净术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 圣光术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 圣光术百分比'] = 80"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 圣光闪现'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 圣光闪现百分比'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 神圣震击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['队伍 - 神圣震击百分比'] = 90"},
            {Run = "DMW.Settings.profile.Rotation['圣光术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['圣光术百分比'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['圣光闪现'] = false"},
            {Run = "DMW.Settings.profile.Rotation['圣光闪现百分比'] = 10"},
            {Run = "DMW.Settings.profile.Rotation['圣盾术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['圣盾术百分比'] = 25"},
            {Run = "DMW.Settings.profile.Rotation['圣佑术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['圣佑术百分比'] = 25"},
            {Run = "DMW.Settings.profile.Rotation['圣疗术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['圣疗术百分比'] = 20"},
            
            {Run = "DMW.Settings.profile.Rotation['使用法术石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制造法力石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法术石法力值'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['法力分流法力值百分比'] = 80"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0.9},

      --如果我是战士的初始化
      {If = "SC:GetPlayer().Class=='WARRIOR'", End = 0.11},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化战士战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['开启DPS'] = true"},
            {Run = "DMW.Settings.profile.Rotation['自动面对目标'] = true"},
            {Run = "DMW.Settings.profile.Rotation['自动攻击目标'] = true"},
            {Run = "DMW.Settings.profile.Rotation['指定战斗循环'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['智能战斗循环'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冲锋'] = true"},
            {Run = "DMW.Settings.profile.Rotation['斩杀'] = true"},
            {Run = "DMW.Settings.profile.Rotation['撕裂'] = false"},
            {Run = "DMW.Settings.profile.Rotation['破甲攻击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['震荡猛击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['乘胜追击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['猛击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['血性狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['血性狂暴怒气值'] = 10"},
            {Run = "DMW.Settings.profile.Rotation['英勇打击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['英勇打击怒气值'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['顺劈斩'] = true"},
            {Run = "DMW.Settings.profile.Rotation['顺劈斩人数'] = 2"},
            {Run = "DMW.Settings.profile.Rotation['战斗怒吼'] = true"},
            {Run = "DMW.Settings.profile.Rotation['挫志怒吼'] = 2"},
            {Run = "DMW.Settings.profile.Rotation['切换姿态损失的怒气值'] = 0"},
            {Run = "DMW.Settings.profile.Rotation['命令怒吼'] = true"},
            {Run = "DMW.Settings.profile.Rotation['命令怒吼血量'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['泻怒'] = 70"},
            {Run = "DMW.Settings.profile.Rotation['压制'] = true"},
            {Run = "DMW.Settings.profile.Rotation['断筋'] = false"},
            {Run = "DMW.Settings.profile.Rotation['智能断筋'] = true"},
            {Run = "DMW.Settings.profile.Rotation['横扫攻击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['横扫攻击人数'] = 2"},
            {Run = "DMW.Settings.profile.Rotation['雷霆一击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['雷霆一击人数'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['反击风暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['反击风暴生命百分比'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['致死打击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['旋风斩'] = true"},
            {Run = "DMW.Settings.profile.Rotation['旋风斩人数'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['死亡之愿'] = true"},
            {Run = "DMW.Settings.profile.Rotation['死亡之愿生命值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['鲁莽'] = true"},
            {Run = "DMW.Settings.profile.Rotation['鲁莽生命值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['鲁莽人数'] = 2"},
            {Run = "DMW.Settings.profile.Rotation['嗜血'] = true"},
            {Run = "DMW.Settings.profile.Rotation['嗜血生命值'] = 70"},
            {Run = "DMW.Settings.profile.Rotation['拳击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴之怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['暴怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['嘲讽'] = false"},
            {Run = "DMW.Settings.profile.Rotation['复仇'] = false"},
            {Run = "DMW.Settings.profile.Rotation['盾击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['盾牌格挡'] = false"},
            {Run = "DMW.Settings.profile.Rotation['盾牌猛击'] = false"},
            {Run = "DMW.Settings.profile.Rotation['缴械'] = false"},
            {Run = "DMW.Settings.profile.Rotation['破釜沉舟'] = false"},
            {Run = "DMW.Settings.profile.Rotation['嗜血生命值'] = 70"},
            {Run = "DMW.Settings.profile.Rotation['盾墙'] = false"},
            {Run = "DMW.Settings.profile.Rotation['嗜血生命值'] = 70"},            
            {Run = "DMW.Settings.profile.Rotation['使用法术石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['制造法力石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法术石法力值'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['法力分流法力值百分比'] = 80"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0.11},

      --如果我是德鲁伊的初始化
      {If = "SC:GetPlayer().Class=='DRUID'", End = 0.12},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化战士战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['选择形态'] = 3"},
            {Run = "DMW.Settings.profile.Rotation['野外智能形态'] = true"},
            {Run = "DMW.Settings.profile.Rotation['猎豹形态开怪'] = 5"},
            {Run = "DMW.Settings.profile.Rotation['野外智能开怪'] = true"},
            {Run = "DMW.Settings.profile.Rotation['自动取消变形'] = true"},
            {Run = "DMW.Settings.profile.Rotation['形态切换'] = true"},
            {Run = "DMW.Settings.profile.Rotation['潜行'] = true"},
            {Run = "DMW.Settings.profile.Rotation['裂伤-猫'] = true"},
            {Run = "DMW.Settings.profile.Rotation['裂伤-熊'] = true"},
            {Run = "DMW.Settings.profile.Rotation['斜掠'] = true"},
            {Run = "DMW.Settings.profile.Rotation['割裂'] = true"},
            {Run = "DMW.Settings.profile.Rotation['割伤'] = true"},
            {Run = "DMW.Settings.profile.Rotation['凶猛撕咬'] = true"},
            {Run = "DMW.Settings.profile.Rotation['猛击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['横扫'] = true"},
            {Run = "DMW.Settings.profile.Rotation['挫志咆哮'] = true"},
            {Run = "DMW.Settings.profile.Rotation['重殴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['重殴怒气值'] = 20"},
            {Run = "DMW.Settings.profile.Rotation['狂暴回复'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴回复百分比'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['精灵之火(野性)'] = true"},
            {Run = "DMW.Settings.profile.Rotation['精灵之火(野性)拉怪'] = false"},
            {Run = "DMW.Settings.profile.Rotation['激怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['激活'] = true"},
            {Run = "DMW.Settings.profile.Rotation['野性印记'] = true"},
            {Run = "DMW.Settings.profile.Rotation['荆棘术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['清晰预兆'] = true"},
            {Run = "DMW.Settings.profile.Rotation['猛虎之怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['消毒术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['非战斗消毒术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['移除诅咒'] = false"},
            {Run = "DMW.Settings.profile.Rotation['非战斗移除诅咒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['驱毒术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['非战斗驱毒术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['精灵之火'] = true"},
            {Run = "DMW.Settings.profile.Rotation['树皮术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['树皮术百分比'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['治疗之触'] = false"},
            {Run = "DMW.Settings.profile.Rotation['愈合'] = false"},
            {Run = "DMW.Settings.profile.Rotation['回春术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['回春术百分比'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['战斗回春术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['战斗回春术百分比'] = 60"},
            {Run = "DMW.Settings.profile.Rotation['生命绽放'] = false"},
            {Run = "DMW.Settings.profile.Rotation['使用治疗石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['治疗药水'] = true"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0.12},

      --如果我是萨满的初始化
      {If = "SC:GetPlayer().Class=='SHAMAN'", End = 0.12},
            --是否接过任务
            --IsHasQuest(QuestID)
            --是否完成过任务
            --IsCompletedQuest(QuestID)
            --是否可以完成任务
            --CanCompleteQuest(QuestID,index)
            {Log='Info',Text="初始化战士战斗循环"},
            {Run = "DMW.Settings.profile.Rotation['使用图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['大地之力图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['灼热图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['灼热图腾法力值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['火舌图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['火舌图腾法力值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['熔岩图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['熔岩图腾法力值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['火焰新星图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['火焰新星图腾法力值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['风怒图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['风之优雅图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['石肤图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['石爪图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['空气图腾'] = false"},
            {Run = "DMW.Settings.profile.Rotation['治疗之泉图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['法力之泉图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['冰霜震击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['地震术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['地震术法力值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['烈焰震击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['烈焰震击法力值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['风暴打击'] = true"},
            {Run = "DMW.Settings.profile.Rotation['地震术-打断'] = true"},
            {Run = "DMW.Settings.profile.Rotation['闪电之盾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['水之护盾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['嗜血'] = true"},
            {Run = "DMW.Settings.profile.Rotation['嗜血生命值'] = 35"},
            {Run = "DMW.Settings.profile.Rotation['萨满之怒'] = true"},
            {Run = "DMW.Settings.profile.Rotation['萨满之怒生命值'] = 40"},
            {Run = "DMW.Settings.profile.Rotation['火元素图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['火元素图腾生命值'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['土元素图腾'] = true"},
            {Run = "DMW.Settings.profile.Rotation['土元素图腾生命值'] = 30"},
            {Run = "DMW.Settings.profile.Rotation['智能武器附魔'] = true"},
            {Run = "DMW.Settings.profile.Rotation['武器附魔'] = 1"},
            {Run = "DMW.Settings.profile.Rotation['消毒术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['祛病术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['净化术'] = false"},
            {Run = "DMW.Settings.profile.Rotation['非战斗消毒术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['非战斗祛病术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['非战斗净化术'] = true"},
            {Run = "DMW.Settings.profile.Rotation['水下呼吸'] = true"},
            {Run = "DMW.Settings.profile.Rotation['次级治疗波'] = true"},
            {Run = "DMW.Settings.profile.Rotation['次级治疗波生命值'] = 50"},
            {Run = "DMW.Settings.profile.Rotation['治疗波'] = true"},
            {Run = "DMW.Settings.profile.Rotation['治疗波生命值'] = 30"},

            {Run = "DMW.Settings.profile.Rotation['使用治疗石'] = true"},
            {Run = "DMW.Settings.profile.Rotation['治疗药水'] = true"},
	      {Run = "DMW.Settings.profile.Rotation['奥术洪流'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴'] = true"},
            {Run = "DMW.Settings.profile.Rotation['狂暴生命值'] = 90"},
            {Log='Info',Text="初始化完成"},
      {End = 0.12},
      {Replace = 'text2'},
}

local text2 = {
      {If = "SC:GetPlayer().Class == 'HUNTER' and SC:GetPlayer().Level >= 1 and SC:GetPlayer().Level < 10", End = '猎人购买弹药400'},
      --弹药数量
      {Settings = 'AmmoAmount', value = 400},
      {End = '猎人购买弹药400'},

      {If = "SC:GetPlayer().Class == 'HUNTER' and SC:GetPlayer().Level >= 10 and SC:GetPlayer().Level < 30", End = '猎人购买弹药1000'},
      --弹药数量
      {Settings = 'AmmoAmount', value = 1000},
      {End = '猎人购买弹药1000'},

      {If = "SC:GetPlayer().Class == 'HUNTER' and SC:GetPlayer().Level >= 30 and SC:GetPlayer().Level <= 70", End = '猎人购买弹药1600'},
      --弹药数量
      {Settings = 'AmmoAmount', value = 1800},
      {End = '猎人购买弹药1600'},
      
      --大于1级小于71级循环打怪
      {If = "SC:GetPlayer().Level >= 1 and SC:GetPlayer().Level < 71", End = '自定义打怪'},
            {Run = 'print("打怪开始")'},
            --回家路径避免卡位 如果回家时候卡位用
            {Settings = 'GoHomePath', value = {
                  --{2235.0337, 252.1912, 33.6516},
                  --{2235.0337, 252.1912, 33.6516},
            },},
            --离开家路径避免卡位 如果离开家时候卡位用
            {Settings = 'LeaveHomePath', value = {
                  --{2235.0337, 252.1912, 33.6516},
                  --{2235.0337, 252.1912, 33.6516},
            },},
            {Settings = 'BuyNPC', value = {
                  --食物商人    id是商人的npcid    后面的坐标是我站着对话商人的坐标
                  {Id =3951  ,Path = {2087.0820, -1199.1660, 101.7074}},
                  --修装的
                  {Id =3951  ,Path = {2087.0820, -1199.1660, 101.7074}},
                  --弓箭商人
                  {Id =3951  ,Path = {2087.0820, -1199.1660, 101.7074}},
            }},
            --是否判断回城事件
            {Settings = 'GoHomeEvent', value = true},
            --打怪循环设置
            {AttackMonster = {3791,3789} , Count = 1 ,  --0000,0000是要打的怪物id
            MoveTo = {--0000.0000,0000.0000,0000.0000 是要巡逻的坐标
                  {{2089.0271, -1197.2986, 101.7367},},
	{{2089.0271, -1197.2986, 101.7367},},
	{{2093.8054, -1196.5743, 101.7822},},
	{{2100.8425, -1195.3268, 101.9883},},
	{{2107.6667, -1194.1168, 101.7777},},
	{{2114.6572, -1192.9467, 101.7780},},
	{{2121.6660, -1192.5688, 101.1666},},
	{{2128.9116, -1192.2646, 100.2006},},
	{{2135.8982, -1191.9712, 98.6864},},
	{{2142.9617, -1191.6746, 96.2714},},
	{{2150.1702, -1191.8195, 94.5998},},
	{{2156.3083, -1195.0537, 93.6069},},
	{{2162.2109, -1198.7773, 92.9521},},
	{{2168.1965, -1202.5533, 92.5900},},
	{{2174.1821, -1206.3292, 91.8283},},
	{{2179.9209, -1210.2712, 90.6654},},
	{{2185.4250, -1214.7639, 89.4473},},
	{{2190.8586, -1219.1991, 87.9439},},
	{{2196.3467, -1223.6785, 86.2444},},
	{{2201.8508, -1228.1711, 84.6578},},
	{{2207.3062, -1232.6239, 83.5502},},
	{{2212.7400, -1237.0591, 82.7600},},
	{{2218.3147, -1241.6093, 81.8263},},
	{{2224.1741, -1245.5153, 80.8025},},
	{{2230.2339, -1249.3049, 80.0831},},
	{{2236.1987, -1253.0352, 79.3602},},
	{{2242.1692, -1256.7690, 77.9632},},
	{{2248.4011, -1260.6663, 76.3965},},
	{{2254.5557, -1264.5153, 76.8430},},
	{{2260.3721, -1268.1527, 76.8844},},
	{{2283.6128, -1282.6869, 77.3874},},
	{{2289.5952, -1286.4282, 77.1112},},
	{{2295.4294, -1290.0768, 77.1670},},
	{{2301.5483, -1293.9036, 78.8572},},
	{{2307.5586, -1297.6620, 81.2037},},
	{{2313.0081, -1302.3381, 82.1382},},
	{{2317.6531, -1307.6240, 82.5124},},
	{{2321.8052, -1313.4048, 82.9153},},
	{{2325.8135, -1319.0751, 83.5375},},
	{{2329.8813, -1324.9971, 83.9077},},
	{{2330.1587, -1332.0613, 84.4098},},
	{{2331.4019, -1339.0514, 85.2538},},
	{{2336.0618, -1344.0695, 86.0437},},
	{{2341.8481, -1348.2869, 88.2148},},
	{{2347.6252, -1352.4233, 91.2818},},
	{{2353.8118, -1356.1923, 93.9613},},
	{{2375.0464, -1368.7859, 106.6916},},
	{{2380.9348, -1372.2781, 109.9990},},
	{{2386.9639, -1375.9392, 114.0988},},
	{{2392.3584, -1380.3005, 117.7412},},
	{{2397.4724, -1385.2067, 121.3668},},
	{{2401.3650, -1391.0280, 124.2706},},
	{{2401.5173, -1397.7529, 125.4855},},
	{{2400.1199, -1404.7307, 124.8777},},
	{{2398.7246, -1411.5616, 125.2082},},
	{{2397.2690, -1418.6875, 125.2716},},
	{{2395.8528, -1425.6213, 125.2849},},
	{{2394.3833, -1432.8158, 125.2849},},
	{{2392.9768, -1439.7017, 125.2665},},
	{{2391.5925, -1446.4778, 125.2850},},
	{{2390.0713, -1453.4316, 125.2850},},
	{{2388.6423, -1460.4058, 125.2850},},
	{{2383.6267, -1484.9576, 125.4702},},
	{{2382.2063, -1491.9121, 125.3726},},
	{{2380.8230, -1498.8107, 125.3155},},
	{{2381.0632, -1505.8485, 125.4254},},
	{{2381.4192, -1513.0503, 125.6212},},
	{{2384.5420, -1519.4792, 126.8123},},
	{{2387.7920, -1525.5205, 127.5379},},
	{{2391.4807, -1531.4727, 125.2857},},
	{{2397.1738, -1535.7235, 125.6937},},
	{{2402.8726, -1539.9785, 126.9217},},
	{{2408.8323, -1543.6516, 128.2034},},
	{{2415.6606, -1545.4814, 128.8195},},
	{{2422.4385, -1547.2307, 129.9488},},
	{{2429.2705, -1548.9940, 131.4624},},
	{{2435.9941, -1550.7292, 134.1316},},
	{{2462.4893, -1557.5673, 141.1229},},
	{{2469.2468, -1559.3113, 142.6584},},
	{{2476.2048, -1561.0885, 143.4183},},
	{{2483.0063, -1561.4036, 145.5199},},
	{{2490.1494, -1562.4703, 146.0849},},
	{{2497.0273, -1563.7351, 146.3284},},
	{{2503.9395, -1565.0063, 146.6734},},
	{{2510.7898, -1566.2661, 146.8878},},
	{{2517.7778, -1567.5511, 147.4415},},
	{{2524.6421, -1568.8135, 148.0471},},
	{{2531.5447, -1568.3051, 148.5647},},
	{{2538.0466, -1565.2212, 149.5482},},
	{{2544.0811, -1561.9441, 150.9670},},
	{{2550.4663, -1558.4766, 151.4522},},
	{{2556.4946, -1555.2029, 152.8312},},
	{{2562.7383, -1551.8123, 153.2760},},
	{{2584.2698, -1540.4678, 161.9262},},
	{{2591.5098, -1541.3081, 165.7729},},
	{{2597.8806, -1544.3047, 169.6998},},
	{{2604.2131, -1547.6475, 172.5199},},
	{{2609.6113, -1551.9830, 176.8563},},
	{{2616.2156, -1554.6688, 182.7397},},
	{{2621.0662, -1559.6475, 187.8091},},
	{{2625.9656, -1564.6764, 193.5089},},
	{{2630.8796, -1569.7202, 198.7089},},
	{{2634.4546, -1573.8401, 202.8303},},
	{{2636.3420, -1576.7455, 206.1141},},
	{{2639.8677, -1582.6792, 209.8164},},
	{{2643.3455, -1588.8506, 215.0940},},
	{{2646.2048, -1595.1857, 215.6430},},
	{{2648.3381, -1602.4967, 207.4991},},
	{{2650.9929, -1608.8525, 202.9215},},
	{{2652.1370, -1615.7557, 200.2819},},
	{{2651.7141, -1622.7802, 193.6639},},
	{{2652.5771, -1629.5908, 192.2733},},
	{{2651.0347, -1631.8446, 193.1343},},
	{{2644.2471, -1633.6548, 192.0927},},
	{{2637.6892, -1636.1235, 185.2310},},
	{{2632.7568, -1639.1166, 179.8737},},
	{{2627.0225, -1643.2036, 174.2536},},
	{{2621.4712, -1647.9458, 170.8805},},
	{{2615.7925, -1652.4111, 168.7902},},
	{{2609.7563, -1657.1577, 166.2597},},
	{{2604.2925, -1661.4543, 164.5773},},
	{{2598.6746, -1665.8722, 161.6184},},
	{{2595.2905, -1668.4924, 161.7388},},
	{{2593.8752, -1668.4065, 159.5543},},
	{{2592.6133, -1662.9087, 160.8233},},
	{{2589.5381, -1661.4934, 160.3727},},
	{{2593.1802, -1655.3895, 162.0351},},
	{{2591.7585, -1651.3535, 161.7682},},
	{{2591.8167, -1650.5771, 161.7820},},
	{{2591.6768, -1651.5684, 161.7528},},
	{{2589.5889, -1658.2870, 161.1789},},
	{{2587.6753, -1665.2594, 158.6597},},
	{{2585.8606, -1672.0056, 156.3063},},
	{{2584.0422, -1678.7654, 155.5174},},
	{{2578.8987, -1703.3304, 158.7097},},
	{{2582.3362, -1709.9413, 159.5228},},
	{{2585.6875, -1715.9990, 160.3976},},
	{{2589.3220, -1722.0043, 161.4220},},
	{{2594.7307, -1726.5260, 163.2969},},
	{{2600.2571, -1731.1459, 165.4849},},
	{{2605.7136, -1735.7075, 167.7780},},
	{{2611.1433, -1740.2466, 171.8128},},
	{{2616.5354, -1744.7543, 176.1208},},
	{{2622.0134, -1749.3339, 178.2924},},
	{{2627.3411, -1753.7877, 181.3717},},
	{{2632.8728, -1758.4121, 182.6639},},
	{{2638.2327, -1762.8929, 185.3231},},
	{{2643.5767, -1767.3605, 187.0302},},
	{{2649.0493, -1771.9355, 188.8784},},
	{{2669.7463, -1789.2386, 192.1679},},
	{{2675.0579, -1793.6790, 192.5335},},
	{{2680.8069, -1798.0842, 192.5788},},
	{{2686.9370, -1801.1312, 194.1190},},
	{{2693.1638, -1804.2828, 195.0312},},
	{{2699.4595, -1807.4694, 197.1785},},
	{{2705.7712, -1810.5985, 197.3009},},
	{{2712.7815, -1810.7935, 199.4500},},
	{{2719.7727, -1810.9437, 199.3139},},
	{{2727.3125, -1811.2493, 199.9227},},
	{{2734.5374, -1811.5421, 199.8115},},
	{{2741.1609, -1811.8105, 201.4580},},
	{{2748.1689, -1812.0945, 202.3744},},
	{{2755.1980, -1812.3794, 202.1981},},
	{{2762.2480, -1812.6652, 202.4076},},
	{{2769.2563, -1812.9491, 203.3618},},
	{{2795.7354, -1814.0225, 204.3788},},
	{{2802.9685, -1813.9807, 204.3040},},
	{{2809.6079, -1811.9733, 203.6852},},
	{{2816.6121, -1810.1232, 202.3445},},
	{{2823.5906, -1808.7156, 201.2175},},
	{{2830.4729, -1807.3274, 200.0515},},
	{{2837.3486, -1805.9406, 198.8612},},
	{{2844.2515, -1804.5482, 198.0175},},
	{{2851.1750, -1803.1517, 196.8960},},
	{{2858.1331, -1801.7484, 197.8635},},
	{{2865.1731, -1800.3282, 193.4343},},
	{{2872.0212, -1798.9470, 192.2289},},
	{{2879.0859, -1798.3680, 193.9733},},
	{{2886.1733, -1797.7546, 190.6662},},
	{{2892.7673, -1795.3020, 189.0278},},
	{{2913.9978, -1784.1221, 187.1711},},
	{{2920.2068, -1780.8444, 187.1097},},
	{{2926.4404, -1777.5537, 186.6877},},
	{{2932.6433, -1774.2793, 185.2225},},
	{{2938.9067, -1770.8541, 182.5458},},
	{{2945.0100, -1767.3831, 181.1492},},
	{{2951.1313, -1763.9015, 181.3229},},
	{{2957.2043, -1760.4478, 181.6093},},
	{{2963.3379, -1756.9594, 181.6067},},
	{{2969.3804, -1753.5229, 181.5639},},
	{{2975.5322, -1750.0242, 181.2564},},
	{{2981.8362, -1746.4388, 178.2392},},
	{{2987.7327, -1743.0854, 177.9933},},
	{{2993.9077, -1739.5735, 176.8708},},
	{{2999.9863, -1736.1162, 176.6532},},
	{{3006.2793, -1732.5372, 176.7073},},
	{{3029.1892, -1719.5077, 174.1336},},
	{{3035.2498, -1716.0609, 172.7146},},
	{{3041.3167, -1712.6106, 172.3416},},
	{{3047.6509, -1709.0079, 172.9517},},
	{{3053.6506, -1705.5957, 173.2794},},
	{{3060.2407, -1701.8478, 172.6049},},
	{{3066.0215, -1698.5602, 172.2697},},
	{{3072.5872, -1694.8260, 172.1804},},
	{{3078.4470, -1691.4934, 172.4837},},
	{{3084.6335, -1687.9750, 172.6225},},
	{{3090.9714, -1684.3120, 172.4324},},
	{{3094.3774, -1678.3711, 172.8135},},
	{{3097.3291, -1671.1909, 174.6615},},
	{{3100.1899, -1664.7307, 175.2922},},
	{{3104.1565, -1658.4792, 176.3948},},
	{{3107.8694, -1652.7942, 177.1333},},
	{{3111.7429, -1646.8630, 177.4967},},
	{{3114.7815, -1641.2163, 177.5420},},
	{{3117.7034, -1635.5703, 177.7895},},
	{{3123.1736, -1630.9619, 176.8700},},
	{{3128.9629, -1627.0354, 176.6819},},
	{{3135.0320, -1623.2610, 175.7926},},
	{{3141.1785, -1619.4386, 174.5838},},
	{{3162.5159, -1606.1683, 171.4898},},
	{{3168.7158, -1602.3125, 170.4884},},
	{{3174.4519, -1598.7451, 169.6366},},
	{{3180.4141, -1595.0372, 169.4234},},
	{{3186.4358, -1591.2925, 169.6801},},
	{{3192.4634, -1587.5439, 169.8821},},
	{{3198.3838, -1583.8619, 171.1032},},
	{{3204.5698, -1580.3063, 171.6613},},
	{{3210.6619, -1576.9045, 171.6971},},
	{{3216.8225, -1573.4644, 171.7438},},
	{{3222.9832, -1570.0243, 170.7979},},
	{{3229.1072, -1566.6046, 172.4615},},
	{{3235.2517, -1563.1736, 169.8031},},
	{{3241.5225, -1559.6719, 170.4563},},
	{{3247.9033, -1556.1089, 170.1518},},
	{{3253.9172, -1552.7506, 169.3218},},
	{{3275.6643, -1540.6073, 166.9182},},
	{{3281.6904, -1537.2422, 167.2883},},
	{{3287.8696, -1533.7919, 167.4820},},
	{{3294.1587, -1530.2800, 165.7463},},
	{{3300.1848, -1526.9150, 164.6427},},
	{{3306.4250, -1523.4304, 164.6062},},
	{{3312.5562, -1520.0070, 164.9466},},
	{{3318.9124, -1516.4576, 166.0687},},
	{{3325.0425, -1513.0345, 166.4041},},
	{{3331.2214, -1509.5842, 166.9930},},
	{{3337.3271, -1506.1747, 167.2045},},
	{{3343.6650, -1502.6356, 166.8364},},
	{{3350.1052, -1499.0393, 167.9855},},
	{{3356.1743, -1495.6504, 166.9877},},
	{{3362.2617, -1492.2512, 167.5267},},
	{{3368.5142, -1488.7599, 167.3829},},
	{{3374.8093, -1485.2446, 166.8912},},
	{{3380.7927, -1481.9034, 166.8912},},
	{{3386.9595, -1478.4600, 167.0736},},
	{{3393.1326, -1475.0129, 167.5122},},
	{{3399.2932, -1471.5728, 167.1850},},
	{{3404.4792, -1467.2874, 166.9774},},
	{{3407.0471, -1460.5730, 167.1506},},
	{{3416.4814, -1435.6959, 173.3182},},
	{{3418.4988, -1429.1503, 175.7585},},
	{{3420.3628, -1422.2650, 177.8861},},
	{{3417.9695, -1416.0271, 178.9388},},
	{{3414.4121, -1409.8285, 180.3855},},
	{{3410.9312, -1403.7635, 180.1110},},
	{{3407.3979, -1397.6075, 180.4216},},
	{{3403.9275, -1391.5608, 181.7363},},
	{{3400.3247, -1385.2836, 182.7577},},
	{{3396.8752, -1379.2732, 184.7903},},
	{{3393.1599, -1373.1289, 187.7783},},
	{{3388.0964, -1368.2969, 189.9712},},
	{{3383.0325, -1363.5298, 190.6455},},
	{{3378.3062, -1358.3594, 191.5120},},
	{{3372.6975, -1354.9297, 192.3466},},
	{{3365.9473, -1353.3003, 193.4990},},
	{{3339.0286, -1346.8054, 200.0198},},
	{{3331.8086, -1347.1188, 201.7129},},
	{{3324.9194, -1347.5437, 203.9534},},
	{{3317.6743, -1347.9905, 207.6962},},
	{{3310.7134, -1348.4198, 211.2022},},
	{{3303.4192, -1348.8696, 214.4093},},
	{{3296.4883, -1349.2971, 217.5253},},
	{{3289.4946, -1349.7284, 220.5601},},
	{{3282.3259, -1350.1705, 223.4984},},
	{{3275.2112, -1350.6683, 225.8450},},
	{{3268.2456, -1351.4235, 228.9001},},
	{{3261.3003, -1352.3365, 232.2725},},
	{{3254.3281, -1353.6246, 235.7843},},
	{{3247.2349, -1355.4960, 238.8776},},
	{{3240.3403, -1357.2979, 240.1425},},
	{{3233.9011, -1359.5652, 239.8325},},
	{{3230.8835, -1356.0828, 241.4032},},
	{{3235.5933, -1357.9186, 240.0741},},
	{{3235.5933, -1357.9186, 240.0741},},
	{{3235.5933, -1357.9186, 240.0741},},
	{{3235.5933, -1357.9186, 240.0741},},
	{{3232.4558, -1358.4423, 239.8626},},
	{{3233.0295, -1357.7241, 239.8336},},
	{{3232.0032, -1358.3033, 239.8852},},
	{{3231.0342, -1357.8535, 241.0791},},
	{{3228.8440, -1353.6520, 241.6146},},
	{{3227.5178, -1349.2849, 241.6885},},
	{{3224.4626, -1342.8533, 240.6966},},
	{{3221.3062, -1336.8883, 240.3060},},
	{{3219.2424, -1330.2068, 239.7170},},
	{{3217.1248, -1323.3514, 239.6976},},
	{{3216.2324, -1316.6528, 241.4239},},
	{{3217.9580, -1309.8113, 240.8777},},
	{{3219.1365, -1302.8362, 240.0179},},
	{{3218.8899, -1295.9246, 239.6870},},
	{{3216.7830, -1289.3170, 239.9409},},
	{{3213.7751, -1282.8646, 240.5989},},
	{{3210.7791, -1276.4376, 240.3647},},
	{{3207.8274, -1270.1058, 239.9812},},
	{{3205.4460, -1263.4902, 241.3559},},
	{{3203.5999, -1256.6655, 241.1591},},
	{{3203.2585, -1249.7509, 239.1447},},
	{{3203.0706, -1242.5854, 235.4285},},
	{{3202.8860, -1235.5529, 232.3559},},
	{{3202.7026, -1228.5623, 229.7029},},
	{{3202.3306, -1221.5092, 227.5268},},
	{{3201.4231, -1214.5613, 224.9644},},
	{{3198.5286, -1207.8213, 222.0643},},
	{{3194.4641, -1202.2518, 220.8971},},
	{{3188.0359, -1200.6830, 222.2456},},
	{{3181.7407, -1203.3542, 217.2854},},
	{{3174.8247, -1204.9198, 214.3654},},
	{{3168.0522, -1206.4529, 214.7866},},
	{{3166.6038, -1206.6221, 214.8635},},
	{{3166.6038, -1206.6221, 214.8635},},
            }, Random = 0 ,FindPath =true,
            },
      {Loop = '自定义打怪'},
      }

--加入脚本
Bot:AddQuest('text',text)
--加入脚本
Bot:AddQuest('text2',text2)
--设定第一个执行的脚本
Bot:SetFirstQuest('text')
Bot:SetStart(function()
    Config:Hide()
      --最先执行的地方，不会被自动化（吃喝穿装等）插队
      Log:System('=======================')
      Log:System("自定义打怪1029开始")
      Log:System("Fulborgi Ashenvale")
      Log:System('=======================')
      Bot:SetPulse(Bot.QuestScriptPulse)
      SetPulseTime(0.1)
      --自动调整帧数
      SetCVar("maxFPS", 50)
      SetCVar("maxFPSBk", 50)
      SetDMWHUD('Rotation',true) --DMW
      local LearnThisTalentList = {}
      --自动加天赋
      if SC:GetPlayer().Class=='MAGE' then
            LearnThisTalentList = {
                  {303, 3},-- 三点元素精准  
                  {302, 5},-- 五点强化寒冰箭 
                  {305, 3},-- 三点霜寒刺骨 
                  {306, 2},-- 两点强化冰霜新星 
                  {308, 3},-- 三点刺骨寒冰 
                  {313, 5},-- 五点碎冰 
                  {304, 5}, -- 五点寒冰碎片 
                  {316, 3},-- 三点强化冰锥术
                  {315, 1},-- 一点急速冷却 
                  {319, 1},-- 一点寒冰护体 
                  {320, 5},-- 五点极寒之风 
                  {321, 5},-- 五点寒冰箭增效 
                  {317, 2},-- 两点浮冰  
                  {322, 1},-- 一点召唤水元素 
                  {309, 1},-- 一点冰冷血脉 
                  {318, 5},-- 五点深冬之寒  
                  {312, 3},-- 三点冰霜导能 
                  {311, 2},-- 两点极寒延伸 
                  {307, 3},-- 三点极寒冰霜 
                  {314, 1},-- 冰冻之心*1
            }
      end
      if SC:GetPlayer().Class=='ROGUE' then
            LearnThisTalentList = {
                  {102, 2}, --冷酷攻击2点
                  {202, 2}, --强化影袭2点
                  {101, 3}, --强化刺骨3点
                  {103, 5}, --恶意5点
                  {109, 5}, --致命偷袭5点
                  {203, 5}, --闪电反射5点
                  {206, 5}, --精确5点
                  {205, 5}, --偏斜5点
                  {208, 1}, --还击1点
                  {212, 5}, --双武器专精5点
                  {214, 1}, --剑刃乱舞1点
                  {209, 1}, --强化疾跑1点
                  {207, 1}, --耐久1点
                  {218, 2}, --武器专家2点
                  {219, 3}, --侵犯3点
                  {221, 1}, --冲动1点
                  {217, 2}, --剑刃飞转2点
                  {220, 2}, --活力2点
                  {223, 5}, --战斗潜能5点
                  {224, 1}, --突袭1点
            }
      end
      if SC:GetPlayer().Class=='HUNTER' then
            LearnThisTalentList = {
                  {102, 1}, --耐久训练5点
                  {102, 2}, --耐久训练5点
                  {102, 3}, --耐久训练5点
                  {102, 4}, --耐久训练5点
                  {102, 5}, --耐久训练5点
                  {105, 1}, --厚皮3点
                  {105, 2}, --厚皮3点
                  {105, 3}, --厚皮3点
                  {103, 1}, --火力集中2点
                  {103, 2}, --火力集中2点
                  {109, 1}, --狂怒释放2点
                  {109, 2}, --狂怒释放2点
                  {109, 3}, --狂怒释放3点
                  {111, 1}, --凶暴5点
                  {111, 2}, --凶暴5点
                  {111, 3}, --凶暴5点
                  {111, 4}, --凶暴5点
                  {111, 5}, --凶暴5点
                  {113, 1}, --胁迫1点
                  {114, 1}, --野兽戒律2点
                  {114, 2}, --野兽戒律2点
                  {112, 1}, --灵魂联结2点
                  {112, 2}, --灵魂联结2点
                  {116, 1}, --狂乱5点
                  {116, 2}, --狂乱5点
                  {116, 3}, --狂乱5点
                  {116, 4}, --狂乱5点
                  {116, 5}, --狂乱5点
                  {118, 1}, --狂野怒火1点
                  {119, 1}, --猎豹反射3点
                  {119, 2}, --猎豹反射3点
                  {119, 3}, --猎豹反射3点
                  {110, 1}, --强化治疗宠物2点
                  {110, 2}, --强化治疗宠物2点
                  {120, 1}, --蛇之迅捷5点
                  {120, 2}, --蛇之迅捷5点
                  {120, 3}, --蛇之迅捷5点
                  {120, 4}, --蛇之迅捷5点
                  {120, 5}, --蛇之迅捷5点
                  {121, 1}, --野兽之心1点
                  {106, 1}, --强化复活宠物2点
                  {106, 2}, --强化复活宠物2点
                  {115, 1}, --驭兽者2点
                  {115, 2}, --驭兽者2点
                  {202, 1}, --夺命射击5点
                  {202, 2}, --夺命射击5点
                  {202, 3}, --夺命射击5点
                  {202, 4}, --夺命射击5点
                  {202, 5}, --夺命射击5点
                  {204, 1}, --效率5点
                  {204, 2}, --效率5点
                  {204, 3}, --效率5点
                  {204, 4}, --效率5点
                  {204, 5}, --效率5点
                  {205, 1}, --直取要害2点
                  {205, 2}, --直取要害2点
                  {117, 1}, --凶猛灵感3点
                  {117, 2}, --凶猛灵感3点
            }
      end
      if SC:GetPlayer().Class=='PRIEST' then
            LearnThisTalentList = {
                  {301, 1}, --精神分流5点
                  {301, 2}, --精神分流5点
                  {301, 3}, --精神分流5点
                  {301, 4}, --精神分流5点
                  {301, 5}, --精神分流5点
                  {102, 1}, --魔杖专精5点
                  {102, 2}, --魔杖专精5点
                  {102, 3}, --魔杖专精5点
                  {102, 4}, --魔杖专精5点
                  {102, 5}, --魔杖专精5点
                  {304, 1}, --强化暗言术：痛2点
                  {304, 2}, --强化暗言术：痛2点
                  {302, 1}, --昏阙5点
                  {302, 2}, --昏阙5点
                  {302, 3}, --昏阙5点
                  {308, 1}, --精神鞭笞1
                  {307, 1}, --强化心灵震爆5点
                  {307, 2}, --强化心灵震爆5点
                  {307, 3}, --强化心灵震爆5点
                  {307, 4}, --强化心灵震爆5点
                  {307, 5}, --强化心灵震爆5点
                  {311, 1}, --暗影之波4点
                  {311, 2}, --暗影之波4点
                  {311, 3}, --暗影之波4点
                  {311, 4}, --暗影之波4点
                  {313, 1}, --吸血鬼的拥抱1点
                  {314, 1}, --强化吸血鬼的拥抱2点
                  {314, 2}, --强化吸血鬼的拥抱2点
                  {315, 1}, --心灵集中3点
                  {315, 2}, --心灵集中3点
                  {315, 3}, --心灵集中3点
                  {302, 4}, --昏阙5点
                  {302, 5}, --昏阙5点
                  {311, 1}, --暗影之波5点
                  {311, 2}, --暗影之波5点
                  {311, 3}, --暗影之波5点
                  {311, 4}, --暗影之波5点
                  {311, 5}, --暗影之波5点
                  {317, 1}, --黑暗1点
                  {318, 1}, --暗影形态1点
                  {319, 1}, --暗影能量5点
                  {319, 2}, --暗影能量5点
                  {319, 3}, --暗影能量5点
                  {319, 4}, --暗影能量5点
                  {319, 5}, --暗影能量5点
                  {306, 1}, --强化心灵尖啸2点
                  {306, 2}, --强化心灵尖啸2点
                  {312, 1}, --沉默1点
                  {317, 1}, --黑暗2点
                  {317, 2}, --黑暗2点
                  {321, 1}, --吸血鬼之触1点--45级
                  {317, 1}, --黑暗5点
                  {317, 2}, --黑暗5点
                  {317, 3}, --黑暗5点
                  {317, 4}, --黑暗5点
                  {317, 5}, --黑暗5点
                  {320, 1}, --悲惨5点
                  {320, 2}, --悲惨5点
                  {320, 3}, --悲惨5点
                  {320, 4}, --悲惨5点
                  {320, 5}, --悲惨5点
                  {305, 1}, --暗影集中5点
                  {305, 2}, --暗影集中5点
                  {305, 3}, --暗影集中5点
                  {305, 4}, --暗影集中5点
                  {305, 5}, --暗影集中5点
                  {310, 1}, --暗影延伸2点
                  {310, 2}, --暗影延伸2点
                  {105, 1}, --强化真言术：盾2点
                  {105, 2}, --强化真言术：盾2点
            }
      end
      if SC:GetPlayer().Class=='WARLOCK' then
            LearnThisTalentList = {
                  {203, 1},-- 五点恶魔之拥
                  {203, 2},-- 五点恶魔之拥 
                  {203, 3},-- 五点恶魔之拥 
                  {203, 4},-- 五点恶魔之拥 
                  {203, 5},-- 五点恶魔之拥 
                  {205, 1},-- 三强化虚空行者 
                  {205, 2},-- 三强化虚空行者 
                  {205, 3},-- 三强化虚空行者 
                  {204, 1},-- 两强化生命通道 
                  {204, 2},-- 两强化生命通道 
                  {206, 1},-- 3恶魔智力
                  {206, 2},-- 3恶魔智力
                  {206, 3},-- 3恶魔智力
                  {209, 1},-- 三点恶魔耐力
                  {209, 2},-- 三点恶魔耐力
                  {209, 3},-- 三点恶魔耐力
                  {208, 1},-- 1恶魔支配 
                  {210, 1}, -- 1恶魔庇护 
                  {211, 1},-- 2召唤大师
                  {211, 2},-- 2召唤大师
                  {212, 1},-- 5点邪恶强化
                  {212, 2},-- 5点邪恶强化
                  {212, 3},-- 5点邪恶强化
                  {212, 4},-- 5点邪恶强化
                  {212, 5},-- 5点邪恶强化
                  {214, 1},-- 一点恶魔牺牲
                  {217, 1},-- 五点恶魔学识大师 
                  {217, 2},-- 五点恶魔学识大师 
                  {217, 3},-- 五点恶魔学识大师 
                  {217, 4},-- 五点恶魔学识大师 
                  {217, 5},-- 五点恶魔学识大师 
                  {219, 1},-- 1灵魂链接
                  {216, 1},-- 3法力喂食
                  {216, 2},-- 3法力喂食
                  {216, 3},-- 3法力喂食
                  {221, 1},-- 5恶魔战术
                  {221, 2},-- 5恶魔战术
                  {221, 3},-- 5恶魔战术
                  {221, 4},-- 5恶魔战术
                  {221, 5},-- 5恶魔战术
                  {222, 1},-- 一点召唤恶魔卫士
                  {218, 1},-- 3恶魔韧性
                  {218, 2},-- 3恶魔韧性 
                  {218, 3},-- 3恶魔韧性
                  {102, 1},-- 5强化腐蚀术
                  {102, 2},-- 5强化腐蚀术
                  {102, 3},-- 5强化腐蚀术
                  {102, 4},-- 5强化腐蚀术
                  {102, 5},-- 5强化腐蚀术
                  {104, 1},-- 两点强化吸取灵魂
                  {104, 2},-- 两点强化吸取灵魂
                  {105, 1},-- 2强化生命分流
                  {105, 2},-- 2强化生命分流
                  {106, 1},-- 2灵魂虹吸
                  {106, 2},-- 2灵魂虹吸
                  {220, 1},-- 3恶魔知识
                  {220, 2},-- 3恶魔知识
                  {220, 3},-- 3恶魔知识
                  {109, 1},-- 1诅咒增幅
            }
      end
      if SC:GetPlayer().Class=='PALADIN' then
            LearnThisTalentList = {
                  {301, 1},-- 强化力量祝福
                  {301, 2},-- 强化力量祝福
                  {301, 3},-- 强化力量祝福
                  {301, 4},-- 强化力量祝福
                  {301, 5},-- 强化力量祝福
                  {302, 1},-- 祈福 
                  {302, 2},-- 祈福 
                  {302, 3},-- 祈福
                  {302, 4},-- 祈福
                  {302, 5},-- 祈福
                  {308, 1},-- 命令圣印
                  {303, 1},-- 强化审判
                  {303, 2},-- 强化审判
                  {304, 1},-- 强化十字军圣印
                  {304, 2},-- 强化十字军圣印
                  {304, 3},-- 强化十字军圣印
                  {307, 1},-- 定罪
                  {307, 2},-- 定罪
                  {307, 3},-- 定罪
                  {307, 4},-- 定罪
                  {314, 1},-- 命令圣印
                  {315, 1},-- 强化圣洁光环
                  {315, 2},-- 强化圣洁光环
                  {307, 5},-- 定罪
                  {309, 1},-- 正义追击   
                  {316, 1},-- 复仇 
                  {316, 2},-- 复仇 
                  {316, 3},-- 复仇
                  {316, 4},-- 复仇
                  {316, 5},-- 复仇       
                  {317, 1},-- 神圣审判 
                  {317, 2},-- 神圣审判 
                  {317, 3},-- 神圣审判          
                  {309, 2},-- 正义追击                            
                  {309, 3},-- 正义追击
                  {319, 1},-- 忏悔
                  {321, 1},-- 狂热
                  {321, 2},-- 狂热
                  {321, 3},-- 狂热
                  {321, 4},-- 狂热
                  {322, 1},-- 十字军打击
                  {321, 5},-- 狂热
                  {313, 1},-- 双手武器专精
                  {313, 2},-- 双手武器专精
                  {313, 3},-- 双手武器专精
                  {317, 1},-- 神圣审判
                  {317, 2},-- 神圣审判
                  {317, 3},-- 神圣审判
                  {312, 1},-- 征伐
                  {312, 2},-- 征伐
                  {312, 3},-- 征伐
                  {202, 1},-- 盾牌壁垒
                  {202, 2},-- 盾牌壁垒
                  {202, 3},-- 盾牌壁垒
                  {202, 4},-- 盾牌壁垒
                  {202, 5},-- 盾牌壁垒
                  {203, 1},-- 精确
                  {203, 2},-- 精确
                  {203, 3},-- 精确
            }
      end
      if SC:GetPlayer().Class=='WARRIOR' then
            LearnThisTalentList = {
                  {202, 1},-- 残忍5点
                  {202, 2},-- 残忍5点
                  {202, 3},-- 残忍5点
                  {202, 4},-- 残忍5点
                  {202, 5},-- 残忍5点
                  {204, 1},-- 怒不可遏5点
                  {204, 2},-- 怒不可遏5点
                  {204, 3},-- 怒不可遏5点
                  {204, 4},-- 怒不可遏5点
                  {204, 5},-- 怒不可遏5点
                  {207, 1},-- 血之狂热3点
                  {207, 2},-- 血之狂热3点
                  {207, 3},-- 血之狂热3点
                  {201, 1},-- 震耳噪音 2点
                  {201, 2},-- 震耳噪音 2点
                  {209, 1},-- 双武器专精 5点
                  {209, 2},-- 双武器专精 5点
                  {209, 3},-- 双武器专精 5点
                  {209, 4},-- 双武器专精 5点
                  {209, 5},-- 双武器专精 5点
                  {211, 1},-- 激怒5点
                  {211, 2},-- 激怒5点
                  {211, 3},-- 激怒5点
                  {211, 4},-- 激怒5点
                  {211, 5},-- 激怒5点
                  {216, 1},-- 乱舞5点
                  {216, 2},-- 乱舞5点
                  {216, 3},-- 乱舞5点
                  {216, 4},-- 乱舞5点
                  {216, 5},-- 乱舞5点
                  {213, 1},-- 横扫攻击1点
                  {218, 1},-- 嗜血1点                            
                  {214, 1},-- 武器掌握1点
                  {217, 1},-- 精确3点
                  {217, 2},-- 精确3点
                  {217, 3},-- 精确3点
                  {220, 1},-- 强化狂暴姿态5点
                  {220, 2},-- 强化狂暴姿态5点
                  {220, 3},-- 强化狂暴姿态5点
                  {220, 4},-- 强化狂暴姿态5点
                  {220, 5},-- 强化狂暴姿态5点                                
                  {221, 1},-- 暴怒1点
                  {210, 1},-- 强化斩杀2点
                  {210, 2},-- 强化斩杀2点
                  {102, 1},-- 偏斜5点
                  {102, 2},-- 偏斜5点
                  {102, 3},-- 偏斜5点
                  {102, 4},-- 偏斜5点
                  {102, 5},-- 偏斜5点 
                  {105, 1},-- 钢铁意志5点
                  {105, 2},-- 钢铁意志5点
                  {105, 3},-- 钢铁意志5点
                  {105, 4},-- 钢铁意志5点
                  {105, 5},-- 钢铁意志5点
                  {108, 1},-- 愤怒掌握1点   
                  {109, 1},-- 重伤3点
                  {109, 2},-- 重伤3点
                  {109, 3},-- 重伤3点
                  {101, 1},-- 强化英勇打击1点
                  {111, 1},-- 穿刺2点
                  {111, 2},-- 穿刺2点
            }
      end
      if SC:GetPlayer().Class=='DRUID' then
            LearnThisTalentList = {
                  {201, 1},-- 凶暴 5点
                  {201, 2},-- 凶暴 5点
                  {201, 3},-- 凶暴 5点
                  {201, 4},-- 凶暴 5点
                  {201, 5},-- 凶暴 5点
                  {204, 1},-- 野蛮冲撞 2点
                  {204, 2},-- 野蛮冲撞 2点
                  {205, 1},-- 厚皮 3点
                  {205, 2},-- 厚皮 3点
                  {205, 3},-- 厚皮 3点
                  {206, 1},-- 豹之迅捷 2点
                  {206, 2},-- 豹之迅捷 2点
                  {208, 1},-- 锋利兽爪 3点
                  {208, 2},-- 锋利兽爪 3点
                  {208, 3},-- 锋利兽爪 3点
                  {211, 1},-- 原始狂怒 2点
                  {211, 2},-- 原始狂怒 2点
                  {210, 1},-- 猛兽攻击 3点
                  {210, 2},-- 猛兽攻击 3点
                  {210, 3},-- 猛兽攻击 3点
                  {209, 1},-- 撕碎攻击 2点
                  {209, 2},-- 撕碎攻击 2点
                  {212, 1},-- 野蛮暴怒 2点
                  {212, 2},-- 野蛮暴怒 2点
                  {213, 1},-- 精灵之火 1点
                  {215, 1},-- 野性之心 5点
                  {215, 2},-- 野性之心 5点
                  {215, 3},-- 野性之心 5点
                  {215, 4},-- 野性之心 5点
                  {215, 5},-- 野性之心 5点
                  {218, 1},-- 兽群领袖 1点
                  {219, 1},-- 强化兽群领袖 2点
                  {219, 2},-- 强化兽群领袖 2点
                  {216, 1},-- 适者生存 3点
                  {216, 2},-- 适者生存 3点
                  {216, 3},-- 适者生存 3点
                  {220, 1},-- 狩猎天性 5点
                  {220, 2},-- 狩猎天性 5点
                  {220, 3},-- 狩猎天性 5点
                  {220, 4},-- 狩猎天性 5点
                  {220, 5},-- 狩猎天性 5点
                  {221, 1},-- 裂伤 1点
                  {301, 1},-- 强化野性印记 5点
                  {301, 2},-- 强化野性印记 5点
                  {301, 3},-- 强化野性印记 5点
                  {301, 4},-- 强化野性印记 5点
                  {301, 5},-- 强化野性印记 5点
                  {303, 1},-- 自然主义 5点
                  {303, 2},-- 自然主义 5点
                  {303, 3},-- 自然主义 5点
                  {303, 4},-- 自然主义 5点
                  {303, 5},-- 自然主义 5点
                  {308, 1},-- 清晰预兆 1点
                  {302, 1},-- 激怒 5点
                  {302, 2},-- 激怒 5点
                  {302, 3},-- 激怒 5点
                  {302, 4},-- 激怒 5点
                  {302, 5},-- 激怒 5点
                  {306, 1},-- 强烈3点
                  {306, 2},-- 强烈3点
                  {306, 3},-- 强烈3点
            }
      end
      if SC:GetPlayer().Class=='SHAMAN' then
            LearnThisTalentList = {
                  {201, 1}, --先祖知识5点
                  {201, 2}, --先祖知识5点
                  {201, 3}, --先祖知识5点
                  {201, 4}, --先祖知识5点
                  {201, 5}, --先祖知识5点
                  {204, 1}, --雷鸣猛击5点
                  {204, 2}, --雷鸣猛击5点
                  {204, 3}, --雷鸣猛击5点
                  {204, 4}, --雷鸣猛击5点
                  {204, 5}, --雷鸣猛击5点
                  {208, 1}, --萨满专注1点
                  {207, 1}, --强化图腾2点
                  {207, 2}, --强化图腾2点
                  {205, 1}, --强化幽灵之狼2点
                  {205, 2}, --强化幽灵之狼2点
                  {210, 1}, --乱舞5点
                  {210, 2}, --乱舞5点
                  {210, 3}, --乱舞5点
                  {210, 4}, --乱舞5点
                  {210, 5}, --乱舞5点
                  {214, 1}, --元素武器3点
                  {214, 2}, --元素武器3点
                  {214, 3}, --元素武器3点
                  {213, 1}, --灵魂武器1点
                  {211, 1}, --坚韧1点
                  {216, 1}, --武器掌握5点
                  {216, 2}, --武器掌握5点
                  {216, 3}, --武器掌握5点
                  {216, 4}, --武器掌握5点
                  {216, 5}, --武器掌握5点
                  {119, 1}, --风暴打击1点
                  {218, 1}, --双武器1点
                  {215, 1}, --精神敏锐3点
                  {215, 2}, --精神敏锐3点
                  {215, 3}, --精神敏锐3点
                  {220, 1}, --怒火释放5点
                  {220, 2}, --怒火释放5点
                  {220, 3}, --怒火释放5点
                  {220, 4}, --怒火释放5点
                  {220, 5}, --怒火释放5点
                  {221, 1}, --萨满之怒1点
                  {217, 1}, --双武器专精3点
                  {217, 2}, --双武器专精3点
                  {217, 3}, --双武器专精3点
                  {302, 1}, --潮汐集中5点
                  {302, 2}, --潮汐集中5点
                  {302, 3}, --潮汐集中5点
                  {302, 4}, --潮汐集中5点
                  {302, 5}, --潮汐集中5点
                  {301, 1}, --强化治疗波5点
                  {301, 2}, --强化治疗波5点
                  {301, 3}, --强化治疗波5点
                  {301, 4}, --强化治疗波5点
                  {301, 5}, --强化治疗波5点
                  {306, 1}, --自然指引3点
                  {306, 2}, --自然指引3点
                  {306, 3}, --自然指引3点
                  {305, 1}, --图腾集中4点
                  {305, 2}, --图腾集中4点
                  {305, 3}, --图腾集中4点
                  {305, 4}, --图腾集中4点
            }
      end
      --如果我是猎人
      if SC:GetPlayer().Class=='HUNTER' then
         SetSettings({
                  --当弹药数量少于多少时触发回城
                  AmmoAmountToGoToTown = 100,
            })
            if SC:GetPlayer().Level < 10 then --小于10级要购买弹药数量
                  SetSettings({
                  AmmoAmount = 400
            })
            elseif SC:GetPlayer().Level >= 10 and SC:GetPlayer().Level < 30 then --大于10级要购买弹药数量
                  SetSettings({
                  AmmoAmount = 1000
            })
            elseif SC:GetPlayer().Level >= 30 and SC:GetPlayer().Level <= 70 then --打于30级要购买弹药数量
                  SetSettings({
                  AmmoAmount = 1000
            })
            end
      end

      --最先加载的线程初始化
      SetSettings({
            LearnThisTalent = LearnThisTalentList,
            --其他人的怪物打我,真为反击，假为不反击,定点挂机用
            TapDeniedCounterattack = false,
            --任务超时
            TimeOutEvent = true,
            --卡住事件
		StuckEvent = true,
            --自动学天赋
            LearnTalent = false,
            --寻路导航间隔
            ReachDistance = 1.8,
            --售卖完了回到原位
            GotoOriginalAddress = false,
            --自动拒绝组公会邀请
            AutoDeclineGuild = true,
            --自动拒绝组组队邀请
            AutoDeclineGroup = true,
            --自动拒绝决斗邀请
            AutoDeclineDuel = true,
            --开启可以点停止按键,点开始就是点继续,防止傻子点错,中止行程变成重新开始
            ReButtonOnClick =true,
            --设定距离障碍物范围1～5
            agentRadius = 0.4,
            --使用食物
            UseFood = true,
            --使用饮料
            UseDrink = true,
            --開啟自動休息，不吃藥
            AutoRest = false,
            --找怪范围
            SearchRadius = 100,
            --贩卖低于等于颜色等级的
            SellbelowLevel=false,
            --不攻击等级低于自身等级多少以下的怪物
            NotAttackFewLevelsMonster= 5,
            --开启使用坐骑
            UseMount=true,
            --不走水路,假是不走水路,真是走水路
            WalkWater =false,
            --自动拾取
            AutoLoot = true,
            --勾选后，所有食物都吃,把包内食物/饮料吃完才会触发回城，不用设定FoodName与DrinkName
            EatAll = true,
            --是否判断回城事件
            GoHomeEvent = true,
            --恢复生命值范围
            FoodPercent = {70 ,90 ,},
            --恢复法力值范围
            DrinkPercent = {50 ,90 ,},
            --使用炉石
            UseHearthStone = false,
            --当背包空格小于等于多少时触发回城
            MinFreeBagSlotsToGoToTown = 2,
            --当装备耐久度小于等于%多少时触发回城
            MinDurabilityPercent = 20,
            --贩卖颜色等级0~8
            SellLevel = {[0] = true,[1] = true,[2] = true,},
            --不贩卖列表 
            DoNotSellList = {'Rune of','传送','Hearthstone','炉石','Skinning Knife','剥皮小刀','Mining Pick','矿工锄','Primal','源生','Mote of','微粒','Air','空气','基尔加丹印记',"Mark of Kil'jaeden","Thieves'Tools",'潜行者工具','Flash Powder','闪光粉'},
            --强制贩卖列表 如果需要可以自行添加
            --ForceSellList = {},
            --强制销毁
            ForceDeleteList = {'秘教的命令','Cabal Orders','OOX','瓦希塔帕恩的羽毛',"Washte Pawne's Feather",'拉克塔曼尼的蹄子',"Hoof of Lakota'mani",'被撕破的日记','A Mangled Journal'},
            --是否反击
            Counterattack = true,
            --自动换装
            AutoEquip = true,
            --输出信息写入Log
            WriteLog = true,
            --复活距离
            RetrieveDis = 30,
            --购买最好
            Buybest = true,
            -- --食物数量
            -- FoodAmount = 0,
            -- --饮料数量
            -- DrinkAmount = 0,
            -- 战斗循环自动buff
            CombatLoopAutoBuff = true,
            -- 自动战斗，追击，检取开关
            CombatIngSwitch = true,
            -- 自动吃喝
            AutoDrinkFood = true,
            --使用坐骑不攻击与反击
            UseMountWhenNotattack = true,
            --回家时不反击
            GoHomeNotattack = true,
            --下马距离
            DismountDistance = 40,
            --自动复活
            AutoRetrieve = true,
            --回家路径避免卡位
            GoHomePath = {},
            --离开家路径避免卡位
            LeaveHomePath = {},
            --回城坐标
            BuyNPC = {},
            --设定等待超时60秒
            TimeOut = 60,
            --报警储存
            BeepSound = {
                  --GM密语
                  GMMES = GetBeepPath('GM私密警报.wav'),
                  --GM TP
                  GMTP = GetBeepPath('GM传送警报.wav'),
                  --GM短距离TP
                  GMShortTP = GetBeepPath('GM短距离传送警报.wav'),
                  --其他密语
                  MES = GetBeepPath('玩家私密警报.wav'),
                  --玩家攻击
                  PlayerAttack = GetBeepPath('被玩家攻击警报.wav'),
                  --交易
                  Trade = GetBeepPath('交易警报.wav'),
               },

            --副本出入口不传送
            TPExceptPath = {
                  --黑暗之门
                  { -11907.7051, -3209.1658, -14.5401},
                  {-248.1130, 922.9000, 84.3497},
            },
            --不上坐骑
            NotUseMountPath = {
                   --杜隆塔尔
                  {1341.9160, -4647.4360,  distance = 15 , mapID = 1411},
                  --幽暗
                  {2062.3582, 263.3801,  distance = 20 , mapID = 1420},
                  {2064.0281, 270.0956,  distance = 20 , mapID = 1420},
                  --格罗姆高
                  {-12431.8154, 210.0732,  distance = 15 , mapID = 1434},
                  --奥格瑞玛
                  {1673.8619, -4338.1714,  distance = 15 , mapID = 1454},
                  --希利苏斯
                  {-6859.3345, 733.9985,  distance = 20 , mapID = 1451},
                  --诅咒之地苦痛堡垒
                  {-10944.0547, -3369.8418,  distance = 40 , mapID = 1419},
                  {-10953.0410, -3454.4758,  distance = 15 , mapID = 1419},
                  --幽暗城电梯
                  {1596.1678, 291.5745,  distance = 20 , mapID = 1458},
                  --加基森海盗洞
                  {-7805.9253, -4998.9248,  distance = 50 , mapID = 1446},
                  --地狱火半岛
                  {139.6259, 2668.5496,  distance = 50 , mapID = 1944},
                  {-164.1416, 2516.4055,  distance = 50 , mapID = 1944},
                  {-146.8090, 2619.0403,  distance = 50 , mapID = 1944},
                  {-155.9017, 2662.7883,  distance = 50 , mapID = 1944},
                  {-36.0416, 2673.1123,  distance = 100 , mapID = 1944},
                  --湿地采集
                  {-3102.5791, -3259.7576,  distance = 30 , mapID = 1437},
                  --荒芜之地采集
                  {-6475.7896, -2464.4644,  distance = 30 , mapID = 1418},
                  --冬泉谷旅店
                  {6717.5620, -4682.05717,  distance = 25 , mapID = 1452},
                  --月光林地不上坐骑
                  {7981.9111, -2576.7666,  distance = 500 , mapID = 1450},
            },
            --设置间距
            agentRadiusPath  = {
                  {1341.9160, -4647.4360,  distance = 40, agentRadius = 2 , mapID = 1411},
                  --幽暗
                  {2064.0281, 270.0956, distance = 100, agentRadius = 1 , mapID = 1420},
                  {1604.4379, 238.8718, -52.1473, distance = 2000, agentRadius = 1 , mapID = 1458},
                  {1604.4379, 238.8718, -52.1473, distance = 2000, agentRadius = 1 , mapID = 1420},
                  --格罗姆高
                  {-12431.8154, 210.0732,  distance = 100, agentRadius = 1 , mapID = 1434},
                  --奥格瑞玛
                  {1673.8619, -4338.1714,  distance = 2000, agentRadius = 1 , mapID = 1454},
                  {1971.7612, -4659.5713,  distance = 2000, agentRadius = 1 , mapID = 1454},
                  --暴风
                  {-8791.8115, 652.1405,  distance = 3000, agentRadius = 1 , mapID = 1453},
                  --铁炉堡
                  {-4800.1255, -1106.3363,  distance = 3000, agentRadius = 1 , mapID = 1455},
                  --乱风岗
                  {-5442.4072, -2429.4580,  distance = 100, agentRadius = 0.7 , mapID = 1441},
                  --血精灵8级旅店
                  {9477.5049, -6858.8687,   distance = 40, agentRadius = 1 , mapID = 1941},
                  --暴风
                  {-8984.1797, 1031.3445,   distance = 3000, agentRadius = 1 , mapID = 1453},
                  --夜色镇
                  {-10564.1055, -1163.6105,   distance = 200, agentRadius = 1 , mapID = 1431},
                  --沙塔斯
                  {-1863.2314, 5429.2129,   distance = 1000, agentRadius = 2 , mapID = 1955},
                  --塞尔萨马
                  {-5354.0601, -2952.9070,   distance = 500, agentRadius = 1 , mapID = 1432},
                  --荣耀堡
			{-679.5225, 2668.0742,   distance = 500, agentRadius = 1 , mapID = 1944},
                  --冬泉谷
                  {6715.5552, -4676.4077,  distance = 40, agentRadius = 0.5 , mapID = 1452},
                },
          })
          --如果我是战士或者盗贼的使用饮料
          if SC:GetPlayer().Class=='WARRIOR' or SC:GetPlayer().Class=='ROGUE' then
            --最先加载的线程初始化
            SetSettings({
            LearnThisTalent = LearnThisTalentList,
            --使用饮料
            UseDrink = false,
            --恢复生命值范围
            FoodPercent = {70 ,90 ,},
            --恢复法力值范围
            DrinkPercent = {0 ,0 },
            --DrinkPercent = {0 ,0 },
            })
          end
end)

Bot:SetStop(function()
      Log:System('=======================')
      Log:System("自定义打怪1029")
      Log:System("Custom Daguai 1029 starts ")
      Log:System('=======================')
end)

return Bot