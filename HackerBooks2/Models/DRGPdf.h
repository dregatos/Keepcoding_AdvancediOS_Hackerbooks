#import "_DRGPdf.h"

@interface DRGPdf : _DRGPdf {}
// Custom logic goes here.

+ (instancetype)pdfForURL:(NSURL *)aURL withContext:(NSManagedObjectContext *)context;

@end
