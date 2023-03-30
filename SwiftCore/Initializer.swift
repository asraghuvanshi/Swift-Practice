class Initializer{
    // var num:Int
    init(){
        print("Init block")
    }
    convenience init (num: Int) { self.init() 
    print("convinience \(num)")
    }

    deinit{
        print("deinitialize")
    }
}

var obj = Initializer()
var deinitialize:Initializer?
deinitialize = nil

obj = Initializer(num: 120)