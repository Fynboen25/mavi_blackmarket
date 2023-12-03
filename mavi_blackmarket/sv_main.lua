RegisterNetEvent('give_item', function(item, amount, price)

    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local total_price = amount * price

    if xPlayer.canCarryItem(item, amount) then

        if xPlayer.getAccount('black_money').money >= total_price then


            xPlayer.removeAccountMoney('black_money', total_price)
            xPlayer.addInventoryItem(item, amount)


        else
            TriggerClientEvent('mavi:need_money', src, data)
        end

    else
        TriggerClientEvent('mavi:need_space', src, data)
    end

end)