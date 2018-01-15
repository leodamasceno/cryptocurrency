#!/bin/bash
##############################################################################
# Created by: Leonardo Damasceno <damasceno.lnx@gmail.com>                   #
# Function: Checks the profit based on how much you invested                 #
# Example: ./coin_sniffer.sh NUM_OF_COINS MINUTES                            #
# Example: ./coin_sniffer.sh 80 20                                           #
##############################################################################

NUM_OF_COINS=$1
MINUTES=$2
curl -s "https://api.coinmarketcap.com/v1/ticker/?start=0&limit=$NUM_OF_COINS" | grep --color=no -E '(name|price_usd|percent_change_1h)' > /tmp/coins.txt
COINS=($(grep name /tmp/coins.txt | cut -d '"' -f4))

for coin_name in "${COINS[@]}"
do
  PERCENTAGE_LAST_24H=$(grep -A 2 "$coin_name" /tmp/coins.txt | tail -n 1 | cut -d '"' -f4)
  if [ $(echo "$PERCENTAGE_LAST_24H < 0" |bc) -eq 1 ];
  then
    TOTAL_LAST_10_MIN=$(python -c "print (($PERCENTAGE_LAST_24H*$MINUTES)/1440)")
    echo "Coin:        "$coin_name
    echo "Last $MINUTES min: "$(python -c "print round($TOTAL_LAST_10_MIN,4)")"%"
    echo "#######################"
  fi
done
