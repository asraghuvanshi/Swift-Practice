var str:String?

print(str)
if let newString = str{
    print("value is not nil", newString)
}else{
    print("print value is nil")
}

var name:String? = "Krishna"
var dec:Float? = 20.20
var num:Int? = 10
print(name , dec, num)
if let name = name, let dec = dec , let num = num{
    print("\(name) , \(dec), \(num)")
    
}