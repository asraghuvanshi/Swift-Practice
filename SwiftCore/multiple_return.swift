
func multiValue(_ name:String ,_ age:Int ,_ id:String) ->(String , Int, String){
    return (name , age, id)
}

let obj = multiValue("Krishna" , 23 , "20BCS1446")
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