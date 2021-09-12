//
//  CameraViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/10/21.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    var videoFilename: String!
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var overlayImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        let urlPath = Bundle.main.url(forResource: videoFilename, withExtension: "mp4")!

        do {
            let asset = AVURLAsset(url: urlPath, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            overlayImageView.image = thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
        }
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                print("Unable to access back camera!")
                return
        }

        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            //Step 9
            
            stillImageOutput = AVCapturePhotoOutput()
            

            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }

        

    }
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        cameraView.layer.addSublayer(videoPreviewLayer)
        
        //Step12
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            //Step 13
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.cameraView.bounds
            }
        }

    }

    
    @IBAction func didTapNext(_ sender: Any) {
        captionLabel.text = "Recording started!!"
        // start recording!
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
