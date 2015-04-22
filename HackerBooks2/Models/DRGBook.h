#import "_DRGBook.h"

@interface DRGBook : _DRGBook {}
// Custom logic goes here.

+ (instancetype)bookFromDictionary:(NSDictionary *)JSON
                       withContext:(NSManagedObjectContext *)context;

- (BOOL)isFavoriteBook;
- (BOOL)isPDFAvailable;

- (NSArray *)authorList;
- (NSArray *)tagList;
- (NSArray *)tagListExceptFavorite;


@end
