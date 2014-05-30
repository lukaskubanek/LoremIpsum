/*
 *        __                                 ____
 *       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
 *      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
 *     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
 *    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
 *                                          /_/
 *
 *                                 LoremIpsum.h
 *                   http://github.com/lukaskubanek/LoremIpsum
 *            2013-2014 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#endif

typedef NS_ENUM(NSInteger, LIPlaceholderImageService) {
    LIPlaceholderImageServiceLoremPixel,
    LIPlaceholderImageServiceDummyImage,
    LIPlaceholderImageServicePlaceKitten,
    LIPlaceholderImageServiceDefault = LIPlaceholderImageServiceLoremPixel
};

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

+ (NSURL *)URL;

+ (NSString *)tweet;

+ (NSURL *)URLForPlaceholderImageWithWidth:(NSUInteger)width
                                    height:(NSUInteger)height;

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                   withWidth:(NSUInteger)width
                                      height:(NSUInteger)height;

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                   withWidth:(NSUInteger)width
                                      height:(NSUInteger)height
                                   grayscale:(BOOL)grayscale;

#if TARGET_OS_IPHONE

+ (UIImage *)placeholderImageWithWidth:(NSUInteger)width
                                height:(NSUInteger)height;

+ (UIImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height;

+ (UIImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                               grayscale:(BOOL)grayscale;

+ (void)asyncPlaceholderImageWithWidth:(NSUInteger)width
                                height:(NSUInteger)height
                            completion:(void (^)(UIImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                              completion:(void (^)(UIImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                               grayscale:(BOOL)grayscale
                              completion:(void (^)(UIImage *image))completion;

#elif TARGET_OS_MAC

+ (NSImage *)placeholderImageWithWidth:(NSUInteger)width
                                height:(NSUInteger)height;

+ (NSImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height;

+ (NSImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                               grayscale:(BOOL)grayscale;

+ (void)asyncPlaceholderImageWithWidth:(NSUInteger)width
                                height:(NSUInteger)height
                            completion:(void (^)(NSImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                              completion:(void (^)(NSImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                               withWidth:(NSUInteger)width
                                  height:(NSUInteger)height
                               grayscale:(BOOL)grayscale
                              completion:(void (^)(NSImage *image))completion;

#endif

@end
