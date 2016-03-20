
import Foundation
import ObjectMapper

class Movie: Mappable {
    var name: String! = ""
    var error: String! = ""
    
    init?(name: String, error: String) {
        self.name = name
        self.error = error
        
        if name.isEmpty {
            return nil
        }
    }

    required init?(_ map: Map){
    }
    
    init(){
    }
    
    func mapping(map: Map) {
        name         <- map["Title"]
        error        <- map["Error"]
    }
}