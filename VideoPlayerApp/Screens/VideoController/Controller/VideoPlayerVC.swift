

import UIKit
import AVKit
import AVFoundation
class VideoResourceLoaderDelegate: NSObject, AVAssetResourceLoaderDelegate {
}

class VideoPlayerVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var videoPlayerCollectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    // MARK: - Variable
    var player: AVPlayer!
    var resourceLoaderDelegate: VideoResourceLoaderDelegate!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        setupUI()
        resourceLoaderDelegate = VideoResourceLoaderDelegate()
        
    }
    
    // MARK: - Local Function
    // MARK: - Local Function // MARK: - Local Function
    func setupUI(){
        self.videoPlayerCollectionView.dataSource = self
        self.videoPlayerCollectionView.delegate = self
        videoPlayerCollectionView.register(UINib(nibName: "VideoCVCell", bundle: nil), forCellWithReuseIdentifier: "VideoCVCell")
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        videoPlayerCollectionView.collectionViewLayout = layout
    }
}

// MARK: - Extension
extension VideoPlayerVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoUrlArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videoPlayerCollectionView.dequeueReusableCell(withReuseIdentifier: "VideoCVCell", for: indexPath) as! VideoCVCell
        let videoURL = URL(string: videoUrlArr[indexPath.item])
        cell.configure(with: videoURL!, resourceLoaderDelegate: resourceLoaderDelegate)
           return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: videoPlayerCollectionView.frame.width, height: videoPlayerCollectionView.frame.height)
        
     
    }
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if let videoCell = cell as? VideoCVCell {
                hideActivityIndicator()
                videoCell.play()
                
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if let videoCell = cell as? VideoCVCell {
                videoCell.pause()
            }
        }
}
