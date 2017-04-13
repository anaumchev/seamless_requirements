class CLOCK
feature
  second, minute, hour: INTEGER

  tick
    do
      if second < 59 then second := second + 1
      else second := 0
        if minute < 59 then minute := minute + 1
        else minute := 0
          if hour < 23 then hour := hour + 1
          else hour := 0
          end
        end
      end
    ensure
      old second < 59 implies second = old second + 1
      old second = 59 implies second = 0
      old second = 59 and old minute < 59 implies minute = old minute + 1
      old second = 59 and old minute = 59 implies minute = 0
      old second < 59 implies minute = old minute
      old second = 59 and old minute = 59 and old hour < 23 implies hour = old hour + 1
      old second = 59 and old minute = 59 and old hour = 23 implies hour = 0
      old second < 59 implies hour = old hour      
    end
end
