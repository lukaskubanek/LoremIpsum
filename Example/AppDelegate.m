//
//  AppDelegate.m
//  LoremIpsum Example
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import "AppDelegate.h"
#import "LoremIpsum.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"1 word: %@", [LoremIpsum word]);
    NSLog(@"2 words: %@", [LoremIpsum wordsWithNumber:2]);
    NSLog(@"5 words: %@", [LoremIpsum wordsWithNumber:5]);
    
    NSLog(@"1 sentence: %@", [LoremIpsum sentence]);
    NSLog(@"2 sentences: %@", [LoremIpsum sentencesWithNumber:2]);
    NSLog(@"5 sentences: %@", [LoremIpsum sentencesWithNumber:5]);
    
    NSLog(@"1 paragraph: %@", [LoremIpsum paragraph]);
    NSLog(@"3 paragraphs: %@", [LoremIpsum paragraphsWithNumber:3]);
    
    NSLog(@"Title: %@", [LoremIpsum title]);
    
    NSLog(@"Date: %@", [LoremIpsum date]);
    
    NSLog(@"First name: %@", [LoremIpsum firstName]);
    NSLog(@"Last name: %@", [LoremIpsum lastName]);
    NSLog(@"Name: %@", [LoremIpsum name]);
    
    NSLog(@"Email: %@", [LoremIpsum email]);
}

@end