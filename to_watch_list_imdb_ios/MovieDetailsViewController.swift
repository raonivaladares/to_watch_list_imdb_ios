import UIKit

class MovieDetailsViewController: UIViewController {
  // MARK: atributes
  var movie: Movie?
  
  // MARK: outlets
  @IBOutlet weak var imageMovieCover: UIImageView!
  @IBOutlet weak var labelMovieTitle: UILabel!
  @IBOutlet weak var labelMovieGenreAndYear: UILabel!
  @IBOutlet weak var labelMoviePlot: UILabel!
  
  override func viewDidLoad() {
    //imageMovieCover
    labelMovieTitle.text = movie?.title
    labelMovieGenreAndYear.text = movie?.genre
    labelMoviePlot.text = movie?.plot
  }
}
