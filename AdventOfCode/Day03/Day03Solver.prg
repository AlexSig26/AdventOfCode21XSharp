using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day03Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<char[]>
    private _Data2 as List<char[]>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<char[]>{}
        _Data2 := List<char[]>{}
        _Data := data.Select({x => x:ToCharArray()}):ToList()
        _Data2 := data.Select({x => x:ToCharArray()}):ToList()
        return
    
    protected override method Solve1() as object
        
        var gamma := List<int>{}
        var epsilon := List<int>{}
        for var i := 1 upto 12
            var binaries := List<int>{}
            foreach var item in _Data
                binaries:Add(Convert:ToInt32(item[i]:ToString()))
            next
            var countone := binaries.Where({x=>x==1}):Count();
            
            if countone > binaries:Count() / 2
                gamma:Add(1)
                epsilon:Add(0)
            else
                gamma:Add(0)
                epsilon:Add(1)
            endif                
        next
        
        var sgamma:="" 
        var sepsilon:=""
        foreach var sg in gamma
            sgamma += sg:ToString()
        next
        foreach var se in epsilon
            sepsilon += se:ToString()
        next
        var decepsilon := Convert:ToInt32(sepsilon, 2)
        var decgamma := Convert:ToInt32(sgamma, 2)
        
        return decgamma*decepsilon // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        
        var ogr := List<char[]>{}
        var csr := List<char[]>{}
        ogr := _Data
        csr := _Data
        ogr := self:GetList(_Data, 1) 
        csr := self:GetList(_Data2, 2) 
        
        var str := ""
        
         var str1 := ""
        
        for var i:=1 upto ogr[0]:Length
            str += ogr[0][i]:ToString()
            str1 += csr[0][i]:ToString()
        next
        
       
        var n1 := Convert:ToInt32(str, 2)
        var n2 := Convert:ToInt32(str1, 2)
        return n1 * n2 // Use the _Data field to solve the 1th puzzle and return the result

    method GetList(data as List<char[]> , type as int) as List<char[]> strict
        
        do while data:Count() > 1 
            for var i := 1 upto 12
                var numberogr := 0
                var binaries := List<int>{}
                foreach var item in data
                    binaries:Add(Convert:ToInt32(item[i]:ToString()))
                next
                var countone := binaries.Where({x=>x==1}):Count()
                var countzero := binaries.Where({x=>x==0}):Count()
                if type==1
                    if countone >= countzero
                        numberogr := 1
                    else
                        numberogr := 0
                    endif
                else
                    if countone >= countzero
                        numberogr := 0
                    elseif countone <  countzero
                        numberogr := 1
                    endif
                endif
                
                if data:Count() > 1
                    data:RemoveAll({x => x[i]:ToString() <> numberogr:ToString() })
                endif
            next
        end do
        
        return data
        
end class
