using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day02Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<string>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        
        _Data := data 
        return
    
    protected override method Solve1() as object
        var depth:=0
        var horiz:=0
        for var i := 0 upto _Data:Count - 1
            //var data[i]:Split(" ")
            var values := _Data[i]:Split(' ')
            var key := values[1]
			var val := Int32:Parse(values[2])
            
            if (key == "down")
                depth := depth + val
            elseif (key == "up")
                depth := depth - val
            elseif (key == "forward")
                horiz := horiz + val
                endif
                    
            
        next
        
        return depth * horiz // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var depth := 0
        var horiz := 0
        var aim := 0
        
        for var i := 0 upto _Data:Count - 1
            var values := _Data[i]:Split(c" ")
            var key := values[1]
			var val := Int32:Parse(values[2])
            
            if (key == "down")
                aim := aim + val
            elseif (key == "up")
                aim := aim - val
            elseif (key == "forward")
                horiz := horiz + val
                depth := depth + aim * val
            endif
                    
            
        next
        return depth * horiz // Use the _Data field to solve the 2nd puzzle and return the result
    
end class
