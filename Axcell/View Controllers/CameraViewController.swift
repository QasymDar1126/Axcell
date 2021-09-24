//
//  CameraViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/10/21.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var overlayImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    var videoFilename: String!
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    var rearCamera: AVCaptureDevice?
    var rearCameraInput: AVCaptureDeviceInput?
    var videoOutput: AVCaptureMovieFileOutput?
    var videoRecordCompletionBlock: ((URL?, Error?) -> Void)?
    var isRecordingStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        displayProThumbnail()
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                print("Unable to access back camera!")
                return
        }

        do {
            let input = try AVCaptureDeviceInput(device: backCamera)

            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
                setupLivePreview()
            }
        }
        
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    func displayProThumbnail() {
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
    }
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        cameraView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.cameraView.bounds
            }
        }
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        if isRecordingStarted {
            videoOutput?.stopRecording()
            isRecordingStarted = false
        } else {
            isRecordingStarted = true
            startRecording()
        }
    }
    
    func startRecording() {
        captionLabel.text = "Recording started!"
        overlayImageView.isHidden = true
        
        // start recording!
        
        do {
            let session = AVCaptureDevice.DiscoverySession.init(deviceTypes:[.builtInWideAngleCamera, .builtInMicrophone], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
                    
            let cameras = (session.devices.compactMap{$0})
                    
            for camera in cameras {
                if camera.position == .back {
                    self.rearCamera = camera
                    
                    try camera.lockForConfiguration()
                        camera.focusMode = .continuousAutoFocus
                        camera.unlockForConfiguration()
                    
                }
            }
            
            guard let captureSession = self.captureSession else {
                fatalError("captureSessionIsMissing")
            }

            for outputs in captureSession.outputs{ captureSession.removeOutput(outputs) }
            
            self.videoOutput = AVCaptureMovieFileOutput()
            if captureSession.canAddOutput(self.videoOutput!) {
                captureSession.addOutput(self.videoOutput!)
                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                let fileUrl = paths[0].appendingPathComponent("output.mov")
                try? FileManager.default.removeItem(at: fileUrl)

                videoOutput?.startRecording(to: fileUrl, recordingDelegate: self)
                
                nextButton.setTitle("Stop", for: .normal)
            } else {
                fatalError("cannot add output to capture session")
            }
            
        } catch(_) {
            
        }
    }

}

extension CameraViewController: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        
        // this method is triggered automatically whenever we tell the iPhone to stop recording
        
        // segue to the Playback VC
        let vc = storyboard?.instantiateViewController(identifier: "PlaybackViewController") as! PlaybackViewController
        vc.videoUrl = outputFileURL
        navigationController?.pushViewController(vc, animated: true)
        
        // change the labels, button text
        captionLabel.text = "Recording completed. Tap RE-RECORD to try again."
        overlayImageView.isHidden = false
        nextButton.setTitle("Re-record", for: .normal)
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        print("started recording")
    }
}
