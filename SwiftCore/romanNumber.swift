import Foundation

class Solution{
    func romanToInteger(with roman:String) ->Int {
        //  print(roman , roman.count)
         var map:[Character: Int] = ["I": 1,
                    "V": 100 , 
                    "X": 10,
                    "L": 50,
                    "C": 100,
                    "D": 500,
                    "M": 1000
                    ]
         let n  = roman.count
         let result = map[roman.last!]
        
        for (i) in stride(from: n - 2, to: 0, by: -1){
                
        }

         return 0
    }

}

var str = "IVXLDCM"
var obj = Solution()
obj.romanToInteger(with: "XVIMDL")
