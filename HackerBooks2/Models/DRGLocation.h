#import "_DRGLocation.h"

@interface DRGLocation : _DRGLocation {}
// Custom logic goes here.

+ (instancetype)locationWithLatitude:(double)latitude
                        andLongitude:(double)longitude
                         withContext:(NSManagedObjectContext *)context;
@end
