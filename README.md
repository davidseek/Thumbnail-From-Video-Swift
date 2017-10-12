In this test project we create a thumbnail image from a video taken from the camera roll.
This project will only work on physical devices.

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

## License

A short snippet describing the license (MIT, Apache, etc.)