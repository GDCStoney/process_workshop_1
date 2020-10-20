# method only module required - no history, etc

module LeapYear

  def self.leap_year?(test_year)
    return true if test_year % 400 == 0
    return false if test_year % 100 == 0
    return true if test_year % 4 == 0
    return false
  end

  def self.leap_range(year1, year2)
    # initial assumption date1 < date2
    Array(year1..year2).select { |test_year| leap_year?(test_year) }
  end
end
