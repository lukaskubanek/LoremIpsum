# Lorem Ipsum

*Lorem Ipsum* is a simple lorem ipsum generator for iOS and OS X apps. It supports generating text in different formats (words, sentences, paragraphs, names, URLs etc.) and creating placeholder images for both, iOS and OS X.

This project was inspired by a great static site generator [Middleman](http://github.com/middleman/middleman). Its [lorem ipsum feature](https://github.com/middleman/middleman/blob/37e22c040ebcabed0ac3d8bce85aa085177d012a/middleman-core/lib/middleman-more/extensions/lorem.rb) was also a data source for this project.

#### Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Texts](#texts)
  - [Images](#images)
- [Example Projects](#example-projects)
- [Author](#author)
- [License](#license)

## Installation

*Lorem Ipsum* can be integrated into your Xcode project using CocoaPods by putting following line into your `Podfile` and running `pod install`:

```ruby
pod 'LoremIpsum', '~> 0.2'
```

## Usage

Wherever you want to use *Lorem Ipsum* functionality, import the header file. Optionally you can import the header file in your project `.pch` file to make it available across all project files.

```objective-c
#import "LoremIpsum.h"
```

### Texts

```objective-c
// generate a single word (e.g. "voluptatem" or "amet")
NSString *word = [LoremIpsum word];

// generate 5 individual words (e.g. "est dolores voluptatem cumque itaque")
NSString *words = [LoremIpsum wordsWithNumber:5];

// generate a single sentence (e.g. "Facilis magni autem ut iure cum voluptas excepturi eos.")
NSString *sentence = [LoremIpsum sentence];

// generate 2 sentences
NSString *sentences = [LoremIpsum sentencesWithNumber:2];

// generate a single paragraph
NSString *paragraph = [LoremIpsum paragraph];

// generate 2 paragraphs
NSString *paragraphs = [LoremIpsum paragraphsWithNumber:2];

// generate a capitalized title (e.g. "Et Quibusdam" or "Minus Reprehenderit Soluta Facilis")
NSString *title = [LoremIpsum title];

// generate a date within the last 15 years (e.g. Saturday, 22. September 2012)
NSDate *date = [LoremIpsum date];

// generate a first name (e.g. "Dora" or "Alvin")
NSString *firstName = [LoremIpsum firstName];

// generate a last name (e.g. "Glass" or "Fox")
NSString *lastName = [LoremIpsum lastName];

// generate a name composed from a first and a last name (e.g. "Tomas Beasley")
NSString *name = [LoremIpsum name];

// generate an email address (e.g. "jared.finch@hotmail.com")
NSString *email = [LoremIpsum email];

// generate an URL address (e.g. "http://stumbleupon.com/")
NSURL *URL = [LoremIpsum URL];

// generate a sample tweet with 140 characters
NSString *tweet = [LoremIpsum tweet];
```

### Images

*Lorem Ipsum* supports creating placeholder images by downloading them from following supported servers:

| Service                                   | Value of `LoremIpsumPlaceholderImageService`      |
| ----------------------------------------- | ------------------------------------------------- |
| [lorempixel.com](http://lorempixel.com)   | `LoremIpsumPlaceholderImageServiceLoremPixelCom`  |
| [dummyimage.com](http://dummyimage.com)   | `LoremIpsumPlaceholderImageServiceDummyImageCom`  |
| [placekitten.com](http://placekitten.com) | `LoremIpsumPlaceholderImageServicePlaceKittenCom` |

*Lorem Ipsum* offers methods for synchronous and asynchronous downloading of images as well as retrieving the URL for an image without downloading it. All methods work for both platforms, iOS and OS X. According to the platform `UIImage` or `NSImage` instances are created.

#### Synchronous Downloading

```objective-c
// create a color image from lorempixel.com with size 200x200
UIImage *image1 = [LoremIpsum placeholderImageWithWidth:200 height:200];

// create a color image from dummyimage.com with size 150x400
UIImage *image2 = [LoremIpsum placeholderImageFromService:LoremIpsumPlaceholderImageServiceDummyImageCom 
                                                withWidth:150 
                                                   height:400];

// create a grayscale image from placekitten.com with size 300x300
UIImage *image3 = [LoremIpsum placeholderImageFromService:LoremIpsumPlaceholderImageServicePlaceKittenCom 
                                                withWidth:300 
                                                   height:300 
                                                grayscale:YES];
```

#### Asynchronous Downloading

```objective-c
// create a color image from lorempixel.com with size 200x200
[LoremIpsum asyncPlaceholderImageWithWidth:200 height:200 completion:^(UIImage *image) {
    // use image here
}];

// create a color image from dummyimage.com with size 150x400
[LoremIpsum asyncPlaceholderImageFromService:LoremIpsumPlaceholderImageServiceDummyImageCom 
                                   withWidth:150
                                      height:400 
                                  completion:^(UIImage *image) {
    // use image here
}];

// create a grayscale image from placekitten.com with size 300x300
[LoremIpsum asyncPlaceholderImageFromService:LoremIpsumPlaceholderImageServicePlaceKittenCom
                                   withWidth:300 
                                      height:300
                                   grayscale:YES
                                  completion:^(UIImage *image) {
    // use image here
}];
```

#### Image URLs

```objective-c
// URL for a color image from lorempixel.com with size 200x200 
NSURL *URL1 = [LoremIpsum URLForPlaceholderImageWithWidth:200 height:200];

// URL for a color image from dummyimage.com with size 150x400
NSURL *URL2 = [LoremIpsum URLForPlaceholderImageFromService:LoremIpsumPlaceholderImageServiceDummyImageCom 
                                                  withWidth:150 
                                                     height:400];
                                                     
// URL for a grayscale image from placekitten.com with size 300x300
NSURL *URL3 = [LoremIpsum URLForPlaceholderImageFromService:LoremIpsumPlaceholderImageServicePlaceKittenCom 
                                                  withWidth:300 
                                                     height:300
                                                  grayscale:YES];
```

## Example Projects

This repository contains two [example projects](/Examples/) for each platform where the usage of *Lorem Ipsum* is shown.

![Mac OS X Example Screenshot](/Screenshot.png)

## Author


| Lukas Kubanek                                        |
|------------------------------------------------------|
| [lukaskubanek.com](http://lukaskubanek.com)          |
| [@kubanekl](https://twitter.com/kubanekl)            |

## License

Usage is provided under the [MIT License](http://opensource.org/licenses/MIT). See [License.markdown](License.md) for the full details.
