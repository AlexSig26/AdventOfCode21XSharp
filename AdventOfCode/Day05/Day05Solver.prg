using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day05Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<string>
    private _strnumbers as List<string>
    private _strdoublenumbers as List<string>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := data
        return
    
    protected override method Solve1() as object
            _strnumbers := List<string>{}
            _strdoublenumbers := List<string>{}
            
            // An entry like 1,1 -> 1,3 covers points 1,1, 1,2, and 1,3.
            // An entry like 9,7 -> 7,7 covers points 9,7, 8,7, and 7,7.
           foreach var line in _Data
                var myvalues := line:Split(' ')
                var x1 := Convert.ToInt32(myvalues[1].Split(',')[1])
                var y1 := Convert.ToInt32(myvalues[1].Split(',')[2])
                var x2 := Convert.ToInt32(myvalues[3].Split(',')[1])
                var y2 := Convert.ToInt32(myvalues[3].Split(',')[2])
                
                //var cResult := ""
                if x1 == x2
                    self:CheckAndFillValue(y1, y2,x1,"x") 
                elseif y1 == y2
                    self:CheckAndFillValue(x1, x2,y1,"y") 
                endif
                
            next
            
            var ret := _strdoublenumbers:Count():ToString()
            
        return ret // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        //An entry like 1,1 -> 3,3 covers points 1,1, 2,2, and 3,3.
        //An entry like 9,7 -> 7,9 covers points 9,7, 8,8, and 7,9.
        //An 6,4 -> 2,0 -> 5,3 4,2 3,1 0,2
        
        _strnumbers := List<string>{}
            _strdoublenumbers := List<string>{}
            
         
            foreach var line in _Data
                var myvalues := line:Split(' ')
                var x1 := Convert.ToInt32(myvalues[1].Split(',')[1])
                var y1 := Convert.ToInt32(myvalues[1].Split(',')[2])
                var x2 := Convert.ToInt32(myvalues[3].Split(',')[1])
                var y2 := Convert.ToInt32(myvalues[3].Split(',')[2])
                
                
                if x1 == y1 .and. x2 == y2
                    self:CheckAndFillDiagonals(x1 , x2)
                elseif (x1 == y2 .and. y1 == x2)
                    self:CheckAndFillDiagonals2(x1 , x2)
                elseif (x1 <> x2 .and. y1 <> y2)
                    self:CheckAndFillDiagonals3(x1 , x2, y1,y2)
                elseif x1 == x2
                    self:CheckAndFillValue(y1, y2,x1,"x") 
                elseif y1 == y2
                    self:CheckAndFillValue(x1, x2,y1,"y") 
                
                endif
                
            next
            
            var ret := _strdoublenumbers:Count():ToString()
        
        return ret // Use the _Data field to solve the 1th puzzle and return the result
        
        public method CheckAndFillDiagonals(val1 as int,val2 as int)  as void strict
            var cResult :=""
            if val1 < val2
                for var i := val1 upto(val2)
                    cResult := i:ToString()+","+i:ToString()
                    self:FillLists(cResult)
                next 
            elseif val1 > val2
                for var i := val1 downto(val2)
                    cResult := i:ToString()+","+i:ToString()
                    self:FillLists(cResult)
                next 
            endif
            return
            
        public method CheckAndFillDiagonals2(val1 as int,val2 as int)  as void strict
            var cResult :=""
            if val1 < val2
                for var i := val1 upto(val2)
                    cResult := i:ToString()+","+(val2-(val1+i)):ToString()
                    self:FillLists(cResult)
                next 
            elseif val1 > val2
                for var i := val1 downto(val2)
                    //if i < val2 
                        cResult := i:ToString()+","+(val2+(val1-i)):ToString()
                        self:FillLists(cResult)
                    //endif
                next
            endif
            
            
            
            return
            
            public method CheckAndFillDiagonals3(valx1 as int,valx2 as int ,valy1 as int , valy2 as int )  as void strict
            var cResult :=""
            var j:=0
            if valx1 > valx2
                for var i:= valx1 downto (valx2)
                    var y := 0
                    if valy1 > valy2
                        y := valy1 - j
                    else
                        y := valy1 + j
                    endif
                    cResult := i:ToString()+","+y:ToString()
                    self:FillLists(cResult)
                    j++
                next
            elseif valx2 > valx1
                j := 0
                for var i := valx1 upto(valx2)
                    var y := 0
                    if valy1 > valy2
                        y := valy1 - j
                    else
                        y := valy1 + j
                    endif
                    cResult := i:ToString()+","+y:ToString()
                    self:FillLists(cResult)
                    j++
                next
            endif
            return
        
    public method CheckAndFillValue(val1 as int, val2 as int,fixedval as int, type as string) as void strict
           var cResult :=""
            if val1 < val2
                for var i := val1 upto(val2)
                    if type == "x"
                        cResult := fixedval:ToString()+","+i:ToString()
                    else
                        cResult := i:ToString()+","+fixedval:ToString()
                    endif
                    self:FillLists(cResult)
                next
            elseif val1 > val2
                for var i := val1 downto(val2)
                    if type == "x"
                        cResult := fixedval:ToString()+","+i:ToString()
                    else
                        cResult := i:ToString()+","+fixedval:ToString()
                    endif
                    self:FillLists(cResult)
                next
            endif
        return
        
        public method FillLists(cResult as string) as void strict
            if !_strnumbers:Contains(cResult)
                _strnumbers:Add(cResult)
            elseif !_strdoublenumbers:Contains(cResult)
                _strdoublenumbers:Add(cResult)
            endif
            return

end class
