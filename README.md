Given a feed of dates on standard input, check if all of them are valid
and contiguous trading days.
This script is helpful for data integrity check, when it is necessary to validate
the stream of trading dates to be in proper sequential order.


1. INSTALLATION

You don't need to use composer for this package. Dependencies are installed using git modules.

```
cd Project_Directory
git clone git@github.com:mgweb/nyse-calendar.git .
git submodule update
```


2. USAGE

```
nyse-date-validator.php < DATES
```
DATES must have dates only, each on a separate line, like 
	2025-05-01
	2025-05-02
	...

Example:
```
for DAY in {1..30}; do date --date "2025-05-${DAY}" +%Y-%m-%d; done | nyse-date-validator.php
```


