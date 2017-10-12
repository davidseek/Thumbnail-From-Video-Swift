In this test project we create a thumbnail image from a video taken from the camera roll.
This project will only work on physical devices.

<b>Important: </b> you need to set the team signing to your iTunes account in order to run the project on your device.

## Code Example

The most important code for this project is:

```swift
func getThumbnailFrom(path: URL) -> UIImage? {

    do {

        let asset = AVURLAsset(url: path , options: nil)
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        imgGenerator.appliesPreferredTrackTransform = true
        let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
        let thumbnail = UIImage(cgImage: cgImage)

        return thumbnail

    } catch let error {

        print("*** Error generating thumbnail: \(error.localizedDescription)")
        return nil

    }

}
```

Also important is to set the following values in the Info.plist file:

Privacy - Camera Usage Description
Privacy - Photo Library Additions Usage Description
Privacy - Microphone Usage Description

In this project it is already done. But if you want to use those in your project, you will need to set them.

## License

A short snippet describing the license (MIT, Apache, etc.)
