#import "_DRGTag.h"

@interface DRGTag : _DRGTag {}
// Custom logic goes here.

#define IS_FAVORITE @""

+ (instancetype)tagNamed:(NSString *)name
                  ofBook:(DRGBook *)book
             withContext:(NSManagedObjectContext *)context;

+ (DRGTag *)favoriteTagForBook:(DRGBook *)aBook;

@end
