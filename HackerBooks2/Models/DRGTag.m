#import "DRGTag.h"
#import "DRGLabel.h"
#import "DRGBook.h"

@interface DRGTag ()

// Private interface goes here.

@end

@implementation DRGTag

// Custom logic goes here.
+ (instancetype)tagNamed:(NSString *)name
                  ofBook:(DRGBook *)book
             withContext:(NSManagedObjectContext *)context {
    
    DRGTag *tag = [DRGTag insertInManagedObjectContext:context];
    tag.label = [DRGLabel labelNamed:name withContext:context];
    tag.book = book;
    
    return tag;
}

+ (DRGTag *)favoriteTagForBook:(DRGBook *)aBook {
    for (DRGTag *tag in aBook.tags) {
        DRGLabel *label = tag.label;
        if ([label.name isEqualToString:FAVORITE_LABEL]) {
            // If YES, untagged it
            return tag;
        }
    }
    
    return nil;
}




@end
