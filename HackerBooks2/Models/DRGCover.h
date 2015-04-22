#import "_DRGCover.h"

@import UIKit.UIImage;

@interface DRGCover : _DRGCover {}
// Custom logic goes here.

+ (instancetype)coverForURL:(NSURL *)aURL withContext:(NSManagedObjectContext *)context;

/** If cover data is not stored on the DB, then we need to download and save it. */
- (void)fetchCoverImageWithCompletion:(void(^)(UIImage *image))completionBlock;

@end
