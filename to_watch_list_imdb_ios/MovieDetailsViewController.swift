import UIKit

class MovieDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  // MARK: atributes
  var movie: Movie?
  let cellReuseIdentifier = "cell"
  var movieDetails: [String: String] = [:]
  
  // MARK: outlets
  @IBOutlet weak var imageMovieCover: UIImageView!
  @IBOutlet weak var labelMovieTitle: UILabel!
  @IBOutlet weak var labelMovieGenreAndYear: UILabel!
  @IBOutlet weak var labelMoviePlot: UILabel!
  @IBOutlet weak var tableViewDetails: UITableView!
  
  override func viewDidLoad() {
    movieDetails = (movie?.moviewDetailsMap())!
    self.tableViewDetails.registerClass(MovieDetailsCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    if let imageUrl = movie?.poster where !imageUrl.isEmpty {
      imageMovieCover.downloadedFrom(link: imageUrl, contentMode: .ScaleAspectFit)
    }
    
    labelMovieTitle.text = movie?.title
    labelMovieGenreAndYear.text = movie?.genre
    labelMoviePlot.text = movie?.plot
  }
  
  // number of rows in table view
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieDetails.count
  }
  
  // create a cell for each table view row
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableViewDetails.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! MovieDetailsCell
    
    cell.textLabel?.text = Array(movieDetails.keys)[indexPath.section]
    
    return cell
  }
  
  // method to run when table view cell is tapped
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("You tapped cell number \(indexPath.row).")
  }
}
