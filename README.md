1. INTRODUCTION

Given a feed of dates on standard input, check if all of them are valid and contiguous trading days according to trading schedule of an exchange. The package currently utilizes holidays and closures provider for the New York Stock Exchange (NYSE). The script is helpful for data integrity check, when it is necessary to validate a stream of dates to be in proper sequential order as well as to verify market is open.

Data for tracking open market is accurate from year 2000. Exchanges like NASDAQ and CBOE, normally follow the NYSE calendar.


2. INSTALLATION

Package is installed using git modules.

```
git clone --recurse-submodules git@github.com:mgweb/trading-calendar.git
```


3. USAGE

```
./bin/date-validator < DATES
```
DATES must have dates only, each on a separate line, like 
	2025-05-01
	2025-05-02
	...

Format of each date can be any format accepted by [PHP DateTime constructor](https://php.net/manual/en/datetime.formats.php).


Example:
```
for DAY in {1..30}; do date --date "2025-05-${DAY}" +%Y-%m-%d; done | ./bin/date-validator

echo "2022-02-22T06:00+03:00" | ./bin/date-validator
```
