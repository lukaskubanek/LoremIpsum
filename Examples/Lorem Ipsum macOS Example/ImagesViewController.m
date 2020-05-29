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
 *             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import "ImagesViewController.h"
#import "LoremIpsum.h"

@interface NSArray (LoremIpsum)

- (id)li_randomObject;

@end

@interface ImagesViewController ()

@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak) IBOutlet NSButton *button;
@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSTextField *informationLabel;

- (IBAction)loadImage:(id)sender;

@end

@implementation ImagesViewController

- (void)awakeFromNib
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self loadImage:nil];
}

- (IBAction)loadImage:(id)sender
{
    [self.progressIndicator startAnimation:nil];

    self.progressIndicator.hidden = NO;
    self.button.enabled = NO;
    self.informationLabel.stringValue = @"Loading…";
    self.imageView.image = nil;

    self.button.title = @"Load Another Image";
    
    NSArray *services = @[@(LIPlaceholderImageServiceLoremPixel),
            @(LIPlaceholderImageServiceDummyImage),
            @(LIPlaceholderImageServicePlaceKitten)];
    LIPlaceholderImageService service = (LIPlaceholderImageService)[[services li_randomObject] intValue];
    NSSize size = NSMakeSize(MAX(70, arc4random() % 420), MAX(70, arc4random() % 420));

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
                                      completion:^(NSImage *image) {
        self.imageView.image = image;
        self.informationLabel.stringValue = information;

        self.progressIndicator.hidden = YES;
        self.button.enabled = YES;
    }];
}

@end
