
import UIKit

class ViewController: UIViewController {
    
    var movie : Movie?

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
    }
}

