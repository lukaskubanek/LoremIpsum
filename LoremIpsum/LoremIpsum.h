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

typedef NS_ENUM(NSInteger, LIPlaceholderImageService)
{
    LIPlaceholderImageServiceLoremPixel,
    LIPlaceholderImageServiceDummyImage,
    LIPlaceholderImageServicePlaceKitten,
    LIPlaceholderImageServiceDefault = LIPlaceholderImageServiceLoremPixel
};

@interface LoremIpsum : NSObject

///-------------------------------
/// @name Texts
///-------------------------------

+ (NSString *)word;

+ (NSString *)wordsWithNumber:(NSInteger)numberOfWords;

+ (NSString *)sentence;

+ (NSString *)sentencesWithNumber:(NSInteger)numberOfSentences;

+ (NSString *)paragraph;

+ (NSString *)paragraphsWithNumber:(NSInteger)numberOfParagraphs;

+ (NSString *)title;

///-------------------------------
/// @name Misc Data
///-------------------------------

+ (NSDate *)date;

+ (NSString *)name;

+ (NSString *)firstName;

+ (NSString *)lastName;

+ (NSString *)email;

+ (NSURL *)URL;

+ (NSString *)tweet;

///-------------------------------
/// @name Images
///-------------------------------

#if TARGET_OS_IPHONE

+ (NSURL *)URLForPlaceholderImageWithSize:(CGSize)size;

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(CGSize)size;

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(CGSize)size
                                   grayscale:(BOOL)grayscale;

+ (UIImage *)placeholderImageWithSize:(CGSize)size;

+ (UIImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(CGSize)size;

+ (UIImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(CGSize)size
                               grayscale:(BOOL)grayscale;

+ (void)asyncPlaceholderImageWithSize:(CGSize)size
                           completion:(void (^)(UIImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(CGSize)size
                              completion:(void (^)(UIImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(CGSize)size
                               grayscale:(BOOL)grayscale
                              completion:(void (^)(UIImage *image))completion;

#elif TARGET_OS_MAC

+ (NSURL *)URLForPlaceholderImageWithSize:(NSSize)size;

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(NSSize)size;

+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(NSSize)size
                                   grayscale:(BOOL)grayscale;

+ (NSImage *)placeholderImageWithSize:(NSSize)size;

+ (NSImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(NSSize)size;

+ (NSImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(NSSize)size
                               grayscale:(BOOL)grayscale;

+ (void)asyncPlaceholderImageWithSize:(NSSize)size
                           completion:(void (^)(NSImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(NSSize)size
                              completion:(void (^)(NSImage *image))completion;

+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(NSSize)size
                               grayscale:(BOOL)grayscale
                              completion:(void (^)(NSImage *image))completion;

#endif

@end
