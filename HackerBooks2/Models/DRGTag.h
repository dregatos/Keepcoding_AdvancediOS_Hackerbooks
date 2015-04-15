#import "_DRGTag.h"

@interface DRGTag : _DRGTag {}
// Custom logic goes here.

+ (instancetype)tagNamed:(NSString *)name
                  ofBook:(DRGBook *)book
             withContext:(NSManagedObjectContext *)context;

+ (DRGTag *)favoriteTagForBook:(DRGBook *)aBook;

@end
