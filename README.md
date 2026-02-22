1. INTRODUCTION

The package features two php scripts. All executables are contained in bin directory.
* date-validator checks stream of trading dates for continuity, i.e. dates exclude weekends and holidays for when New York Stock Exchange (NYSE) is closed. 
* date-generator lists trading dates in ascending order starting from START_DATE and ending either on END_DATE (inclusive) or current date if the END_DATE is not given.

Data for tracking open market is accurate from year 2000. Exchanges like NASDAQ and CBOE, normally follow the NYSE calendar.


2. INSTALLATION

Package is composer free and is installed using git modules.

```
git clone --recurse-submodules git@github.com:mgweb/trading-calendar.git
```


3. USAGE

```
./bin/date-validator < DATES_FILE
```
DATES_FILE must have dates only, each on a separate line, like 
	2025-05-01
	2025-05-02
	...

Format of each date can be any format accepted by [PHP DateTime constructor](https://php.net/manual/en/datetime.formats.php).


Examples:
```
# Validate date stream for the month of May-2025:
for DAY in {1..30}; do date --date "2025-05-${DAY}" "+%Y-%m-%d"; done | ./bin/date-validator

# Validate a single date:
echo "2022-02-22T06:00+03:00" | ./bin/date-validator

# Generate trading dates from January 1st 2025 to February 28th same year:
bin/date-generator --start-date=2025-01-01 --end-date=2025-02-28
# Outputs:
# 2025-01-02
# 2025-01-03
# ...
# 2025-02-28
```
