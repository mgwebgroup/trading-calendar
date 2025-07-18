<?php
namespace MGWeb;

use MGWeb\DailyIterator;
use Yasumi\Yasumi;

// 
// Uses holiday provider for market closures specific to NYSE and NASDAQ exchanges
// 

class TradingCalendar extends \FilterIterator
{
	public const PROVIDER = 'USA/NYSE';


    public function __construct(
        DailyIterator $iterator
    ) {
        parent::__construct($iterator);
    }

    public function accept(): bool
    {
        $date = $this->getInnerIterator()->current();
        try {
			$holidays = Yasumi::create('USA', (int) $date->format('Y'));
            return $holidays->isWorkingDay($date);
        } catch (\ReflectionException $e) {
            throw new \Exception($e->getMessage());
        }
    }
}
