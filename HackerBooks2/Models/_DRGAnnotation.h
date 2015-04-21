// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGAnnotation.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGAnnotationAttributes {
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *title;
} DRGAnnotationAttributes;

extern const struct DRGAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *photo;
} DRGAnnotationRelationships;

@class DRGBook;
@class DRGDate;
@class DRGLocation;
@class DRGPhoto;

@interface DRGAnnotationID : NSManagedObjectID {}
@end

@interface _DRGAnnotation : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGAnnotationID* objectID;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGDate *date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

- (DRGDate*)primitiveDate;
- (void)setPrimitiveDate:(DRGDate*)value;

- (DRGLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(DRGLocation*)value;

- (DRGPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(DRGPhoto*)value;

@end
