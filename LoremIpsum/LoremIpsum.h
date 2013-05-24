//
//  LoremIpsum.h
//  LoremIpsum
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import <Foundation/Foundation.h>

@interface LoremIpsum : NSObject

+ (NSString *)word;
+ (NSString *)wordsWithNumber:(NSInteger)numberOfWords;
+ (NSString *)sentence;
+ (NSString *)sentencesWithNumber:(NSInteger)numberOfSentences;
+ (NSString *)paragraph;
+ (NSString *)paragraphsWithNumber:(NSInteger)numberOfParagraphs;
+ (NSString *)title;
+ (NSDate *)date;
+ (NSString *)name;
+ (NSString *)firstName;
+ (NSString *)lastName;
+ (NSString *)email;
+ (NSString *)tweet;

@end