/*
 *        __                                 ____
 *       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
 *      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
 *     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
 *    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
 *                                          /_/
 *
 *                                 LoremIpsum.m
 *                   http://github.com/lukaskubanek/LoremIpsum
 *             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import "LoremIpsum.h"

#import <TargetConditionals.h>

#if TARGET_OS_IPHONE
typedef UIImage LIImage;
typedef CGSize LISize;
typedef UIColor LIColor;
#elif TARGET_OS_MAC
typedef NSImage LIImage;
typedef NSSize LISize;
typedef NSColor LIColor;
#endif

NSUInteger const LINumberOfLastYears = 4;
NSUInteger const LIMinNumberOfWordsInSentence = 4;
NSUInteger const LIMaxNumberOfWordsInSentence = 16;
NSUInteger const LIMinNumberOfSentencesInParagraph = 3;
NSUInteger const LIMaxNumberOfSentencesInParagraph = 9;
NSUInteger const LIMinNumberOfWordsInTitle = 2;
NSUInteger const LIMaxNumberOfWordsInTitle = 7;

NSUInteger LIRandomUnsignedInteger(NSUInteger lowerBound, NSUInteger upperBound) {
    return arc4random_uniform(upperBound - lowerBound) + lowerBound;
}

@implementation NSArray (LoremIpsum)

- (id)li_randomObject
{
    return [self objectAtIndex:LIRandomUnsignedInteger(0, [self count])];
}

@end

@implementation NSString (LoremIpsum)

- (NSString *)li_stringByCapitalizingFirstLetter
{
    NSString *capitalizedFirstLetter = [[self substringToIndex:1] capitalizedString];
    return [self stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                         withString:capitalizedFirstLetter];
}

@end

@implementation LoremIpsum

#pragma mark - Content Database

+ (nonnull NSArray <NSString *> *)words
{
    static NSArray *words = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        words = [@"alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut aut reiciendis voluptatibus maiores doloribus asperiores repellat" componentsSeparatedByString:@" "];
    });

    return words;
}

+ (nonnull NSArray <NSString *> *)firstNames
{
    static NSArray *firstNames = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        firstNames = [@"Judith Angelo Margarita Kerry Elaine Lorenzo Justice Doris Raul Liliana Kerry Elise Ciaran Johnny Moses Davion Penny Mohammed Harvey Sheryl Hudson Brendan Brooklynn Denis Sadie Trisha Jacquelyn Virgil Cindy Alexa Marianne Giselle Casey Alondra Angela Katherine Skyler Kyleigh Carly Abel Adrianna Luis Dominick Eoin Noel Ciara Roberto Skylar Brock Earl Dwayne Jackie Hamish Sienna Nolan Daren Jean Shirley Connor Geraldine Niall Kristi Monty Yvonne Tammie Zachariah Fatima Ruby Nadia Anahi Calum Peggy Alfredo Marybeth Bonnie Gordon Cara John Staci Samuel Carmen Rylee Yehudi Colm Beth Dulce Darius inley Javon Jason Perla Wayne Laila Kaleigh Maggie Don Quinn Collin Aniya Zoe Isabel Clint Leland Esmeralda Emma Madeline Byron Courtney Vanessa Terry Antoinette George Constance Preston Rolando Caleb Kenneth Lynette Carley Francesca Johnnie Jordyn Arturo Camila Skye Guy Ana Kaylin Nia Colton Bart Brendon Alvin Daryl Dirk Mya Pete Joann Uriel Alonzo Agnes Chris Alyson Paola Dora Elias Allen Jackie Eric Bonita Kelvin Emiliano Ashton Kyra Kailey Sonja Alberto Ty Summer Brayden Lori Kelly Tomas Joey Billie Katie Stephanie Danielle Alexis Jamal Kieran Lucinda Eliza Allyson Melinda Alma Piper Deana Harriet Bryce Eli Jadyn Rogelio Orlaith Janet Randal Toby Carla Lorie Caitlyn Annika Isabelle inn Ewan Maisie Michelle Grady Ida Reid Emely Tricia Beau Reese Vance Dalton Lexi Rafael Makenzie Mitzi Clinton Xena Angelina Kendrick Leslie Teddy Jerald Noelle Neil Marsha Gayle Omar Abigail Alexandra Phil Andre Billy Brenden Bianca Jared Gretchen Patrick Antonio Josephine Kyla Manuel Freya Kellie Tonia Jamie Sydney Andres Ruben Harrison Hector Clyde Wendell Kaden Ian Tracy Cathleen Shawn" componentsSeparatedByString:@" "];
    });

    return firstNames;
}

+ (nonnull NSArray <NSString *> *)lastNames
{
    static NSArray *lastNames = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lastNames = [@"Chung Chen Melton Hill Puckett Song Hamilton Bender Wagner McLaughlin McNamara Raynor Moon Woodard Desai Wallace Lawrence Griffin Dougherty Powers May Steele Teague Vick Gallagher Solomon Walsh Monroe Connolly Hawkins Middleton Goldstein Watts Johnston Weeks Wilkerson Barton Walton Hall Ross Chung Bender Woods Mangum Joseph Rosenthal Bowden Barton Underwood Jones Baker Merritt Cross Cooper Holmes Sharpe Morgan Hoyle Allen Rich Rich Grant Proctor Diaz Graham Watkins Hinton Marsh Hewitt Branch Walton O'Brien Case Watts Christensen Parks Hardin Lucas Eason Davidson Whitehead Rose Sparks Moore Pearson Rodgers Graves Scarborough Sutton Sinclair Bowman Olsen Love McLean Christian Lamb James Chandler Stout Cowan Golden Bowling Beasley Clapp Abrams Tilley Morse Boykin Sumner Cassidy Davidson Heath Blanchard McAllister McKenzie Byrne Schroeder Griffin Gross Perkins Robertson Palmer Brady Rowe Zhang Hodge Li Bowling Justice Glass Willis Hester Floyd Graves Fischer Norman Chan Hunt Byrd Lane Kaplan Heller May Jennings Hanna Locklear Holloway Jones Glover Vick O'Donnell Goldman McKenna Starr Stone McClure Watson Monroe Abbott Singer Hall Farrell Lucas Norman Atkins Monroe Robertson Sykes Reid Chandler Finch Hobbs Adkins Kinney Whitaker Alexander Conner Waters Becker Rollins Love Adkins Black Fox Hatcher Wu Lloyd Joyce Welch Matthews Chappell MacDonald Kane Butler Pickett Bowman Barton Kennedy Branch Thornton McNeill Weinstein Middleton Moss Lucas Rich Carlton Brady Schultz Nichols Harvey Stevenson Houston Dunn West O'Brien Barr Snyder Cain Heath Boswell Olsen Pittman Weiner Petersen Davis Coleman Terrell Norman Burch Weiner Parrott Henry Gray Chang McLean Eason Weeks Siegel Puckett Heath Hoyle Garrett Neal Baker Goldman Shaffer Choi Carver" componentsSeparatedByString:@" "];
    });

    return lastNames;
}

+ (nonnull NSArray <NSString *> *)emailDomains
{
    static NSArray *emailDomains = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        emailDomains = [@"gmail.com yahoo.com hotmail.com email.com live.com me.com mac.com aol.com fastmail.com mail.com" componentsSeparatedByString:@" "];
    });

    return emailDomains;
}

+ (nonnull NSArray <NSString *> *)domains
{
    static NSArray *domains = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        domains = [@"twitter.com google.com youtube.com wordpress.org adobe.com blogspot.com godaddy.com wikipedia.org wordpress.com yahoo.com linkedin.com amazon.com flickr.com w3.org apple.com myspace.com tumblr.com digg.com microsoft.com vimeo.com pinterest.com qq.com stumbleupon.com youtu.be addthis.com miibeian.gov.cn delicious.com baidu.com feedburner.com bit.ly" componentsSeparatedByString:@" "];
    });

    return domains;
}

#pragma mark - Texts

+ (NSString *)word
{
    return [self wordsWithNumber:1];
}

+ (NSString *)wordsWithNumber:(NSUInteger)numberOfWords
{
    NSAssert(numberOfWords > 0, @"The number of words has to be greater than zero.");

    NSMutableArray *words = [NSMutableArray arrayWithCapacity:numberOfWords];
    for (NSUInteger i = 0; i < numberOfWords; i++) {
        [words addObject:[[self words] li_randomObject]];
    }
    return [words componentsJoinedByString:@" "];
}

+ (NSString *)sentence
{
    return [self sentencesWithNumber:1];
}

+ (NSString *)sentencesWithNumber:(NSUInteger)numberOfSentences
{
    NSAssert(numberOfSentences > 0, @"The number of sentences has to be greater than zero.");

    NSMutableArray *sentences = [NSMutableArray arrayWithCapacity:numberOfSentences];
    for (NSUInteger i = 0; i < numberOfSentences; i++) {
        NSUInteger numberOfWords = LIRandomUnsignedInteger(LIMinNumberOfWordsInSentence, LIMaxNumberOfWordsInSentence);
        NSString *sentence = [[self wordsWithNumber:numberOfWords] li_stringByCapitalizingFirstLetter];
        [sentences addObject:sentence];
    }
    return [[sentences componentsJoinedByString:@". "] stringByAppendingString:@"."];
}

+ (NSString *)paragraph
{
    return [self paragraphsWithNumber:1];
}

+ (NSString *)paragraphsWithNumber:(NSUInteger)numberOfParagraphs
{
    NSAssert(numberOfParagraphs > 0, @"The number of paragraphs has to be greater than zero.");

    NSMutableArray *paragraphs = [NSMutableArray arrayWithCapacity:numberOfParagraphs];
    for (NSUInteger i = 0; i < numberOfParagraphs; i++) {
        NSUInteger numberOfSentences = LIRandomUnsignedInteger(LIMinNumberOfSentencesInParagraph, LIMaxNumberOfSentencesInParagraph);
        [paragraphs addObject:[self sentencesWithNumber:numberOfSentences]];
    }
    return [paragraphs componentsJoinedByString:@"\n"];
}

+ (NSString *)title
{
    NSUInteger numberOfWords = LIRandomUnsignedInteger(LIMinNumberOfWordsInTitle, LIMaxNumberOfWordsInTitle);
    return [[self wordsWithNumber:numberOfWords] capitalizedString];
}

#pragma mark - Misc Data

+ (NSString *)name
{
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

+ (NSString *)firstName
{
    return [[self firstNames] li_randomObject];
}

+ (NSString *)lastName
{
    return [[self lastNames] li_randomObject];
}

+ (NSString *)email
{
    NSString *domain = [[self emailDomains] li_randomObject];
    NSString *delimiter = [@[@"", @".", @"-", @"_"] li_randomObject];
    return [[[[[[self firstName]
            stringByAppendingString:delimiter]
            stringByAppendingString:[self lastName]]
            stringByAppendingString:@"@"]
            stringByAppendingString:domain]
            lowercaseString];
}

+ (NSURL *)URL
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/", [[self domains] li_randomObject]]];
}

/* source: http://www.kevadamson.com/talking-of-design/article/140-alternative-characters-to-lorem-ipsum */
+ (NSString *)tweet
{
    NSArray <NSString *> *tweets = @[
            @"Far away, in a forest next to a river beneath the mountains, there lived a small purple otter called Philip. Philip likes sausages. The End.",
            @"He liked the quality sausages from Marks & Spencer but due to the recession he had been forced to shop in a less desirable supermarket. End.",
            @"He awoke one day to find his pile of sausages missing. Roger the greedy boar with human eyes, had skateboarded into the forest & eaten them!"
    ];
    return [tweets li_randomObject];
}

