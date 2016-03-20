
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
        searchMovie()
    }
    
    func searchMovie() {
        searchService.searchMovie() { result in
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

