#import "DRGCover.h"

@interface DRGCover ()

// Private interface goes here.

@end

@implementation DRGCover

// Custom logic goes here.

+ (instancetype)coverForURL:(NSURL *)aURL withContext:(NSManagedObjectContext *)context {

    DRGCover *cover = [DRGCover insertInManagedObjectContext:context];
    cover.urlString = [aURL absoluteString];
    cover.data = nil;
    
    return cover;
}




@end
