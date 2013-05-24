//
//  LoremIpsum.h
//  LoremIpsum
//
//  Created by Lukas Kubanek on 24.05.2013.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    LoremIpsumPlaceholderImageServiceLoremPixelCom,
    LoremIpsumPlaceholderImageServiceDummyImageCom,
    LoremIpsumPlaceholderImageServicePlaceKittenCom,
    LoremIpsumPlaceholderImageServiceDefault = LoremIpsumPlaceholderImageServiceLoremPixelCom
} LoremIpsumPlaceholderImageService;

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
+ (NSString *)URL;
+ (NSString *)tweet;

@end

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

@interface LoremIpsum (Images)



@end

#elif TARGET_OS_MAC

#import <Cocoa/Cocoa.h>

@interface LoremIpsum (Images)

+ (NSImage *)placeholderImageWithWidth:(NSUInteger)width
                                height:(NSUInteger)height;

+ (NSImage *)placeholderImageFromService:(LoremIpsumPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height;

+ (NSImage *)placeholderImageFromService:(LoremIpsumPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                              grayscaled:(BOOL)grayscaled;

@end

#endif