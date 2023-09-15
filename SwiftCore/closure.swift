let closure = {(input:Int) ->Int in 
    return input * 2
}

// let closure1 = { _ in 
//    "swift programming language"
// } 

let obj = closure(4)
print(obj)

var arr = [10,20,30,40,50,60]
let result = { (item)-> Int in return item * 2}
print(arr.map(result))
