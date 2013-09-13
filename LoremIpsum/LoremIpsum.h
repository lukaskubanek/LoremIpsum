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
 *                2013 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#endif

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
+ (NSURL *)URL;
+ (NSString *)tweet;

@end

@interface LoremIpsum (Images)

+ (NSURL *)URLForPlaceholderImageWithWidth:(NSUInteger)width height:(NSUInteger)height;
+ (NSURL *)URLForPlaceholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height;
+ (NSURL *)URLForPlaceholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height grayscale:(BOOL)grayscale;

#if TARGET_OS_IPHONE

+ (UIImage *)placeholderImageWithWidth:(NSUInteger)width height:(NSUInteger)height;
+ (UIImage *)placeholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height;
+ (UIImage *)placeholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height grayscale:(BOOL)grayscale;

+ (void)asyncPlaceholderImageWithWidth:(NSUInteger)width height:(NSUInteger)height completed:(void (^)(UIImage *))complete;
+ (void)asyncPlaceholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height completed:(void (^)(UIImage *))complete;
+ (void)asyncPlaceholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height grayscale:(BOOL)grayscale completed:(void (^)(UIImage *))complete;

#elif TARGET_OS_MAC

+ (NSImage *)placeholderImageWithWidth:(NSUInteger)width height:(NSUInteger)height;
+ (NSImage *)placeholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height;
+ (NSImage *)placeholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height grayscale:(BOOL)grayscale;

+ (void)asyncPlaceholderImageWithWidth:(NSUInteger)width height:(NSUInteger)height completed:(void (^)(NSImage *))complete;
+ (void)asyncPlaceholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height completed:(void (^)(NSImage *))complete;
+ (void)asyncPlaceholderImageFromService:(LoremIpsumPlaceholderImageService)service withWidth:(NSUInteger)width height:(NSUInteger)height grayscale:(BOOL)grayscale completed:(void (^)(NSImage *))complete;

#endif

@end
