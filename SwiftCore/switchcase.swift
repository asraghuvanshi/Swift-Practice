func getDetails(_ inputdata:String){

  switch(inputdata){
    case "autumn":
      print("Autumn")
        break
    case "summer":
        print("summer")
        break
    case "winter":
        print("winter")
        break
    case "rainy":
        print("rainy")
        break

    default:
        print("someting went wrong")
        
  }
}
enum Seasons:String{
    case autumn = "autumn"
    case winter = "winter"
    case rainy = "rainy"
    case summer = "summer"
}
getDetails(Seasons.autumn.rawValue)
