
import Foundation
import UIKit
var videoUrlArr = ["https://seetoapp.s3.us-east-1.amazonaws.com/dba714e0-1573-4754-8d6b-48c932777ae4_ProfileVideo.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/ccf417b1-231f-4780-973e-b312454a452d_ProfileVideo.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/420ce97f-46db-442e-bc7a-5e9d757d23ec_ProfileVideo.mp4","https://trainingstory.s3.amazonaws.com/Chat_Media/pexels-cottonbro-6127669+%281080p%29.mp4","https://trainingstory.s3.amazonaws.com/Chat_Media/production_id_3997786+%281080p%29.mp4","https://trainingstory.s3.amazonaws.com/Chat_Media/production_id_4620564+%282160p%29.mp4","https://trainingstory.s3.amazonaws.com/Chat_Media/sample-2.mp4","https://trainingstory.s3.amazonaws.com/Chat_Media/sample-30s.mp4","https://trainingstory.s3.amazonaws.com/Chat_Media/SampleVideo_1280x720_30mb.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/4820ac23-d6d8-42b2-a2d5-59d75efaff9e_file_example_MP4_1920_18MG.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/e1ee3abe-fe2e-4097-a728-493390849795_ProfileVideo.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/32c9ae4f-67c2-411d-8474-f905d379607c_ProfileVideo.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/d0e17257-ce7a-4afe-929e-969369ffe5fd_file_example_MP4_1280_10MG.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/f4a90270-fc4f-4059-9572-274fff340354_SampleVideo_1280x720_10mb.mp4","https://seetoapp.s3.us-east-1.amazonaws.com/459a859f-9840-436f-a9be-47864b78d2cd_SampleVideo_1280x720_20mb.mp4"]

let currentView =  UIApplication.shared.keyWindow?.rootViewController?.view ?? UIView()
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let containerView  = UIView.init(frame: CGRect.init(x: 0, y: 0, width: currentView.frame.width/2, height: 50))

            let activityView = UIActivityIndicatorView(style: .white)
            activityView.frame = CGRect.init(x: 10, y: 5, width: 40, height: 40)
            activityView.color = UIColor.systemOrange

            let containerLabel  = UILabel.init(frame: CGRect.init(x: 55, y: activityView.frame.minY, width: containerView.frame.width, height: 40))
            containerLabel.text = "Just a moment..."
            containerLabel.font = .systemFont(ofSize: 13)
            containerLabel.textColor = UIColor.systemOrange

            containerView.center = currentView.center
            containerView.tag = 555
            containerView.backgroundColor = .white
            containerView.layer.cornerRadius = 5
            containerView.addSubview(activityView)
            containerView.addSubview(containerLabel)
             currentView.addSubview(containerView)
             activityView.startAnimating()
            }
        }

        func hideActivityIndicator(){
           
            DispatchQueue.main.async {
                if let containerView = currentView.viewWithTag(555){
                    (containerView.subviews[0] as? UIActivityIndicatorView)?.stopAnimating()
                    containerView.removeFromSuperview()
                }
        }


        }



