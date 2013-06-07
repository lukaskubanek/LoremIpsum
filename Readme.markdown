# LoremIpsum

`LoremIpsum` is a simple lorem ipsum generator for iOS and Mac OS X apps. It supports generating text in different formats (words, sentences, paragraphs, names, URLs etc.) and creating placeholder images for both platforms.

`LoremIpsum` was inspired by a great static site generator [Middleman](http://github.com/middleman/middleman). Its [lorem ipsum feature](https://github.com/middleman/middleman/blob/37e22c040ebcabed0ac3d8bce85aa085177d012a/middleman-core/lib/middleman-more/extensions/lorem.rb) was also a data source for this project.

## Installation

`LoremIpsum` can be integrated into your Xcode project using CocoaPods by putting following line into your `Podfile` and running `pod install`:

```ruby
pod 'LoremIpsum', '~> 0.1'
```

## Usage

Wherever you want to use `LoremIpsum` functionality, import the header file:

```objective-c
#import "LoremIpsum.h"
```

### Texts

```objective-c
// generate a single word
NSString *word = [LoremIpsum word];

// generate 5 individual words
NSString *words = [LoremIpsum wordsWithNumber:5];

// generate a single sentence
NSString *sentence = [LoremIpsum sentence]; 

// generate 2 sentences
NSString *sentences = [LoremIpsum sentencesWithNumber:2];

// generate a single paragraph
NSString *paragraph = [LoremIpsum paragraph];

// generate 2 paragraphs
NSString *paragraphs = [LoremIpsum paragraphsWithNumber:2];

// generate a capitalized title
NSString *title = [LoremIpsum title];

// generate a date within the last 15 years
NSDate *date = [LoremIpsum date];

// generate a first name
NSString *firstName = [LoremIpsum firstName];

// generate a last name
NSString *lastName = [LoremIpsum lastName];

// generate a name composed from a first and a last name
NSString *name = [LoremIpsum name];

// generate an email address
NSString *email = [LoremIpsum email];

// generate an URL
NSURL *URL = [LoremIpsum URL];

// generate a sample tweet with 140 characters
NSString *tweet = [LoremIpsum tweet];
```

### Images

`LoremIpsum` supports creating placeholder images by downloading them from different servers. Currently, LoremIpsum supports following services:

| Service                                   | Value of `LoremIpsumPlaceholderImageService`      |
| ----------------------------------------- | ------------------------------------------------- |
| [lorempixel.com](http://lorempixel.com)   | `LoremIpsumPlaceholderImageServiceLoremPixelCom`  |
| [dummyimage.com](http://dummyimage.com)   | `LoremIpsumPlaceholderImageServiceDummyImageCom`  |
| [placekitten.com](http://placekitten.com) | `LoremIpsumPlaceholderImageServicePlaceKittenCom` |

`LoremIpsum` offers wrapper methods for both platforms, iOS and Mac OS X. See the examples below.

Keep in mind that the images are downloaded synchronously. If you want to download them asynchronously, see the [example projects](/Examples/) in this repository.

`LoremIpsum` doesn't support retina images yet.

#### Images for iOS

```objective-c
// create a color image from lorempixel.com with size 200x200
UIImage *image1 = [LoremIpsum placeholderImageWithWidth:200 
                                                 height:200];

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

#### Images for Mac OS X

```objective-c
// create a color image from lorempixel.com with size 200x200
NSImage *image1 = [LoremIpsum placeholderImageWithWidth:200
                                                 height:200];

// create a color image from dummyimage.com with size 150x400
NSImage *image2 = [LoremIpsum placeholderImageFromService:LoremIpsumPlaceholderImageServiceDummyImageCom
                                                withWidth:150
                                                   height:400];

// create a grayscale image from placekitten.com with size 300x300
NSImage *image3 = [LoremIpsum placeholderImageFromService:LoremIpsumPlaceholderImageServicePlaceKittenCom
                                                withWidth:300
                                                   height:300
                                                grayscale:YES];
```

## Example Projects

This repository contains two [example projects](/Examples/) for each platform where the usage of `LoremIpsum` is shown.

![Mac OS X Example Screenshot](/Screenshot.png)

## Author

Lukas Kubanek

- [lukaskubanek.com](http://lukaskubanek.com)
- [@kubanekl](https://twitter.com/kubanekl)

## License

Usage is provided under the [MIT License](http://opensource.org/licenses/MIT). See [License.markdown](License.md) for the full details.