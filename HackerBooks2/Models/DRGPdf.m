#import "DRGPdf.h"

@interface DRGPdf ()

// Private interface goes here.

@end

@implementation DRGPdf

// Custom logic goes here.

+ (instancetype)pdfForURL:(NSURL *)aURL withContext:(NSManagedObjectContext *)context {
    
    DRGPdf *pdf = [DRGPdf insertInManagedObjectContext:context];
    pdf.urlString = [aURL absoluteString];
    pdf.data = nil;
    
    return pdf;
}

- (void)fetchPDFDataWithCompletion:(void(^)(NSData *pdfData))completionBlock {
    
    if (!self.data) {
        //download the image in background
        dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(download, ^{
            NSURL *url = [NSURL URLWithString:self.urlString];
            NSData *pdfData = [NSData dataWithContentsOfURL:url];
            
            // Save Image
            self.data = pdfData;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //execute the completion block
                completionBlock(pdfData);
            });            
        });
        return;
    }
    
    completionBlock(self.data);
}


@end