+ (NSDate *)date
{
    NSDate *currentDate = [NSDate date];

    NSDateComponents *referenceDateComponents = [[NSDateComponents alloc] init];
    [referenceDateComponents setYear:-LINumberOfLastYears];
    NSDate *referenceDate = [[NSCalendar currentCalendar] dateByAddingComponents:referenceDateComponents
                                                                          toDate:currentDate
                                                                         options:0];

    NSTimeInterval timeIntervalSinceReferenceDate = [currentDate timeIntervalSinceDate:referenceDate];
    NSTimeInterval randomTimeInterval = LIRandomUnsignedInteger(0, (NSUInteger)timeIntervalSinceReferenceDate);

    return [referenceDate dateByAddingTimeInterval:randomTimeInterval];
}

#pragma mark - URLs for Placeholder Images

+ (NSURL *)URLForPlaceholderImageWithSize:(LISize)size
{
    return [self URLForPlaceholderImageFromService:LIPlaceholderImageServiceDefault
                                          withSize:size];
}

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(LISize)size
{
    NSString *URLString;
    NSUInteger width = (NSUInteger)size.width;
    NSUInteger height = (NSUInteger)size.height;

    switch (service) {
        case LIPlaceholderImageServiceLoremPixel: {
            URLString = [NSString stringWithFormat:@"http://lorempixel.com/%zd/%zd/", width, height];
            break;
        }

        case LIPlaceholderImageServiceDummyImage: {
            URLString = [NSString stringWithFormat:@"http://dummyimage.com/%zdx%zd", width, height];
            break;
        }

        case LIPlaceholderImageServicePlaceKitten: {
            URLString = [NSString stringWithFormat:@"http://placekitten.com/%zd/%zd/", width, height];
            break;
        }
    }

    return [NSURL URLWithString:URLString];
}

