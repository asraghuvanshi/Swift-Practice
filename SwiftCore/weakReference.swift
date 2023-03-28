class Closure{

    var counter = 0
}

let closure = Closure()

closure.counter = 20
print(closure.counter)

let calculate = {cal in 
  return closure!.counter * cal
}

print(calculate(20))


class Completion{

  func completionHandler(completion:(Int) ->Void){
      var total = 0
      for i in 0...50{
          total += i
      }
      completion(total)
  }
}

  let num = 20
  let obj = Completion()
  obj.completionHandler(completion: { num in 
      print(num)
})