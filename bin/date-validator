#!/usr/bin/env php 
<?php
require dirname(__DIR__).'/lib/Autoloader.php';

use MGWeb\DailyIterator;
use MGWeb\NYSECalendar;

$stdin = fopen('php://stdin', 'r');

$dailyIterator = new DailyIterator();
$dailyIterator->setDirection(1);
$timeZone = new \DateTimeZone('America/New_York');
$tradingCalendar = new NYSECalendar($dailyIterator);

$counter = 1;

try {
	if (($inputDateString = fgets($stdin)) != PHP_EOL) {
		$inputDate = new DateTime($inputDateString, $timeZone);
		$dailyIterator->setStartDate($inputDate, $timeZone);
		foreach ($tradingCalendar as $expectedDate) {
			if ($expectedDate->format('z') != $inputDate->format('z'))
				throw new \Exception(
					sprintf('Line %d: Dates do not match. Input %s Expected %s'.PHP_EOL, 
					$counter, $inputDate->format('Y-m-d'), $expectedDate->format('Y-m-d')
					)
				);
			while (($inputDateString = fgets($stdin)) == PHP_EOL)
				$counter++;
			if (!$inputDateString)
				break;
			$inputDate = new \DateTime($inputDateString, $timeZone);
			$counter++;
		}
	} else {
		throw new \Exception('Either no dates in the input file, or first line is empty.');
	}
} catch (\Exception $e) {
	$stderr = fopen('php://stderr', 'w');
	fwrite($stderr, sprintf('ERROR: %s'.PHP_EOL, $e->getMessage()));
	fclose($stderr);
	exit(1);
}

