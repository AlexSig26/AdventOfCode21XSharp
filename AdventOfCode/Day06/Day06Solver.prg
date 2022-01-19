using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day06Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<int>
    private _Data2 as List<string>
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<int>{}
        var values := data[0]:Split(',') //:ToList<int>()
         for var i := 1 upto(values:Count())
                _Data:Add(Convert:ToInt32(values[i]))
            next            
        _Data2 := List<string>{}
        _Data2 := data
        return
    
    protected override method Solve1() as object
        var anztage := 1
        do while anztage<81
            var counter := _Data:Count() - 1
            for var i := 0 upto(counter)
                _Data[i]--
                if _Data[i] == -1
                    _Data:Add(8)
                    _Data[i] := 6
                endif
            next 
            anztage++
        enddo
        
        return _Data:Count:ToString() // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var anztage := 1
        var s:= _Data
        //var valList := List<int64>{}
        //stringList:Add(s)
        
        //var strvalues := Convert:ToInt((s:Replace(",":ToString(),string.Empty))):ToList<int){}
        var dic := Dictionary<int,int64>{}
        
        for var i:=0 upto(8)
            dic:Add(i,0)
        next
        
        var counter:=0        
        foreach var item in s
            counter++
            if dic.ContainsKey(item)
                dic.TryGetValue(item,out var oldvalue)
                var newval := oldvalue+1
                dic[item] := newval
            else
                dic.Add(item,1)
            endif
            
        next
        
        do while anztage<257
            var oldvalue0 := self:GetOldValue(dic,0)
            var oldvalue1 := self:GetOldValue(dic,1)
            var oldvalue2 := self:GetOldValue(dic,2)
            var oldvalue3 := self:GetOldValue(dic,3)
            var oldvalue4 := self:GetOldValue(dic,4)
            var oldvalue5 := self:GetOldValue(dic,5)
            var oldvalue6 := self:GetOldValue(dic,6)
            var oldvalue7 := self:GetOldValue(dic,7)
            var oldvalue8 := self:GetOldValue(dic,8)
            
            dic[0]:=oldvalue1
            dic[1]:=oldvalue2
            dic[2]:=oldvalue3
            dic[3]:=oldvalue4
            dic[4]:=oldvalue5
            dic[5]:=oldvalue6
            dic[6]:=oldvalue0+oldvalue7
            dic[7]:=oldvalue8
            dic[8]:=oldvalue0
        
               
        anztage++
            
        end do
        local result as int64 
        result:=0
        for var i:=0 upto(8)
            result+=dic[i]
        next  
    
        return result:ToString()//stringList:Count:ToString() // Use the _Data field to solve the 1th puzzle and return the result
    
       // return 0 // Use the _Data field to solve the 1th puzzle and return the result

method GetOldValue(dic as Dictionary <int,int64>, key as int) as int64 strict
    dic.TryGetValue(key,out var oldvalue)
    return oldvalue
      

method GetNewString(mystring as string, pos as int, strval as string) as string strict
    var aStringBuilder := StringBuilder{mystring}
    aStringBuilder.Remove(pos, 1)
    aStringBuilder.Insert(pos, strval)
    
    return aStringBuilder.ToString()
    
end class
