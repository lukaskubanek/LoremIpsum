/*
 *        __                                 ____
 *       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
 *      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
 *     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
 *    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
 *                                          /_/
 *
 *                              ViewController.m
 *                   http://github.com/lukaskubanek/LoremIpsum
 *                2013 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import "ViewController.h"
#import "LoremIpsum.h"

@interface ViewController ()

@property (weak) IBOutlet UIImageView *imageView;
@property (weak) IBOutlet UILabel *informationLabel;

@end

@implementation ViewController

- (IBAction)loadImage:(id)sender
{
    NSArray *services = @[@(LoremIpsumPlaceholderImageServiceLoremPixelCom),
                          @(LoremIpsumPlaceholderImageServiceDummyImageCom),
                          @(LoremIpsumPlaceholderImageServicePlaceKittenCom)];
    LoremIpsumPlaceholderImageService service = (LoremIpsumPlaceholderImageService)[[services randomObject] intValue];
    
    NSInteger width = MAX(100, arc4random() % (NSInteger)self.imageView.frame.size.width);
    NSInteger height = MAX(100, arc4random() % (NSInteger)self.imageView.frame.size.height);
    BOOL grayscaled = (arc4random() % 2) ? YES : NO;
    
    NSString *serviceString = nil;
    if (service == LoremIpsumPlaceholderImageServiceLoremPixelCom) {
        serviceString = @"lorempixel.com";
    } else if (service == LoremIpsumPlaceholderImageServiceDummyImageCom) {
        serviceString = @"dummyimage.com";
    } else if (service == LoremIpsumPlaceholderImageServicePlaceKittenCom) {
        serviceString = @"placekitten.com";
    }
    
    NSString *information = [NSString stringWithFormat:@"%@ %lix%li", serviceString, (long)width, (long)height];
    if (grayscaled) information = [information stringByAppendingString:@" grayscaled"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage *image = [LoremIpsum placeholderImageFromService:service
                                                       withWidth:width
                                                          height:height
                                                      grayscaled:grayscaled];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            self.informationLabel.text = information;
        });
    });
}

@end