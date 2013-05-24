//
//  LoremIpsum.m
//  LoremIpsum
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import "LoremIpsum.h"

@implementation NSArray (LoremIpsum)

- (id)randomObject
{
    return [self objectAtIndex:arc4random() % [self count]];
}

@end

@implementation LoremIpsum

+ (NSArray *)words
{
    static NSArray *words = nil;
    if (!words) {
        words = [@"alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut aut reiciendis voluptatibus maiores doloribus asperiores repellat" componentsSeparatedByString:@" "];
    }
    return words;
}

+ (NSArray *)firstNames
{
    static NSArray *firstNames = nil;
    if (!firstNames) {
        firstNames = [@"Judith Angelo Margarita Kerry Elaine Lorenzo Justice Doris Raul Liliana Kerry Elise Ciaran Johnny Moses Davion Penny Mohammed Harvey Sheryl Hudson Brendan Brooklynn Denis Sadie Trisha Jacquelyn Virgil Cindy Alexa Marianne Giselle Casey Alondra Angela Katherine Skyler Kyleigh Carly Abel Adrianna Luis Dominick Eoin Noel Ciara Roberto Skylar Brock Earl Dwayne Jackie Hamish Sienna Nolan Daren Jean Shirley Connor Geraldine Niall Kristi Monty Yvonne Tammie Zachariah Fatima Ruby Nadia Anahi Calum Peggy Alfredo Marybeth Bonnie Gordon Cara John Staci Samuel Carmen Rylee Yehudi Colm Beth Dulce Darius inley Javon Jason Perla Wayne Laila Kaleigh Maggie Don Quinn Collin Aniya Zoe Isabel Clint Leland Esmeralda Emma Madeline Byron Courtney Vanessa Terry Antoinette George Constance Preston Rolando Caleb Kenneth Lynette Carley Francesca Johnnie Jordyn Arturo Camila Skye Guy Ana Kaylin Nia Colton Bart Brendon Alvin Daryl Dirk Mya Pete Joann Uriel Alonzo Agnes Chris Alyson Paola Dora Elias Allen Jackie Eric Bonita Kelvin Emiliano Ashton Kyra Kailey Sonja Alberto Ty Summer Brayden Lori Kelly Tomas Joey Billie Katie Stephanie Danielle Alexis Jamal Kieran Lucinda Eliza Allyson Melinda Alma Piper Deana Harriet Bryce Eli Jadyn Rogelio Orlaith Janet Randal Toby Carla Lorie Caitlyn Annika Isabelle inn Ewan Maisie Michelle Grady Ida Reid Emely Tricia Beau Reese Vance Dalton Lexi Rafael Makenzie Mitzi Clinton Xena Angelina Kendrick Leslie Teddy Jerald Noelle Neil Marsha Gayle Omar Abigail Alexandra Phil Andre Billy Brenden Bianca Jared Gretchen Patrick Antonio Josephine Kyla Manuel Freya Kellie Tonia Jamie Sydney Andres Ruben Harrison Hector Clyde Wendell Kaden Ian Tracy Cathleen Shawn" componentsSeparatedByString:@" "];
    }
    return firstNames;
}

+ (NSArray *)lastNames
{
    static NSArray *lastNames = nil;
    if (!lastNames) {
        lastNames = [@"Chung Chen Melton Hill Puckett Song Hamilton Bender Wagner McLaughlin McNamara Raynor Moon Woodard Desai Wallace Lawrence Griffin Dougherty Powers May Steele Teague Vick Gallagher Solomon Walsh Monroe Connolly Hawkins Middleton Goldstein Watts Johnston Weeks Wilkerson Barton Walton Hall Ross Chung Bender Woods Mangum Joseph Rosenthal Bowden Barton Underwood Jones Baker Merritt Cross Cooper Holmes Sharpe Morgan Hoyle Allen Rich Rich Grant Proctor Diaz Graham Watkins Hinton Marsh Hewitt Branch Walton O'Brien Case Watts Christensen Parks Hardin Lucas Eason Davidson Whitehead Rose Sparks Moore Pearson Rodgers Graves Scarborough Sutton Sinclair Bowman Olsen Love McLean Christian Lamb James Chandler Stout Cowan Golden Bowling Beasley Clapp Abrams Tilley Morse Boykin Sumner Cassidy Davidson Heath Blanchard McAllister McKenzie Byrne Schroeder Griffin Gross Perkins Robertson Palmer Brady Rowe Zhang Hodge Li Bowling Justice Glass Willis Hester Floyd Graves Fischer Norman Chan Hunt Byrd Lane Kaplan Heller May Jennings Hanna Locklear Holloway Jones Glover Vick O'Donnell Goldman McKenna Starr Stone McClure Watson Monroe Abbott Singer Hall Farrell Lucas Norman Atkins Monroe Robertson Sykes Reid Chandler Finch Hobbs Adkins Kinney Whitaker Alexander Conner Waters Becker Rollins Love Adkins Black Fox Hatcher Wu Lloyd Joyce Welch Matthews Chappell MacDonald Kane Butler Pickett Bowman Barton Kennedy Branch Thornton McNeill Weinstein Middleton Moss Lucas Rich Carlton Brady Schultz Nichols Harvey Stevenson Houston Dunn West O'Brien Barr Snyder Cain Heath Boswell Olsen Pittman Weiner Petersen Davis Coleman Terrell Norman Burch Weiner Parrott Henry Gray Chang McLean Eason Weeks Siegel Puckett Heath Hoyle Garrett Neal Baker Goldman Shaffer Choi Carver" componentsSeparatedByString:@" "];
    }
    return lastNames;
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
        [words addObject:[[self words] randomObject]];
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

+ (NSString *)name
{
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

+ (NSString *)firstName
{
    return [[self firstNames] randomObject];
}

+ (NSString *)lastName
{
    return [[self lastNames] randomObject];
}

@end