//
//  LoremIpsum.m
//  LoremIpsum
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import "LoremIpsum.h"

@implementation LoremIpsum

+ (NSArray *)words
{
    static NSArray *words = nil;
    if (words == nil) {
        words = [@"alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut aut reiciendis voluptatibus maiores doloribus asperiores repellat" componentsSeparatedByString:@" "];
    }
    return words;
}

+ (NSString *)word
{
    return [self wordsWithNumber:1];
}

+ (NSString *)wordsWithNumber:(NSInteger)numberOfWords
{
    NSAssert(numberOfWords > 0, @"The number of words has to be greater than zero.");
    
    NSMutableArray *words = [NSMutableArray arrayWithCapacity:numberOfWords];
    for (NSInteger i = 0; i < numberOfWords; i++) {
        NSInteger randomIndex = arc4random() % [[LoremIpsum words] count];
        [words addObject:[[self words] objectAtIndex:randomIndex]];
    }
    return [words componentsJoinedByString:@" "];
}

+ (NSString *)sentence
{
    return [self sentencesWithNumber:1];
}

+ (NSString *)sentencesWithNumber:(NSInteger)numberOfSentences
{
    NSAssert(numberOfSentences > 0, @"The number of sentences has to be greater than zero.");
    
    NSMutableArray *sentences = [NSMutableArray arrayWithCapacity:numberOfSentences];
    for (NSInteger i = 0; i < numberOfSentences; i++) {
        NSInteger numberOfWords = 4 + arc4random() % 12;
        NSString *sentence = [self wordsWithNumber:numberOfWords];
        sentence = [sentence stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                     withString:[[sentence substringToIndex:1] capitalizedString]];
        [sentences addObject:sentence];
    }
    return [[sentences componentsJoinedByString:@". "] stringByAppendingString:@"."];
}

+ (NSString *)paragraph
{
    return [self paragraphsWithNumber:1];
}

+ (NSString *)paragraphsWithNumber:(NSInteger)numberOfParagraphs
{
    NSAssert(numberOfParagraphs > 0, @"The number of paragraphs has to be greater than zero.");
    
    NSMutableArray *paragraphs = [NSMutableArray arrayWithCapacity:numberOfParagraphs];
    for (NSInteger i = 0; i < numberOfParagraphs; i++) {
        NSInteger numberOfSentences = 3 + arc4random() % 6;
        [paragraphs addObject:[self sentencesWithNumber:numberOfSentences]];
    }
    return [paragraphs componentsJoinedByString:@"\n"];
}

+ (NSString *)title
{
    NSInteger number0fWords = 2 + arc4random() % 5;
    return [[self wordsWithNumber:number0fWords] capitalizedString];
}

@end