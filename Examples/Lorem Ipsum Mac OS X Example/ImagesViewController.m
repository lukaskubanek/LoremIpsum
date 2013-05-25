/*
 *        __                                 ____
 *       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
 *      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
 *     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
 *    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
 *                                          /_/
 *
 *                            ImagesViewController.m
 *                   http://github.com/lukaskubanek/LoremIpsum
 *                2013 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import "ImagesViewController.h"
#import "LoremIpsum.h"

@interface ImagesViewController ()

@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSTextField *informationLabel;

@end

@implementation ImagesViewController

- (void)awakeFromNib
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self loadImage:nil];
}

- (IBAction)loadImage:(id)sender
{
    NSArray *services = @[@(LoremIpsumPlaceholderImageServiceLoremPixelCom),
                          @(LoremIpsumPlaceholderImageServiceDummyImageCom),
                          @(LoremIpsumPlaceholderImageServicePlaceKittenCom)];
    LoremIpsumPlaceholderImageService service = (LoremIpsumPlaceholderImageService)[[services randomObject] intValue];
    NSInteger width = MAX(70, arc4random() % 420);
    NSInteger height = MAX(70, arc4random() % 420);
    BOOL grayscale = (arc4random() % 2) ? YES : NO;
    
    NSString *serviceString = nil;
    if (service == LoremIpsumPlaceholderImageServiceLoremPixelCom) {
        serviceString = @"lorempixel.com";
    } else if (service == LoremIpsumPlaceholderImageServiceDummyImageCom) {
        serviceString = @"dummyimage.com";
    } else if (service == LoremIpsumPlaceholderImageServicePlaceKittenCom) {
        serviceString = @"placekitten.com";
    }
    
    NSString *information = [NSString stringWithFormat:@"%@ %lix%li", serviceString, width, height];
    if (grayscale) information = [information stringByAppendingString:@" grayscale"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSImage *image = [LoremIpsum placeholderImageFromService:service
                                                       withWidth:width
                                                          height:height
                                                       grayscale:grayscale];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            self.informationLabel.stringValue = information;
        });
    });
}

@end