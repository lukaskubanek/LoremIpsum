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
 *             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
 */

#import <Foundation/Foundation.h>

#if TARGET_OS_OSX
#import <Cocoa/Cocoa.h>
#else
#import <UIKit/UIKit.h>
#endif

typedef NS_ENUM(NSInteger, LIPlaceholderImageService)
{
    LIPlaceholderImageServiceLoremPixel,
    LIPlaceholderImageServiceDummyImage,
    LIPlaceholderImageServicePlaceKitten,
    LIPlaceholderImageServiceDefault = LIPlaceholderImageServiceLoremPixel
};

NS_ASSUME_NONNULL_BEGIN

@interface LoremIpsum : NSObject

///-------------------------------
/// @name Texts
///-------------------------------

/**
 * Generates a random single word.
 */
@property (class, nonatomic, readonly, strong) NSString *word;

/**
 * Generates random words separated by a space character.
 *
 * @param numberOfWords The number of generated words.
 */
+ (NSString *)wordsWithNumber:(NSUInteger)numberOfWords;

/**
 * Generates a random sentence.
 */
@property (class, nonatomic, readonly, strong) NSString *sentence;

/**
 * Generates random concatenated sentences.
 *
 * @param numberOfSentences The number of generated sentences.
 */
+ (NSString *)sentencesWithNumber:(NSUInteger)numberOfSentences;

/**
 * Generates a random paragraph with multiple sentences.
 */
@property (class, nonatomic, readonly, strong) NSString *paragraph;

/**
 * Generates random paragraphs joined by a new line character.
 *
 * @param numberOfParagraphs The number of generated paragraphs.
 */
+ (NSString *)paragraphsWithNumber:(NSUInteger)numberOfParagraphs;

/**
 * Generates a random title.
 */
@property (class, nonatomic, readonly, strong) NSString *title;

///-------------------------------
/// @name Misc Data
///-------------------------------

/**
 * Generates a random name consisting of a first and a last name.
 */
@property (class, nonatomic, readonly, strong) NSString *name;

/**
 * Generates a random first name.
 */
@property (class, nonatomic, readonly, strong) NSString *firstName;

/**
 * Generates a random last name.
 */
@property (class, nonatomic, readonly, strong) NSString *lastName;

/**
 * Generates a random email address.
 */
@property (class, nonatomic, readonly, strong) NSString *email;

/**
 * Generates a random URL address with the HTTP prefix.
 */
@property (class, nonatomic, readonly, strong) NSURL *URL;

/**
 * Generates a sample tweet with 140 characters.
 */
@property (class, nonatomic, readonly, strong) NSString *tweet;

/**
 * Generates a random date and time within the last 4 years.
 */
@property (class, nonatomic, readonly, strong) NSDate *date;

///-------------------------------
/// @name Images
///-------------------------------

#if TARGET_OS_IPHONE

/**
 * Returns an URL for a placeholder image with the given size.
 *
 * @param size The desired size of the image.
 */
+ (NSURL *)URLForPlaceholderImageWithSize:(CGSize)size;

/**
 * Returns an URL for a placeholder image from the given image service and with the given size.
 *
 * @param service The image service.
 * @param size The desired size of the image.
 */
+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(CGSize)size;

/**
 * Returns a placeholder image with the given size.
 *
 * @param size The desired size of the image.
 */
+ (nullable UIImage *)placeholderImageWithSize:(CGSize)size;

/**
 * Returns a placeholder image from the given image service and with the given size.
 *
 * @param service The image service.
 * @param size The desired size of the image.
 */
+ (nullable UIImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                         withSize:(CGSize)size;

/**
 * Asynchronously loads a placeholder image with the given size and executes the completion block.
 *
 * @param size The desired size of the image.
 * @param completion The completion block which is executed asynchronously after loading the image.
 */
+ (void)asyncPlaceholderImageWithSize:(CGSize)size
                           completion:(void (^)(UIImage * _Nullable image))completion;

/**
 * Asynchronously loads a placeholder image from the given image service with the given size
 * and executes the completion block.
 *
 * @param service The image service.
 * @param size The desired size of the image.
 * @param completion The completion block which is executed asynchronously after loading the image.
 */
+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(CGSize)size
                              completion:(void (^)(UIImage * _Nullable image))completion;

#elif TARGET_OS_MAC

/**
 * Returns an URL for a placeholder image with the given size.
 *
 * @param size The desired size of the image.
 */
+ (NSURL *)URLForPlaceholderImageWithSize:(NSSize)size;

/**
 * Returns an URL for a placeholder image from the given image service and with the given size.
 *
 * @param service The image service.
 * @param size The desired size of the image.
 */
+ (NSURL *)URLForPlaceholderImageFromService:(LIPlaceholderImageService)service
                                    withSize:(NSSize)size;

/**
 * Returns a placeholder image with the given size.
 *
 * @param size The desired size of the image.
 */
+ (nullable NSImage *)placeholderImageWithSize:(NSSize)size;

/**
 * Returns a placeholder image from the given image service and with the given size.
 *
 * @param service The image service.
 * @param size The desired size of the image.
 */
+ (nullable NSImage *)placeholderImageFromService:(LIPlaceholderImageService)service
                                         withSize:(NSSize)size;

/**
 * Asynchronously loads a placeholder image with the given size and executes the completion block.
 *
 * @param size The desired size of the image.
 * @param completion The completion block which is executed asynchronously after loading the image.
 */
+ (void)asyncPlaceholderImageWithSize:(NSSize)size
                           completion:(void (^)(NSImage * _Nullable image))completion;

/**
 * Asynchronously loads a placeholder image from the given image service with the given size
 * and executes the completion block.
 *
 * @param service The image service.
 * @param size The desired size of the image.
 * @param completion The completion block which is executed asynchronously after loading the image.
 */
+ (void)asyncPlaceholderImageFromService:(LIPlaceholderImageService)service
                                withSize:(NSSize)size
                              completion:(void (^)(NSImage * _Nullable image))completion;

#endif

@end

NS_ASSUME_NONNULL_END
