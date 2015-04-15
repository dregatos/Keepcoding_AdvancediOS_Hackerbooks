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

@end
