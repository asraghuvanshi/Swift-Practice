/*
*
*  Date 20/01/2023
*  Generics in swift
* 
*/


 // accept particular data type
func perform(_ op: (Int , Int)-> Int , on lhs: Int , and rhs:Int ){
   print(op(lhs , rhs))
}

// accept all types of values
func genericFunction<T: Numeric>(_ operation: (T, T) -> T , _ num1:T , _ num2:T){
    print(operation(num1 , num2))
}


// func genericFunctions<T: Numeric , S: Numeric>(_ operations: (T, S) -> T, _ num1:T , _ num2:S){
     // you can also write generic function like this when u have multiple generic paramenter
// }

// func genericFunctions<T: Numeric>(_ operations: (T, S) -> T, _ num1:T , _ num2:S) ->N where N: Numeric {
// or  via where statement
// }

perform(+, on: 5, and: 3)
perform(-, on: 4, and: 6)

genericFunction(* ,10, 20)

