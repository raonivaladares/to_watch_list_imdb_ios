
import Foundation
import ObjectMapper

class Movie: Mappable {
  var name: String! = ""
  var error: String! = ""
  var response: String! = ""
  
  init?(name: String, error: String, response: String) {
    self.name = name
    self.error = error
    self.response = response
    
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
    response        <- map["Response"]
  }
}