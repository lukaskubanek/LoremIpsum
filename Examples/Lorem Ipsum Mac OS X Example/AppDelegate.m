//
//  AppDelegate.m
//  LoremIpsum Example
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import "AppDelegate.h"
#import "LoremIpsum.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"1 word: %@", [LoremIpsum word]);
    NSLog(@"2 words: %@", [LoremIpsum wordsWithNumber:2]);
    NSLog(@"5 words: %@", [LoremIpsum wordsWithNumber:5]);
    
    NSLog(@"1 sentence: %@", [LoremIpsum sentence]);
    NSLog(@"2 sentences: %@", [LoremIpsum sentencesWithNumber:2]);
    NSLog(@"5 sentences: %@", [LoremIpsum sentencesWithNumber:5]);
    
    NSLog(@"1 paragraph: %@", [LoremIpsum paragraph]);
    NSLog(@"3 paragraphs: %@", [LoremIpsum paragraphsWithNumber:3]);
    
    NSLog(@"Title: %@", [LoremIpsum title]);
    
    NSLog(@"Date: %@", [LoremIpsum date]);
    
    NSLog(@"First name: %@", [LoremIpsum firstName]);
    NSLog(@"Last name: %@", [LoremIpsum lastName]);
    NSLog(@"Name: %@", [LoremIpsum name]);
    
    NSLog(@"Email: %@", [LoremIpsum email]);
    NSLog(@"URL: %@", [LoremIpsum URL]);
    
    NSLog(@"Tweet: %@", [LoremIpsum tweet]);
}

- (IBAction)loadImage:(id)sender
{
    NSArray *services = @[@(LoremIpsumPlaceholderImageServiceLoremPixelCom),
                          @(LoremIpsumPlaceholderImageServiceDummyImageCom),
                          @(LoremIpsumPlaceholderImageServicePlaceKittenCom)];
    LoremIpsumPlaceholderImageService service = (LoremIpsumPlaceholderImageService)[[services randomObject] intValue];
    NSInteger width = 70 + arc4random() % 360;
    NSInteger height = 70 + arc4random() % 360;
    BOOL grayscaled = (arc4random() % 2) ? YES : NO;
    
    NSImage *image = [LoremIpsum placeholderImageFromService:service withWidth:width height:height grayscaled:grayscaled];
    
    NSString *serviceString = nil;
    if (service == LoremIpsumPlaceholderImageServiceLoremPixelCom) {
        serviceString = @"lorempixel.com";
    } else if (service == LoremIpsumPlaceholderImageServiceDummyImageCom) {
        serviceString = @"dummyimage.com";
    } else if (service == LoremIpsumPlaceholderImageServicePlaceKittenCom) {
        serviceString = @"placekitten.com";
    }
    NSString *information = [NSString stringWithFormat:@"%@ %lix%li", serviceString, width, height];
    if (grayscaled) information = [information stringByAppendingString:@" grayscaled"];
    
    self.informationLabel.stringValue = information;
    self.imageView.image = image;
}

@end