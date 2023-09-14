let operations:[String: (Int, Int)->Int] = [
    "addition": (+),
    "subtraction": (-),
    "multiplication":(*),
    "division": (/)
]


let arr = [20, 30, 40, 50, 60]

if let op = operations["multiplication"]{
    let sum = arr.reduce(1 , op)
    print("sum of the array elements are:" , sum)

}


let factorial = (1...5).reduce(1, *)
print(factorial)
