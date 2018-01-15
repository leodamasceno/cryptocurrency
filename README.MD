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
````

Use the **calc_profit.sh** to determine how much money you're making now and how much you will make in the future if the coin reaches the price you estimated, passing it as an argument to the script.

The second script, **monitor_coin.sh**, is used to check the price of a coin every 120 seconds (That can be easily changed in the script), it will show you the current price, the total (In dollars) and the last 24h change in percentage.


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
