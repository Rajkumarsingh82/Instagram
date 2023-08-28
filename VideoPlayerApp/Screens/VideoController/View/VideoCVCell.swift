

import UIKit
import AVKit
import AVFoundation

class VideoCVCell: UICollectionViewCell {
    var videoURL: URL!
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
   
    var resourceLoaderDelegate: VideoResourceLoaderDelegate!
    var activityIndicator = UIActivityIndicatorView(style: .large)
    @IBOutlet weak var videoview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resourceLoaderDelegate = VideoResourceLoaderDelegate()
       
    }

    func configure(with videoURL: URL, resourceLoaderDelegate: VideoResourceLoaderDelegate) {
            self.videoURL = videoURL
            self.resourceLoaderDelegate = resourceLoaderDelegate
            showActivityIndicator()
            let asset = AVURLAsset(url: videoURL)
            asset.resourceLoader.setDelegate(resourceLoaderDelegate, queue: DispatchQueue.main)
            player = AVPlayer(playerItem: AVPlayerItem(asset: asset))
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.videoGravity = .resizeAspectFill
            playerLayer?.frame = contentView.bounds
            contentView.layer.addSublayer(playerLayer!)
            player?.currentItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
        }

    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playerLayer?.removeFromSuperlayer()
        player?.currentItem?.removeObserver(self, forKeyPath: "status")
        player = nil
        playerLayer = nil
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let playerItem = player?.currentItem {
            if playerItem.status == .readyToPlay {
            hideActivityIndicator()
                player?.play() 
            }
        }
    }
   
}
