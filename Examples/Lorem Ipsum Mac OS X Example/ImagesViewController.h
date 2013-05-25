//
//  ImagesViewController.h
//  Lorem Ipsum Mac OS X Example
//
//  Created by Lukas Kubanek on 25.05.2013.
//
//

#import <Cocoa/Cocoa.h>

@interface ImagesViewController : NSViewController

@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSTextField *informationLabel;

- (IBAction)loadImage:(id)sender;

@end