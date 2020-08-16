# Stress-Relief-App
Instead of punching the wall, Bip the Guy allows you to release your anger digitally!

Tap the screen rapidly to punch whoever you want! (Disclaimer: Bip the Guy only allows you to punch a picture of your intended target. We do not encourage physical violence. Solely fake digital violence.)

<p align = "center"><kbd><img src = "/images/app_start.png" height = "400"></kbd></p>

<p><strong>Bip the Guy's purpose:</strong><br>Provide an outlet for users to relieve their stress on the cause of their stress: whether that be a person, a place, or an idea</p>

<h3> Accessing the Bipping Experience</h3>
<ul>
  <li>Own a Mac (Sorry PC users :( )</li>
  <li>Download XCode</li>
  <li>Bip the Guy was created using XCode 11.6, so make sure you have that or a higher version!</li>
  <li>Go to the "Code" dropdown above and select "Open in XCode!"</li>
  <li>Relieve your stress!</li>
</ul>

<h3>How Bip the Guy Works</h3>
<ol>
  <li>The app is preloaded with a picture of Justin Bieber (sorry Justin). Tap his image to relieve stress. His face will respond to your touch with a punching sound and a rumbling animation.</li>
  <br>
  <p align = "center"><kbd><img src = "/images/punch.gif" height = "500"></kbd></p>
  <li>If you're a Belieber or you want to take out your stress on someone else, use the photo library to upload a new photo.</li>
  <br>
  <p align = "center"><kbd><img src = "/images/photo_library.gif" height = "500"></kbd></p>
  <li>If you're even more daring, take a picture of your target to use! Be sure to use a device with a camera! (Simulator on mac does not have camera, so you will have to try it for yourself!)</li>
  <p align = "center"><kbd><img src = "/images/camera.gif" height = "500"></kbd></p>
</ol>
<h3>The Logic Behind the Bipping</h3>
<ul>
  <li>Playing the punch sound:</li>
  <ul>
    <li>playSound function takes a string parameter for name of sound file, and uses that parameter to create an NSDataAsset called "sound"</li>
    <li>Create an AVAudioPlayer with the data, or in this case sound, associated with "sound"</li>
    <li>Play that sound!</li>
    <li>If an error occurs, the programmer will be notified through console error messages</li>
  </ul>
  
```swift
import AVFoundation
var audioPlayer = AVAudioPlayer()
func playSound(name:String){
  if let sound = NSDataAsset(name: name){
      do{
          try audioPlayer = AVAudioPlayer(data: sound.data )
          audioPlayer.play()
      }catch {
          print("😡ERROR: \(error.localizedDescription)Could not initialize AVAudioPlayer object")
      }
  }else{
      print("😡ERROR: Could not read data from file sound\(name)")
  }
}
```
  <li>Animate target being punched:</li>
  <ul>
    <li>On user's tap on the image, move the image to the right and down a set amount (in this case a CGFloat of 60)</li>
    <li>Shrink the width and height down that same amount</li>
    <li>Animate the image returning to its original bounds in 0.25 seconds, which was stored in a let constant "bounds"</li>
  </ul>
  
```swift
func animateImage(){
    let bounds = self.imageToPunch.bounds
    let shrinkValue: CGFloat = 60

    //shrink our imagetoPunch by 60 pixels
    self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width-shrinkValue, height: self.imageToPunch.bounds.size.height-shrinkValue)


    UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds}, completion: nil)

}
```
</ul>
<h3>Bip the Guy is responsive across iPads and iPhones!</h3>
<h6><em>(Displayed images are of iPad, iPhone 11, and iPhone SE in that order)</em></h6>
<p align = "center"><kbd><img src = "/images/responsive_ipad.png" height = "500"></kbd></p>
<br>
<p align = "center"><kbd><img src = "/images/responsive_iphone_11.png" height = "500"></kbd><img src = "/images/white_space.png" width = "100"><kbd><img src = "/images/responsive_iphone_se.png" height = "500"></kbd></p>
