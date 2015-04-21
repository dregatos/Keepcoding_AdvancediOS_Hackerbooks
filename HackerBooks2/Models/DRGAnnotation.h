#import "_DRGAnnotation.h"

@import  UIKit;

@class DRGBook;

@interface DRGAnnotation : _DRGAnnotation {}

+ (instancetype)annotationOnBook:(DRGBook *)aBook
                          titled:(NSString *)title
                        withText:(NSString *)text
                           photo:(UIImage *)image
                        latitude:(double)latitude
                       longitude:(double)longitude
                     withContext:(NSManagedObjectContext *)context;

@end
