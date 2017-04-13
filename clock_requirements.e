note explicit: wrapping -- For AutoProof.

deferred class CLOCK_REQUIREMENTS
feature
  -- A clock tick:

  req_1 (clock: CLOCK; current_second: INTEGER)
      -- increments current second if it is
      -- smaller than 59.
    require
      modify (clock)
      clock.second < 59
      clock.second = current_second
    do
      clock.tick
    ensure
      clock.second = current_second + 1
    end

  req_2 (clock: CLOCK)
      -- resets current second to 0 if it
      -- equals 59.
    require
      modify (clock)
      clock.second = 59
    do
      clock.tick
    ensure
      clock.second = 0
    end

  req_3 (clock: CLOCK; current_minute: INTEGER)
      -- increments current minute if the time
      -- is HH:MM:59 for MM smaller than 59
    require
      modify (clock)
      clock.second = 59
      clock.minute < 59
      clock.minute = current_minute
    do
      clock.tick
    ensure
      clock.minute = current_minute + 1
    end

  req_4 (clock: CLOCK)
      -- resets current minute to 0 if it equals
      -- 59 and the current second equals 59.
    require
      modify (clock)
      clock.second = 59
      clock.minute = 59
    do
      clock.tick
    ensure
      clock.minute = 0
    end

  req_5 (clock: CLOCK; current_minute: INTEGER)
      -- keeps current minute if  current
      -- second is smaller than 59.
    require
      modify (clock)
      clock.second < 59
      clock.minute = current_minute
    do
      clock.tick
    ensure
      clock.minute = current_minute
    end

  req_6 (clock: CLOCK; current_hour: INTEGER)
      -- increments current hour if the time
      -- is HH:59:59 for HH smaller than 23.
    require
      modify (clock)
      clock.second = 59
      clock.minute = 59
      clock.hour < 23
      clock.hour = current_hour
    do
      clock.tick
    ensure
      clock.hour = current_hour + 1
    end

  req_7 (clock: CLOCK)
      -- resets current hour to 0 if the time
      -- is 23:59:59
    require
      modify (clock)
      clock.second = 59
      clock.minute = 59
      clock.hour = 23
    do
      clock.tick
    ensure
      clock.hour = 0
    end

  req_8 (clock: CLOCK; current_hour: INTEGER)
      -- keeps current hour if current second
      -- is smaller than 59.
    require
      modify (clock)
      clock.second < 59
      clock.hour = current_hour
    do
      clock.tick
    ensure
      clock.hour = current_hour
    end

end

