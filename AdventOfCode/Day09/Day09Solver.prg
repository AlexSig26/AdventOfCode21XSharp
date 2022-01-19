using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day09Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<string>
    private _lowestpoints as List<int>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        //_Data := List<int>{}
        _Data := data//data.Select({x => Convert:ToInt32(x)}):ToList()



        return
    
    protected override method Solve1() as object
        _lowestpoints := List<int>{}
        for var row := 0 upto(_Data:Count() -1)
            var numbers := _Data[row]:ToCharArray()
            for var col := 1 upto(numbers:Count())
                var checkleft := true
                var checktop := true
                var checkbottom := true
                var checkright := true
                
                if row == 0
                    checktop := false
                elseif row ==  _Data:Count() - 1
                    checkbottom := false
                endif
                
                if col == 1
                    checkleft := false
                elseif col == numbers:Count()
                    checkright := false
                endif
                
                if self:CheckIfLowestPoint(checkleft,checktop,checkright,checkbottom,row,col)
                    _lowestpoints:Add(Convert:ToInt32(_Data[row]:ToCharArray()[col]:ToString())) 
                endif
                
              
            next
        next
        var sum := _lowestpoints:Sum() + _lowestpoints:Count()
        
        return sum:ToString() // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        return nil // Use the _Data field to solve the 1th puzzle and return the result

    public method CheckIfLowestPoint(checkleft as logic,checktop as logic,checkright as logic,checkbottom as logic, row as int, col as int) as logic strict
        //var line := _Data[row]
        var myValue := Convert:ToInt32(_Data[row]:ToCharArray()[col]:ToString())
        if checkLeft
            if myValue >= Convert:ToInt32(_Data[row]:ToCharArray()[col-1]:ToString())
                return false
            endif
        endif
        if checktop
            if myValue >= Convert:ToInt32(_Data[row-1]:ToCharArray()[col]:ToString())
                return false
            endif
        endif
        if checkright
            if myValue >= Convert:ToInt32(_Data[row]:ToCharArray()[col+1]:ToString())
                return false
            endif
        endif
        if checkbottom
            if myValue >= Convert:ToInt32(_Data[row + 1]:ToCharArray()[col]:ToString())
                return false
            endif
        endif
        
        return true

end class
