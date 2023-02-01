// Number series pattern challenge

let i:Int = 0
let j:Int = 0
let num:Int = 99

for i in i...99{
    for index in stride(from: 10, to: i, by: -8) {

        if i < 10 &&  i % 2 == 0{
            print("0\(i)" , terminator: " ")
        }
        else if i >= 10 && i % 2 == 0{
            print("\(i)", terminator: " ")
        }
        else {
        print("<<0\(i)>>" ,terminator: " ")
        }
    }
    print()
}
