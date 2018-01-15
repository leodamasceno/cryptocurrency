# Cryptocurrency

This repository is used to store scripts related to cryptocurrency operations. It uses the [coinmarketcap](https://coinmarketcap.com) API to retrieve the current price and change in the last 24h of a coin.

### What is necessary to run the scripts?

Simply install python and bash, that's it.

### Directory Structure

The terraform files and scripts can be found in the directories described hierarchically below:

```
.
├── scripts
 └── calc_profit.sh
 └── monitor_coin.sh
 └── coin_sniffer.sh
````

Use the **calc_profit.sh** to determine how much money you're making now and how much you will make in the future if the coin reaches the price you estimated, passing it as an argument to the script.

The second script, **monitor_coin.sh**, is used to check the price of a coin every 120 seconds (That can be easily changed in the script), it will show you the current price, the total (In dollars) and the last 24h change in percentage.

**coin_sniffer.sh** is a script used to verify the coins with lower price in the last XX minutes. That's a good option if you are looking for a coin that has been decreasing it's price in the last few minutes. That's how a lot of people are making money with cryptocurrency. They wait for the coin price to go down, buy it and then the price goes up again after hours, days or months.

### Examples
The example below will calculate the money spent, the current total (in dollars), the current profit, the estimated total and profit as well for the coin dogecoin.
```sh
./calc_profit.sh dogecoin 74469 0.0127 0.5
Money spent:      $31.7576
Total now:        $26.7982
Profit now:       -18.5066%
Total estimated:  $1250.3
Profit estimated: 97.46%
```

You can monitor the current price, current total and the changes in the last 24 hours using the **monitor_coin.sh** script.
```sh
./monitor_coin.sh ripple 2.19023
Current price:      $1.82596
Current total:      $3.9993
Percent change 24H: -1.77%
###############################
```

The example below checks for the first 20 coins (Ranked by coinmarketcap) with a small or big decrease in the past 30 minutes.
```sh
./coin_sniffer.sh 20 30
Coin:        Cash
Last 30 min: -0.0185%
#######################
Coin:        Litecoin
Last 30 min: -0.0198%
#######################
Coin:        NEM
Last 30 min: -0.014%
#######################
Coin:        Stellar
Last 30 min: -0.0735%
#######################
Coin:        IOTA
Last 30 min: -0.0152%
#######################
Coin:        EOS
Last 30 min: -0.014%
#######################
Coin:        Dash
Last 30 min: -0.0046%
#######################
Coin:        Monero
Last 30 min: -0.016%
#######################
Coin:        TRON
Last 30 min: -0.0635%
#######################
Coin:        Qtum
Last 30 min: -0.0254%
#######################
Coin:        Lisk
Last 30 min: -0.0146%
#######################
```
