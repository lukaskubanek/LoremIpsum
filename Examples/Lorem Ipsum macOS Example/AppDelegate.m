/*
 *        __                                 ____
 *       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
 *      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
 *     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
 *    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
 *                                          /_/
 *
 *                                 AppDelegate.m
 *                   http://github.com/lukaskubanek/LoremIpsum
 *             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

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
    
    self.currentViewController = viewController;
}

@end
