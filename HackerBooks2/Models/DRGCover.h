#import "_DRGCover.h"

@import UIKit.UIImage;

@interface DRGCover : _DRGCover {}
// Custom logic goes here.

+ (instancetype)coverForURL:(NSURL *)aURL withContext:(NSManagedObjectContext *)context;

- (void)fetchCoverImageWithCompletion:(void(^)(UIImage *image))completionBlock;

@end
