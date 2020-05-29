/*
 *        __                                 ____
 *       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
 *      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
 *     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
 *    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
 *                                          /_/
 *
 *                            TextsViewController.h
 *                   http://github.com/lukaskubanek/LoremIpsum
 *             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

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
    [self loadText:nil];
}

- (IBAction)loadText:(id)sender
{
    self.data = @[@{@"type" : @"1 word", @"value" : LoremIpsum.word},
                  @{@"type" : @"5 words", @"value" : [LoremIpsum wordsWithNumber:5]},
                  @{@"type" : @"1 sentence", @"value" : LoremIpsum.sentence},
                  @{@"type" : @"2 sentences", @"value" : [LoremIpsum sentencesWithNumber:2]},
                  @{@"type" : @"1 paragraph", @"value" : LoremIpsum.paragraph},
                  @{@"type" : @"2 paragraphs", @"value" : [LoremIpsum paragraphsWithNumber:2]},
                  @{@"type" : @"Title", @"value" : LoremIpsum.title},
                  @{@"type" : @"Date", @"value" : LoremIpsum.date},
                  @{@"type" : @"First name", @"value" : LoremIpsum.firstName},
                  @{@"type" : @"Last name", @"value" : LoremIpsum.lastName},
                  @{@"type" : @"Name", @"value" : LoremIpsum.name},
                  @{@"type" : @"Email address", @"value" : LoremIpsum.email},
                  @{@"type" : @"URL", @"value" : LoremIpsum.URL},
                  @{@"type" : @"Tweet", @"value" : LoremIpsum.tweet}];
    
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
