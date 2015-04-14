#import "DRGWriter.h"

@interface DRGWriter ()

// Private interface goes here.

@end

@implementation DRGWriter

// Custom logic goes here.

+ (instancetype)writerNamed:(NSString *)name withContext:(NSManagedObjectContext *)context {
    
    DRGWriter *writer = [DRGWriter insertInManagedObjectContext:context];
    writer.name = name;
    
    return writer;
}

@end
