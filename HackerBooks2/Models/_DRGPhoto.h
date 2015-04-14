// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGPhoto.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGPhotoAttributes {
	__unsafe_unretained NSString *photoData;
} DRGPhotoAttributes;

extern const struct DRGPhotoRelationships {
	__unsafe_unretained NSString *annotation;
} DRGPhotoRelationships;

@class DRGAnnotation;

@interface DRGPhotoID : NSManagedObjectID {}
@end

@interface _DRGPhoto : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotation;

- (NSMutableSet*)annotationSet;

@end

@interface _DRGPhoto (AnnotationCoreDataGeneratedAccessors)
- (void)addAnnotation:(NSSet*)value_;
- (void)removeAnnotation:(NSSet*)value_;
- (void)addAnnotationObject:(DRGAnnotation*)value_;
- (void)removeAnnotationObject:(DRGAnnotation*)value_;

@end

@interface _DRGPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(NSMutableSet*)value;

@end
