local GameTable = class("GameTable", require("app.ui.game.GameTable"))


function GameTable:getHandCandsFen()
    -- 获取手牌的点数
    local fen_hand = 0

    print("--获取手牌的点数")
    if self.tableidx == self.gamescene:getMyIndex() or self.gamescene.name == "RecordScene"  then
        local list = ComHelpFuc.sortMyHandTile(clone(self.gamescene:getHandTileByIdx(self.tableidx)))

        -- printTable(list,"xp")

        for k,v in pairs(list) do
            local oldValue = 0
              for kk,vv in pairs(v.valueList) do
                if  oldValue ~= vv.real_value then
                    if vv.one_value < 4 then
                        if vv.num == 3 then 
                            fen_hand = fen_hand +  8   --绍3张6分
                        -- elseif vv.num == 4 then
                        --     fen_hand = fen_hand +  12   --绍4张12分
                        else
                            fen_hand = fen_hand +  vv.num  --其它数量，一个一分
                        end
                    else
                        if vv.num == 3 then
                           fen_hand = fen_hand +  4 --绍3张3分
                        -- elseif vv.num == 4 then
                        --    fen_hand = fen_hand +  8  --绍4张6分，
                        end
                    end
                end
                oldValue = vv.real_value
            end  
        end
    end
    return fen_hand
end

return GameTable