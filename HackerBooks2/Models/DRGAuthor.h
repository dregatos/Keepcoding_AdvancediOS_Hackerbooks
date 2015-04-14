#import "_DRGAuthor.h"

@interface DRGAuthor : _DRGAuthor {}
// Custom logic goes here.

+ (instancetype)authorNamed:(NSString *)name
                     ofBook:(DRGBook *)book
                withContext:(NSManagedObjectContext *)context;

@end
