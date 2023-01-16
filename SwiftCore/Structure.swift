struct Person{
  var name: String
  var age: Int
  init(name:String , age:Int){
    self.name = name
    self.age = age
  }

  mutating func updateData(name: String){ // mutate values
    self.name = name
  }
}

var obj = Person(name: "Java" , age: 23 )
print(obj.name)

obj.updateData(name:"Python")
print(obj.name)

enum Enumeration{
  case name
  case age
  case uid
}

let obj1 = Enumeration.name
print(obj1)




