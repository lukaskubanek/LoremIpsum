//
//  ImagesViewController.m
//  Lorem Ipsum Mac OS X Example
//
//  Created by Lukas Kubanek on 25.05.2013.
//
//

#import "ImagesViewController.h"
#import "LoremIpsum.h"

@implementation ImagesViewController

- (void)awakeFromNib
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSImage *image = [LoremIpsum placeholderImageFromService:service
                                                       withWidth:width
                                                          height:height
                                                      grayscaled:grayscaled];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            self.informationLabel.stringValue = information;
        });
    });
}

@end