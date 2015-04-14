#import "_DRGWriter.h"

@interface DRGWriter : _DRGWriter {}
// Custom logic goes here.

+ (instancetype)writerNamed:(NSString *)name withContext:(NSManagedObjectContext *)context;

@end
