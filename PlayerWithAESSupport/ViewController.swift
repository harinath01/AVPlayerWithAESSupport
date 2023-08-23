//
//  ViewController.swift
//  PlayerWithAESSupport
//
//  Created by Testpress on 23/08/23.
//

import UIKit
import AVKit


let AES_ENCRYPTED_VIDEO_URL = "https://d384padtbeqfgy.cloudfront.net/transcoded_private/B66mmRm2TPF/video.m3u8?Expires=1692809424&Signature=wJ6JZVQHbBEwyhTFy4uYOjK1DhDE9-MyzSO7AD2KnZ1emQxhbYBjSX9tyThG9ZqdMPzec1BKK5lj7LjTp5q9UrYu~VrtyhGDdLwHrQrWUHGE2VUzfokhJ73L8decpDFF3pS0gxHhfgnG~js3WHXORmFfmrSghmr50AOeSHQwyqTyK1eSrV~ufXe5sRQXXLltjYtXyXDWmE02fi1RsWiTvKmXkGVF66hAxFPFR3rGtuqYTC9TA-NYHJacL9HVqIgHLUKp67yXOyjqdSpYIZJaeCh3rk9U2liss7wv-U6pQ4fxCDf3TGOR3k-DG5smU1DEFjHhkCq-U~2wGADT0zGoJQ__&Key-Pair-Id=K2XWKDWM065EGO"

class ViewController: UIViewController {
    @IBOutlet weak var playerContainer: UIView!
    
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController?
    
    let resourceLoaderDelegate = ResourceLoaderDelegate(accessToken: "79ef7b66-bcac-4129-bfe1-34ca3006e799")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPlayer()
        player?.play()
    }
    
    func setUpPlayer(){
        let asset = AVURLAsset(url: URL(string: AES_ENCRYPTED_VIDEO_URL)!)
        asset.resourceLoader.setDelegate(resourceLoaderDelegate, queue: DispatchQueue.main)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player

        addChild(playerViewController!)
        playerContainer.addSubview(playerViewController!.view)
        playerViewController!.view.frame = playerContainer.bounds
    }
}

