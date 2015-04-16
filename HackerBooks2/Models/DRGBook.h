#import "_DRGBook.h"

@import UIKit.UIImage;

@interface DRGBook : _DRGBook {}
// Custom logic goes here.

+ (instancetype)bookFromDictionary:(NSDictionary *)JSON withContext:(NSManagedObjectContext *)context;

- (BOOL)isFavorite;

- (NSArray *)authorList;
- (NSArray *)tagList;

- (void)fetchCoverImageWithCompletion:(void(^)(UIImage *image))completionBlock;

@end
