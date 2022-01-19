using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day10Solver inherit SolverBase

    // Private field to store the parsed data
    
    private _Data as List<string>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := data
        return
    
    protected override method Solve1() as object
        var openchar := List<char>{}
        openchar:Add('(')
        openchar:Add('[')
        openchar:Add('{')
        openchar:Add('<')
        var closechar := List<char>{}
        closechar:Add(')')
        closechar:Add(']')
        closechar:Add('}')
        closechar:Add('>')
        
        var templist := List<char>{}
        
        foreach var line in _Data
            var chars := line.ToCharArray()
            //var count:=0
            for var i:=1 upto(chars:Count())
                if openchar:Contains(chars[i])
                    templist:Add(chars[i])
                else
            exit
                //count:=i
                endif
            next
            var minus := 0
            for var j:=0 upto(templist:Count()-1)
            var index :=  openchar.IndexOf(templist[j])
                if (chars[(templist:Count()*2)-minus]==closechar[index])
                    nop()
                else
                    exit
                endif
                minus++
            next
        next
        
        return "0" // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        return nil // Use the _Data field to solve the 1th puzzle and return the result

end class
