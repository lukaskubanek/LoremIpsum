//
//  AppDelegate.m
//  LoremIpsum Example
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import "AppDelegate.h"
#import "ImagesViewController.h"
#import "TextsViewController.h"
#import "LoremIpsum.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSView *mainView;
@property (weak) IBOutlet ImagesViewController *imagesViewController;
@property (weak) IBOutlet TextsViewController *textsViewController;
@property (strong) NSViewController *currentViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self displayViewController:self.imagesViewController];
    
//    NSLog(@"1 word: %@", [LoremIpsum word]);
//    NSLog(@"2 words: %@", [LoremIpsum wordsWithNumber:2]);
//    NSLog(@"5 words: %@", [LoremIpsum wordsWithNumber:5]);
//    
//    NSLog(@"1 sentence: %@", [LoremIpsum sentence]);
//    NSLog(@"2 sentences: %@", [LoremIpsum sentencesWithNumber:2]);
//    NSLog(@"5 sentences: %@", [LoremIpsum sentencesWithNumber:5]);
//    
//    NSLog(@"1 paragraph: %@", [LoremIpsum paragraph]);
//    NSLog(@"3 paragraphs: %@", [LoremIpsum paragraphsWithNumber:3]);
//    
//    NSLog(@"Title: %@", [LoremIpsum title]);
//    
//    NSLog(@"Date: %@", [LoremIpsum date]);
//    
//    NSLog(@"First name: %@", [LoremIpsum firstName]);
//    NSLog(@"Last name: %@", [LoremIpsum lastName]);
//    NSLog(@"Name: %@", [LoremIpsum name]);
//    
//    NSLog(@"Email: %@", [LoremIpsum email]);
//    NSLog(@"URL: %@", [LoremIpsum URL]);
//    
//    NSLog(@"Tweet: %@", [LoremIpsum tweet]);
}

- (IBAction)changeViewController:(id)sender
{
    if (self.currentViewController == self.imagesViewController) {
        [self displayViewController:self.textsViewController];
    } else {
        [self displayViewController:self.imagesViewController];
    }
}

- (void)displayViewController:(NSViewController *)viewController
{
    [self.mainView removeConstraints:[self.mainView constraints]];
    [self.currentViewController.view removeFromSuperview];
    
    [self.mainView addSubview:viewController.view];
    NSDictionary *views = @{@"view": viewController.view};
    [self.mainView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:views]];
    [self.mainView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:views]];
    
    if (viewController == self.imagesViewController) {
        [self.imagesViewController loadImage:nil];
    } else if (viewController == self.textsViewController) {
        [self.textsViewController loadText:nil];
    }
    
    self.currentViewController = viewController;
}

@end