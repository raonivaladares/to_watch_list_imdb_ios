import UIKit

class MovieDetailsViewController: UIViewController {
  // MARK: atributes
  var movie: Movie?
  
  // MARK: outlets
  @IBOutlet weak var imageMovieCover: UIImageView!
  @IBOutlet weak var labelMovieTitle: UILabel!
  @IBOutlet weak var labelMovieCategory: UILabel!
  @IBOutlet weak var labelMovieDescription: UILabel!
  
  override func viewDidLoad() {
    //imageMovieCover
    labelMovieTitle.text = movie?.name
   // labelMovieCategory.text = movie?.name
   // /labelMovieDescription.text = movie?.name
  }
}
