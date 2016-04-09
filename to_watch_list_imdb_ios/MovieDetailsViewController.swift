import UIKit

class MovieDetailsViewController: UIViewController {
  // MARK: atributes
  var movie: Movie?
  
  var movieDetails: [String: String] = [:]
  
  // MARK: outlets
  @IBOutlet weak var imageMovieCover: UIImageView!
  @IBOutlet weak var labelMovieTitle: UILabel!
  @IBOutlet weak var labelMovieGenre: UILabel!
  @IBOutlet weak var labelMoviePlot: UILabel!
  
  override func viewDidLoad() {
    movieDetails = (movie?.moviewDetailsMap())!
   
    if let imageUrl = movie?.poster where !imageUrl.isEmpty {
      imageMovieCover.downloadedFrom(link: imageUrl, contentMode: .ScaleAspectFit)
    }
    
    labelMovieTitle.text = movie?.title
    labelMovieGenre.text = movie?.genre
    labelMoviePlot.text = movie?.plot
  }
}
