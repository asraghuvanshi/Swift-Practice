    let dayOfWeek = 3 
    switch dayOfWeek {  
        case 1:  
            print("It is Sunday today")      
        case 2:  
            print("It is Monday today")       
        case 3:  
            print("It is Tuesday today")
            fallthrough         
        case 4:
            print("It is Wednesday today")   
            fallthrough   // fallthrough is used to executed next case 
        case 5:  
            print("It is Thursday today")         
        case 6:  
            print("It is Friday today")       
        case 7:  
            print("It is Saturday today")         
        default:  
            print("Invalid day")  
    }  

    func Function1() {  
        guard false else {  
            print("gaurd executed")  
            return  
        }  
        print("")  
    }  
    Function1()  
    print("After function call")  

