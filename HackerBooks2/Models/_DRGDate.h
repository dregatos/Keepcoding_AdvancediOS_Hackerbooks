// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGDate.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGDateAttributes {
	__unsafe_unretained NSString *creation;
	__unsafe_unretained NSString *modification;
} DRGDateAttributes;

extern const struct DRGDateRelationships {
	__unsafe_unretained NSString *annotation;
} DRGDateRelationships;

@class DRGAnnotation;

@interface DRGDateID : NSManagedObjectID {}
@end

@interface _DRGDate : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGDateID* objectID;

@property (nonatomic, strong) NSDate* creation;

//- (BOOL)validateCreation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modification;

//- (BOOL)validateModification:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGAnnotation *annotation;

//- (BOOL)validateAnnotation:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGDate (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreation;
- (void)setPrimitiveCreation:(NSDate*)value;

- (NSDate*)primitiveModification;
- (void)setPrimitiveModification:(NSDate*)value;

- (DRGAnnotation*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(DRGAnnotation*)value;

@end
