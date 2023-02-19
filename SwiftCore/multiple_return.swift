
func multiValue(_ name:String ,_ age:Int ,_ id:String) ->(String , Int, String){
    return (name , age, id)
}


let obj = multiValue("Krishna" , 23 , "20BCS146")
print("values are" , obj)

func factorial(_ num:Int) -> Int{
    if num == 1 {
        return 1
    }

    else{
        return num * factorial (num - 1)
    }
}

print(factorial(5))

var array:Array<String> = Array()
array.append("Swift")
array.append("Ruby")
array.append("Python")
array.append("Java")
print(array.reversed() , array.last , array.reversed())

// convert array to dictionary
var keys = [1 ,2 , 3, 4 , 5]
var values = ["C" , "C++" , "Java" , "Python", "Ruby"]
print(keys , values)
let dict = Dictionary(uniqueKeysWithValues:zip(keys , values))
print(dict)

