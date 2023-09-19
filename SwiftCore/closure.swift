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


let isEvenAlt = { (i: Int8) -> Bool in i % 2 == 0 }
print(isEvenAlt(6))
print("sorted array", arr.sorted(by: >))

var tuple_data = [(2,"Swift") , (1, "Java"), (3, "Ruby"), (4, "Python"), (5, "Pearl")]
print(tuple_data.sorted(by: >))
