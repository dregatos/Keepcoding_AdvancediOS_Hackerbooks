#import "_DRGLabel.h"

@interface DRGLabel : _DRGLabel {}

// NOTE: FAVORITE_LABEL starts with whitespace to force section order on table
#define FAVORITE_LABEL          @" Favorites"

+ (instancetype)labelNamed:(NSString *)name withContext:(NSManagedObjectContext *)context;

@end
