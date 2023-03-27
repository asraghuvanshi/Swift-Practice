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
