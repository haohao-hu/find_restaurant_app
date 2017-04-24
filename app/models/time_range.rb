class TimeRange < ActiveRecord::Base
	private

	def f(time)
        if time.is_a? String
         return time
        else
        return time.strftime("%H:%M")
        end		
	end

    public
  
    def initialize(t_start,t_end)
    	@start = f(t_start)
    	@end = f(t_end)
    end

    def include?(time)
        time = f(time)
    	if @start<@end
    	   return (@start..@end).include?(time)
    	elsif @start>@end
           return !(@end..@start).include?(time)
    	end 	
    end
end
