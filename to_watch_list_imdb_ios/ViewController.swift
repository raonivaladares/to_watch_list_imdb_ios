
import UIKit

class ViewController: UIViewController {
    var alert = HelperAlert.sharedInstance
    var movie : Movie?
    var searchService: SearchService = SearchService.instance

    @IBOutlet weak var textFieldMovieToSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func touchButtonSearch(sender: UIButton) {
      if let movieName = textFieldMovieToSearch.text where !movieName.isEmpty {
        searchMovie(movieName)
      } else {
        alert.message(self, message: "Empty field: type the movie name")
      }
    }
    
  func searchMovie(movieName: String) {
        searchService.searchMovie(movieName) { result in
            var msg: String
            switch (result) {
            case .Success:
                msg = "success"
            case .Failure(let error):
                msg = error.localizedDescription
            }
            self.alert.message(self, message: msg)
        }
    }
    
}

