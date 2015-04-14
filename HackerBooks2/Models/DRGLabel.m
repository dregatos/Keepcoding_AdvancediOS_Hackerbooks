#import "DRGLabel.h"

@interface DRGLabel ()

// Private interface goes here.

@end

@implementation DRGLabel

// Custom logic goes here.

+ (instancetype)labelNamed:(NSString *)name withContext:(NSManagedObjectContext *)context {
    
    DRGLabel *label = [DRGLabel insertInManagedObjectContext:context];
    label.name = name;
    
    return label;
}

@end
