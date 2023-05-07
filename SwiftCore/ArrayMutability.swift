import Foundation

var str =  ["Swift", "Python","Java", "JavaScript" , "Ruby"]
let arr = [1, 2, 3,4, 5, 6]

//# creation of mutable array
let arrData = NSMutableArray(array:arr)

arrData.insert(10 ,at:0)

let newarr = arrData.copy() as! NSArray
print("new array \(newarr)")
print(arrData)
print("------------------------------------")

for x in str.dropFirst(){
    print(x)
}
print("------------------------------------")
// drop last 3 elements from array
for x in str.dropLast(3){
    print(x)
}
