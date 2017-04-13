note explicit:wrapping

deferred class EXTENDED_CLOCK_REQUIREMENTS
  -- The present class contains requirements
  -- for a clock equipped with a days counter.
inherit CLOCK_REQUIREMENTS
feature
  -- A clock tick:

  req_9 (clock: CLOCK; current_day: INTEGER)
      -- increments current day at 23:59:59,
      -- if it is not Sunday.
    require
      modify (clock)
      clock.second = 59
      clock.minute = 59
      clock.hour = 23
      clock.day < 6
      clock.day = current_day
    do
    clock.tick
    ensure
    clock.day = current_day + 1
    end

  req_10 (clock: CLOCK)
      -- resets current day to Monday after
      -- a clock tick at 23:59:59 on Sunday.
    require
      modify (clock)
      clock.second = 59
      clock.minute = 59
      clock.hour = 23
      clock.day = 6
    do
      clock.tick
    ensure
      clock.day = 0
    end
  
  req_11 (clock: CLOCK; current_day: INTEGER)
      -- keeps current day if current
      -- second is smaller than 59.
    require
      modify (clock)
      clock.second < 59
      clock.day = current_day
    do
      clock.tick
    ensure
      clock.day = current_day
    end

end
