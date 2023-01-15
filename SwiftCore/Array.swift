// Swift sorting array elements
var array = [50,10,20,30,40]
let sortedArray = array.sorted(by: {(num1 , num2) -> Bool in 
print(num1 , num2)
  return num1 < num2
})

print(sortedArray)
