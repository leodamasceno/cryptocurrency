#!/bin/bash
###################################################################
# Created by: Leonardo Damasceno <damasceno.lnx@gmail.com>        #
# Function: Checks the profit based on how much you invested      #
# Example: ./calc_profit.sh COIN_AMOUNT PREVIOUS_RATE FUTURE_RATE #
# Example: ./calc_profit.sh 74469 0.0127 0.05                     #
###################################################################

AMOUNT=$1
OLD_PRICE=$2
ESTIMATED_PRICE=$3
CURRENT_PRICE=$(curl -s https://api.coinmarketcap.com/v1/ticker/dogecoin/ | grep --color=no price_usd | grep --color=no -Eo '[0-9.]+')

MONEY_SPENT=$(python -c "print ($AMOUNT*$OLD_PRICE)")
MONEY_NOW=$(python -c "print ($AMOUNT*$CURRENT_PRICE)")
MONEY_ESTIMATED=$(python -c "print ($AMOUNT*$ESTIMATED_PRICE)")
PROFIT_NOW=$(python -c "print (100-(($OLD_PRICE*100)/$CURRENT_PRICE))")
PROFIT_ESTIMATED=$(python -c "print (100-(($OLD_PRICE*100)/$ESTIMATED_PRICE))")

echo "Money spent:      $"$(python -c "print (round($MONEY_SPENT,4))")
echo "Total now:        $"$(python -c "print (round($MONEY_NOW,4))")
echo "Profit now:       "$(python -c "print (round($PROFIT_NOW,4))")"%"
echo "Total estimated:  $"$(python -c "print (round($MONEY_ESTIMATED,4))")
echo "Profit estimated: "$(python -c "print (round($PROFIT_ESTIMATED,4))")"%"
