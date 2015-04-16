#import "_DRGBook.h"

@interface DRGBook : _DRGBook {}
// Custom logic goes here.

+ (instancetype)bookFromDictionary:(NSDictionary *)JSON withContext:(NSManagedObjectContext *)context;

- (BOOL)isFavorite;

- (NSArray *)authorList;
- (NSArray *)tagList;


@end
