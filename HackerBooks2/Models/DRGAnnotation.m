#import "DRGAnnotation.h"
#import "DRGBook.h"
#import "DRGPhoto.h"
#import "DRGDate.h"
#import "DRGLocation.h"
#import "NSString+Validation.h"

@interface DRGAnnotation ()

// Private interface goes here.

@end

@implementation DRGAnnotation

+ (instancetype)annotationOnBook:(DRGBook *)aBook
                          titled:(NSString *)title
                        withText:(NSString *)text
                           photo:(UIImage *)image
                        latitude:(double)latitude
                       longitude:(double)longitude
                     withContext:(NSManagedObjectContext *)context {
    
    // Has needed info
    if ([NSString isEmpty:title] || !aBook || ([NSString isEmpty:text] && !image)) {
        // We need a title and a book
        // and a text OR an image to create an annotation
        return nil;
    }
    
    DRGAnnotation *ann = [DRGAnnotation insertInManagedObjectContext:context];
    // title
    ann.title = title;
    // book
    ann.book = aBook;
    // text
    if (![NSString isEmpty:text]) { ann.text = text; }
    // image
    ann.photo = [DRGPhoto insertInManagedObjectContext:context];
    if (image) { ann.photo.image = image; }
    // date
    ann.date = [DRGDate dateWithContext:context];
    // location
    // TODO *****
    
    return ann;
}

#pragma mark - KVO

+ (NSArray *)observableKeys {
    return @[DRGAnnotationRelationships.photo, DRGAnnotationAttributes.text, DRGAnnotationAttributes.title];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    // Update modification date
    self.date.modification = [NSDate date];
}

@end
