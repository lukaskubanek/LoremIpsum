//
//  TextsViewController.m
//  Lorem Ipsum Mac OS X Example
//
//  Created by Lukas Kubanek on 25.05.2013.
//
//

#import "TextsViewController.h"
#import "LoremIpsum.h"

@interface TextsViewController () <NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;
@property (strong) NSArray *data;

@end

@implementation TextsViewController

- (void)awakeFromNib
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.dataSource = self;   
}

- (IBAction)loadText:(id)sender
{
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:13];
    [data addObject:@{@"type" : @"1 word", @"value" : [LoremIpsum word]}];
    [data addObject:@{@"type" : @"5 words", @"value" : [LoremIpsum wordsWithNumber:5]}];
    [data addObject:@{@"type" : @"1 sentence", @"value" : [LoremIpsum sentence]}];
    [data addObject:@{@"type" : @"2 sentences", @"value" : [LoremIpsum sentencesWithNumber:2]}];
    [data addObject:@{@"type" : @"2 paragraphs", @"value" : [LoremIpsum paragraphsWithNumber:2]}];
    [data addObject:@{@"type" : @"Title", @"value" : [LoremIpsum title]}];
    [data addObject:@{@"type" : @"Date", @"value" : [LoremIpsum date]}];
    [data addObject:@{@"type" : @"First name", @"value" : [LoremIpsum firstName]}];
    [data addObject:@{@"type" : @"Last name", @"value" : [LoremIpsum lastName]}];
    [data addObject:@{@"type" : @"Name", @"value" : [LoremIpsum name]}];
    [data addObject:@{@"type" : @"Email address", @"value" : [LoremIpsum email]}];
    [data addObject:@{@"type" : @"URL", @"value" : [LoremIpsum URL]}];
    [data addObject:@{@"type" : @"Tweet", @"value" : [LoremIpsum tweet]}];
    self.data = [data copy];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [self.data count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSDictionary *entry = [self.data objectAtIndex:row];
    if ([[tableColumn identifier] isEqualToString:@"type"]) {
        return [entry valueForKey:@"type"];
    } else {
        return [entry valueForKey:@"value"];
    }
}

@end