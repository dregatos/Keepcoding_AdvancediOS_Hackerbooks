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

- (void)fetchCoverImageWithCompletion:(void(^)(UIImage *image))completionBlock {
    
    if (!self.data) {
        //download the image in background
        dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(download, ^{
            NSURL *url = [NSURL URLWithString:self.urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            
            // Save Image
            self.data = imageData;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //execute the completion block
                UIImage *image = [UIImage imageWithData:imageData];
                completionBlock(image);
            });
        });
        return;
    }
    
    UIImage *im = [UIImage imageWithData:self.data];
    completionBlock(im);
}


@end
