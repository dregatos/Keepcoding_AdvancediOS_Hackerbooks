#import "DRGDate.h"

@interface DRGDate ()

// Private interface goes here.

@end

@implementation DRGDate

+ (instancetype)dateWithContext:(NSManagedObjectContext *)context {
    
    DRGDate *nDate = [DRGDate insertInManagedObjectContext:context];
    
    nDate.creation = [NSDate date];
    nDate.modification = nDate.creation;
    
    return nDate;
}

@end
