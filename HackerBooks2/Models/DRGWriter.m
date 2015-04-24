#import "DRGWriter.h"

@interface DRGWriter ()

// Private interface goes here.

@end

@implementation DRGWriter

// Custom logic goes here.

+ (instancetype)writerNamed:(NSString *)name withContext:(NSManagedObjectContext *)context {
    
    // Check if writer exists
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[[self class] entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"name MATCHES[cd] %@",name];

    NSArray *results = [context executeFetchRequest:req error:nil];
    
    DRGWriter *writer;
    if ([results count] == 0) {
        writer = [DRGWriter insertInManagedObjectContext:context];
        writer.name = name;
    } else if ([results count] == 1) {
        writer = [results lastObject];
    } else if ([results count] > 1) {
        NSLog(@"Duplicated!! Writer \'%@\' was found %lu times on our DB", name, (unsigned long)[results count]);
    }
    
    return writer;
}

@end
