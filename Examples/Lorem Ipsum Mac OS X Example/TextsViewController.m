//
//  TextsViewController.m
//  Lorem Ipsum Mac OS X Example
//
//  Created by Lukas Kubanek on 25.05.2013.
//
//

#import "TextsViewController.h"

@interface TextsViewController ()

@property (weak) IBOutlet NSTextField *textField;

@end

@implementation TextsViewController

- (void)awakeFromNib
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (IBAction)loadText:(id)sender
{
    
}

@end