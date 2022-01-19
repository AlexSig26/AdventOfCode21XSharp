using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day07Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<int>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<int>{}
        var values := data[0]:Split(',') //:ToList<int>()
        for var i := 1 upto(values:Count())
            _Data:Add(Convert:ToInt32(values[i]))
        next   
        return
    
    protected override method Solve1() as object
        var listcalced := List<Result>{}
        foreach var item in _Data
            var exists := listcalced.Where({x=>x:number == item }):Count() > 0
            if (!exists)
                var calc := self:CalcAndGetValue(item)
                var result := Result{}
                result:calcednumber:=calc
                result:number:=item
                listcalced:Add(result)
            endif
        next
        var min := listcalced:Min({r=> r.calcednumber})
     
        return min // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var listcalced := List<Result>{}
        var min := _Data:Min({x => x})
        var max := _Data:Max({x => x})
        //foreach var item in _Data
        for var i:=min upto(max)
            var item := i
            var exists := listcalced.Where({x=>x:number == item }):Count() > 0
            if (!exists)
                var calc := self:CalcAndGetValue2(item)
                var result := Result{}
                result:calcednumber:=calc
                result:number:=item
                listcalced:Add(result)
            endif
        next
        var minres := listcalced:Min({r=> r.calcednumber})
        return minres // Use the _Data field to solve the 1th puzzle and return the result

    public method CalcAndGetValue(item as int) as int strict
        var val := 0
        foreach var v in _Data
            val+=Math.Abs(item - v)
        next
        
        return val
     public method CalcAndGetValue2(item as int) as int strict
        var val := 0
        foreach var v in _Data
            var sum := self:GetSumme(1, Math.Abs(item - v))
            val+=sum
        next
        
        return val
        
 public method GetSumme(min as int, max as int) as int strict
    return ((max-min)+1) * (min + max) / 2

end class
class Result
property number as int auto get set
property calcednumber as int auto get set

end class