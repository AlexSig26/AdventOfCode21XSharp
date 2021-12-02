using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day01Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<int>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<int>{}
        _Data := data.Select({x => Convert:ToInt32(x)}):ToList()
        /*for var i := 0 upto data:Count - 1
            var x = Int32:Parse(data[i])
            
            _Data:Add(x)
        next*/
        
        return
    
    protected override method Solve1() as object
        var lastnumber := 0
        var counter := 0
        for var i := 0 upto _Data:Count - 1
            var number := _Data[i]
            if lastnumber > 0
                if lastnumber < number
                    counter++
                endif
            endif
            lastNumber := number
        next
        return counter// Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        
        var lastnumber := 0
        var counter := 0
        
        for var i := 0 upto _Data:Count - 3
            var listofThree := List<int>{}
            listofThree:Add(_Data[i])
            
            listofThree:Add(_Data[i+1])
            listofThree:Add(_Data[i+2])
            
            var number := listofThree:Sum();
            
            if lastnumber > 0
                if lastnumber < number
                    counter++
                endif
            endif
            
            lastNumber := number
        next
        
        
        return counter // Use the _Data field to solve the 1th puzzle and return the result

end class
