
import Foundation
import ObjectMapper

class Movie: Mappable {
  var title: String?
  var year: String?
  var rated: String?
  var released: String?
  var runtime: String?
  var genre: String?
  var director: String?
  var writer: String?
  var actors: String?
  var plot: String?
  var language: String?
  var country: String?
  var awards: String?
  var poster: String?
  var metascore: String?
  var imdbRating: String?
  var imdbVotes: String?
  var imdbID: String?
  var type: String?
  var error: String?
  var response: String?
  
  init?(title: String, year: String, rated: String, released: String,
        runtime: String, genre: String, director: String, writer: String,
        actors: String, plot: String, language: String, country: String,
        awards: String, poster: String, metascore: String, imdbRating: String,
        imdbVotes: String, imdbID: String, type: String,
        error: String, response: String) {
    self.title = title
    self.year = year
    self.rated = rated
    self.released = released
    self.runtime = runtime
    self.genre = genre
    self.director = director
    self.writer = writer
    self.actors = actors
    self.plot = plot
    self.language = language
    self.country = country
    self.awards = awards
    self.poster = poster
    self.metascore = metascore
    self.imdbRating = imdbRating
    self.imdbVotes = imdbVotes
    self.imdbID = imdbID
    self.type = type
    self.error = error
    self.response = response
  }
  
  required init?(_ map: Map){
  }
  
  init(){
  }
  
  func mapping(map: Map) {
    title         <- map["Title"]
    year          <- map["Year"]
    rated         <- map["Rated"]
    released      <- map["Released"]
    runtime       <- map["Runtime"]
    genre         <- map["Genre"]
    director      <- map["Director"]
    writer        <- map["Writer"]
    actors        <- map["Actors"]
    plot          <- map["Plot"]
    language      <- map["Language"]
    country       <- map["Country"]
    awards        <- map["Awards"]
    poster        <- map["Poster"]
    metascore     <- map["Metascore"]
    imdbRating    <- map["imdbRating"]
    imdbVotes     <- map["imdbVotes"]
    imdbID        <- map["imdbID"]
    type          <- map["Type"]
    error         <- map["Error"]
    response      <- map["Response"]
  }
}