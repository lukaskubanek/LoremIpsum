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
 *             2013-2014 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import "ViewController.h"
#import "LoremIpsum.h"

@interface NSArray (LoremIpsum)

- (id)li_randomObject;

@end

@interface ViewController ()

@property (weak) IBOutlet UIImageView *imageView;
@property (weak) IBOutlet UILabel *informationLabel;

@end

@implementation ViewController

- (IBAction)loadImage:(id)sender
{
    NSArray *services = @[@(LIPlaceholderImageServiceLoremPixel),
            @(LIPlaceholderImageServiceDummyImage),
            @(LIPlaceholderImageServicePlaceKitten)];
    LIPlaceholderImageService service = (LIPlaceholderImageService)[[services li_randomObject] intValue];
    CGSize size = CGSizeMake(MAX(100, arc4random() % (NSInteger)self.imageView.frame.size.width),
            MAX(100, arc4random() % (NSInteger)self.imageView.frame.size.height));

    NSString *serviceString = nil;
    if (service == LIPlaceholderImageServiceLoremPixel) {
        serviceString = @"lorempixel.com";
    } else if (service == LIPlaceholderImageServiceDummyImage) {
        serviceString = @"dummyimage.com";
    } else if (service == LIPlaceholderImageServicePlaceKitten) {
        serviceString = @"placekitten.com";
    }

    NSString *information = [NSString stringWithFormat:@"%@ %0.fx%0.f", serviceString, size.width, size.height];

    [LoremIpsum asyncPlaceholderImageFromService:service
                                        withSize:size
                                      completion:^(UIImage *image) {
        self.imageView.image = image;
        self.informationLabel.text = information;
    }];
}

@end
