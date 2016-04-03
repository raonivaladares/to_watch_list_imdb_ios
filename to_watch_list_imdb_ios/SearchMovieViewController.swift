
import UIKit

class SearchMovieViewController: UIViewController {
  // MARK: atributes
  var alert = HelperAlert.sharedInstance
  var movie : Movie?
  var searchService: SearchService = SearchService.instance
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if(segue.identifier == "MoviewDetailsSegue") {
      
      let viewController = (segue.destinationViewController as! MovieDetailsViewController)
      viewController.movie = movie
    }
  }
  
  func searchMovie(movieName: String) {
    searchService.searchMovie(movieName) { result in
      var msg: String
      switch (result) {
      case .Success(let output):
        if output.response == "True" {
          msg = output.name
          self.movie = output
          self.performSegueWithIdentifier("MoviewDetailsSegue", sender: nil)
        } else {
          msg = output.error
          self.alert.message(self, message: msg)
        }
      case .Failure(let error):
        msg = error.localizedDescription
        self.alert.message(self, message: msg)
      }
    }
  }

  // MARK: outlets
  @IBOutlet weak var textFieldMovieToSearch: UITextField!
  
  // MARK: actions
  @IBAction func touchButtonSearch(sender: UIButton) {
    if let movieName = textFieldMovieToSearch.text where !movieName.isEmpty {
      searchMovie(movieName)
    } else {
      alert.message(self, message: "Empty field: type the movie name")
    }
  }
}

