//
//  AppDelegate.h
//  LoremIpsum Example
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import <Cocoa/Cocoa.h>
#import "ImagesViewController.h"
#import "TextsViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSView *mainView;
@property (weak) IBOutlet ImagesViewController *imagesViewController;
@property (weak) IBOutlet TextsViewController *textsViewController;

@end