#pragma mark - Colors

static LIColor *_LISeedDarkColor(long seed)
{
    srand48(seed);
    CGFloat hue = drand48();
    CGFloat saturation = 0.5;
    CGFloat brightness = 0.3 + 0.1 * drand48();
    return [LIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

static LIColor *_LISeedLightColor(long seed)
{
    srand48(seed);
    CGFloat hue = drand48();
    CGFloat saturation = 0.5;
    CGFloat brightness = 1.0 - 0.1 * drand48();
    return [LIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#if TARGET_OS_OSX
API_AVAILABLE(macos(10.15))
#else
API_AVAILABLE(ios(13.0))
#endif
static LIColor *_LIDynamicColor(LIColor *first, LIColor* second)
{
#if TARGET_OS_OSX
    return [NSColor colorWithName:nil dynamicProvider:^NSColor * _Nonnull(NSAppearance * _Nonnull appearance) {
        if([appearance bestMatchFromAppearancesWithNames:@[NSAppearanceNameDarkAqua, NSAppearanceNameAqua]] == NSAppearanceNameDarkAqua)
        {
            return second;
        }
        else
        {
            return first;
        }
    }];
#else
    return [LIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull collection) {
        if(collection.userInterfaceStyle == UIUserInterfaceStyleDark)
        {
            return second;
        }
        else
        {
            return first;
        }
    }];
#endif
}

#if TARGET_OS_OSX
API_AVAILABLE(macos(10.15))
#else
API_AVAILABLE(ios(13.0))
#endif
static LIColor *_LISeedAdaptiveColor(long seed)
{
    LIColor* light = _LISeedLightColor(seed);
    LIColor* dark = _LISeedDarkColor(seed);
    return _LIDynamicColor(light, dark);
}

#if TARGET_OS_OSX
API_AVAILABLE(macos(10.15))
#else
API_AVAILABLE(ios(13.0))
#endif
static LIColor *_LISeedAdaptiveInvertedColor(long seed)
{
    LIColor* light = _LISeedLightColor(seed);
    LIColor* dark = _LISeedDarkColor(seed);
    return _LIDynamicColor(dark, light);
}


+ (LIColor *)lightColor
{
    return _LISeedLightColor(arc4random());
}

+ (LIColor *)darkColor
{
    return _LISeedDarkColor(arc4random());
}

+ (LIColor *)adaptiveColor
#if TARGET_OS_OSX
API_AVAILABLE(macos(10.15))
#else
API_AVAILABLE(ios(13.0))
#endif
{
    return _LISeedAdaptiveColor(arc4random());
}

+ (LIColor *)invertedAdaptiveColor
#if TARGET_OS_OSX
API_AVAILABLE(macos(10.15))
#else
API_AVAILABLE(ios(13.0))
#endif
{
    return _LISeedAdaptiveInvertedColor(arc4random());
}

#pragma mark - Placeholder Images

+ (LIImage *)placeholderImageWithSize:(LISize)size
{
    return [self placeholderImageFromService:LIPlaceholderImageServiceDefault
                                    withSize:size];
}

+ (LIImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(LISize)size
{
    NSURL *imageURL = [self URLForPlaceholderImageFromService:service
                                                     withSize:size];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

    if (imageData) {
        return [[LIImage alloc] initWithData:imageData];
    }

    return nil;
}

+ (void)asyncPlaceholderImageWithSize:(LISize)size
                           completion:(void (^)(LIImage *LIImage))completion
{
    [self asyncPlaceholderImageFromService:LIPlaceholderImageServiceDefault
                                  withSize:size
                                completion:completion];
}

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(LISize)size
                              completion:(void (^)(LIImage *LIImage))completion
{
    NSAssert(completion, @"The completion block must not be nil.");

    NSURL *imageURL = [self URLForPlaceholderImageFromService:service
                                                     withSize:size];

    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];

    void (^completionHandler)(NSData *, NSError *) = ^(NSData *data,
                                                       NSError *error) {
        LIImage *image = nil;

        if (!error && data) {
            image = [[LIImage alloc] initWithData:data];
        }

        [mainQueue addOperationWithBlock:^{
            completion(image);
        }];
    };

#if TARGET_OS_OSX
    if (@available(macOS 10.9, *)) {
#endif
        [[NSURLSession.sharedSession dataTaskWithURL:imageURL
                                   completionHandler:^(NSData * _Nullable data,
                                                       NSURLResponse * _Nullable response,
                                                       NSError * _Nullable error) {
            completionHandler(data, error);
        }] resume];
#if TARGET_OS_OSX
    } else {
        NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];

        [NSURLConnection sendAsynchronousRequest:request
                                           queue:mainQueue
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data,
                                                   NSError *error) {
            completionHandler(data, error);
        }];
    }
#endif
}

@end
