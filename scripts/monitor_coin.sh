#!/bin/bash
###################################################################
# Created by: Leonardo Damasceno <damasceno.lnx@gmail.com>        #
# Function: Monitors a coin specified by the user                 #
# Example: ./monitor_coin.sh COIN_NAME COIN_AMOUNT                 #
# Example: ./monitor_coin.sh dogecoin 74469.838163                 #
# Example: ./monitor_coin.sh bitcoin 2.19023                       #
###################################################################

COIN=$1
AMOUNT=$2

while true
do
  CURRENT_PRICE=$(curl -s https://api.coinmarketcap.com/v1/ticker/$COIN/ | grep --color=no price_usd | grep --color=no -Eo '[0-9.]+')
  CURRENT_TOTAL=$(python -c "print (round(($AMOUNT*$CURRENT_PRICE),4))")
  PERCENT_CHANGE_24H=$(curl -s https://api.coinmarketcap.com/v1/ticker/$COIN/ | grep --color=no percent_change_24h | cut -d '"' -f4)

  echo "Current price:      $"$CURRENT_PRICE
  echo "Current total:      $"$CURRENT_TOTAL
  echo "Percent change 24H: "$PERCENT_CHANGE_24H"%"
  echo "###############################"
  sleep 120
done
