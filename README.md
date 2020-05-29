# Lorem Ipsum

*Lorem Ipsum* is a simple lorem ipsum generator for iOS, watchOS, tvOS, and macOS apps. It supports generating text in different formats (words, sentences, paragraphs), miscelianous data (names, URLs, dates etc.) and placeholder images.

This project was inspired by a great static site generator [Middleman](http://github.com/middleman/middleman). Its [lorem ipsum feature](https://github.com/middleman/middleman/blob/37e22c040ebcabed0ac3d8bce85aa085177d012a/middleman-core/lib/middleman-more/extensions/lorem.rb) was also a data source for this project.

#### Table of Contents

- [Installation](#installation)
- [Usage](#usage)
    - [Texts](#texts)
    - [Misc Data](#misc-data)
    - [Images](#images)
- [Example Projects](#example-projects)
- [Author](#author)
- [License](#license)

## Installation

### CocoaPods

*Lorem Ipsum* can be integrated into your Xcode project using CocoaPods by putting following line into your `Podfile` and running `pod install`:

```ruby
pod 'LoremIpsum', '~> 1.0'
```

### Swift Package Manager

*Lorem Ipsum* can be added as a Swift Package by including it in your `Package.swift` file.

### Manual
Alternatively you can copy the files `LoremIpsum.h` and `LoremIpsum.m` to your project.

## Usage

*Lorem Ipsum* is usable in both Objective-C and Swift. 

### Objective-C

Wherever you want to use *Lorem Ipsum* functionality, import the header file.

```objective-c
#import "LoremIpsum.h"
```

#### Texts

```objective-c
NSString *word = LoremIpsum.word; // => "voluptatem"
NSString *words = [LoremIpsum wordsWithNumber:5]; // => "est dolores voluptatem cumque itaque"
NSString *sentence = LoremIpsum.sentence; // => "Facilis magni autem ut iure cum voluptas excepturi eos."
NSString *sentences = [LoremIpsum sentencesWithNumber:2];
NSString *paragraph = LoremIpsum.paragraph;
NSString *paragraphs = [LoremIpsum paragraphsWithNumber:2];
NSString *title = LoremIpsum.title; // => "Et Quibusdam"
```

#### Misc. Data

```objective-c
NSString *firstName = LoremIpsum.firstName; // => "Dora"
NSString *lastName = LoremIpsum.lastName; // => "Glass"
NSString *name = LoremIpsum.name; // => "Tomas Beasley"
NSString *email = LoremIpsum.email; // => "jared.finch@hotmail.com"
NSURL *URL = LoremIpsum.URL; // => "http://stumbleupon.com/"
NSString *tweet = LoremIpsum.tweet;
NSDate *date = LoremIpsum.date;
```

### Swift

Wherever you want to use *Lorem Ipsum* functionality, import the module.

```swift
import LoremIpsum
```

#### Texts

```swift
let word: String = LoremIpsum.word // => "voluptatem"
let words: String = LoremIpsum.words(withNumber: 5) // => "est dolores voluptatem cumque itaque"
let sentence: String = LoremIpsum.sentence  // => "Facilis magni autem ut iure cum voluptas excepturi eos."
let sentences = LoremIpsum.sentences(withNumber: 2)
let paragraph = LoremIpsum.paragraph
let paragraphs = LoremIpsum.paragraphs(withNumber: 2)
let title = LoremIpsum.title // => "Et Quibusdam"
```

#### Misc. Data

```swift
let firstName = LoremIpsum.firstName // => "Dora"
let lastName = LoremIpsum.lastName // => "Glass"
let name = LoremIpsum.name // => "Tomas Beasley"
let email = LoremIpsum.email // => "jared.finch@hotmail.com"
let url: URL = LoremIpsum.URL // => "http://stumbleupon.com/"
let tweet: String = LoremIpsum.tweet
let date = LoremIpsum.date
```

### Images

*Lorem Ipsum* supports creating placeholder images by downloading them from following supported services:

| Service                                   | Value of `LIPlaceholderImageService`   |
| ----------------------------------------- | -------------------------------------- |
| [lorempixel.com](http://lorempixel.com)   | `LIPlaceholderImageServiceLoremPixel`  |
| [dummyimage.com](http://dummyimage.com)   | `LIPlaceholderImageServiceDummyImage`  |
| [placekitten.com](http://placekitten.com) | `LIPlaceholderImageServicePlaceKitten` |

*Lorem Ipsum* offers methods for synchronous and asynchronous downloading of images as well as retrieving the URL for an image without downloading it. All methods work for all four supported platforms. According to the platform, `UIImage` or `NSImage` instances are created.

#### Synchronous Downloading

```objective-c
UIImage *image = [LoremIpsum placeholderImageFromService:LIPlaceholderImageServicePlaceKitten
                                                withSize:CGSizeMake(250, 250)];
                                                 
NSImage *image = [LoremIpsum placeholderImageWithSize:NSMakeSize(100, 400)];
```

#### Asynchronous Downloading

```objective-c
[LoremIpsum asyncPlaceholderImageFromService:LIPlaceholderImageServicePlaceKitten
                                    withSize:CGSizeMake(250, 250)
                                  completion:^(UIImage *image) {
                                      // use image here
                                  }];
                                  
[LoremIpsum asyncPlaceholderImageWithSize:NSMakeSize(100, 400)
                               completion:^(NSImage *image) {
                                   // use image here
                               }];
```

#### Image URLs

```objective-c
NSURL *URL = [LoremIpsum URLForPlaceholderImageFromService:LIPlaceholderImageServiceDummyImage
                                                  withSize:CGSizeMake(250, 250)];
```

## Example Projects

This repository contains four [example projects](/Examples/) for iOS, watchOS, tvOS, and macOS where the usage of *Lorem Ipsum* is shown.

## Author

Lukas Kubanek // [lukaskubanek.com](http://lukaskubanek.com) // [@kubanekl](https://twitter.com/kubanekl)

## License

Usage is provided under the [MIT License](http://opensource.org/licenses/MIT). See [LICENSE.md](LICENSE.md) for the full details.
