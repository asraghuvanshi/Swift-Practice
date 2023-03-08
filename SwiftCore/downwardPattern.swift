for i in stride(from:9, to:0,by:-2){
    for j in 0...9 - i + 1{
        print(terminator:" ")
    }
    for j in 0..<i{
        print("*", terminator :" ")
    }
    print()
}
