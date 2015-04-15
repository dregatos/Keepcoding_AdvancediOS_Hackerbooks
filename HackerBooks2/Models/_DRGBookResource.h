// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGBookResource.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGBookResourceAttributes {
	__unsafe_unretained NSString *data;
	__unsafe_unretained NSString *urlString;
} DRGBookResourceAttributes;

@interface DRGBookResourceID : NSManagedObjectID {}
@end

@interface _DRGBookResource : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGBookResourceID* objectID;

@property (nonatomic, strong) NSData* data;

//- (BOOL)validateData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* urlString;

//- (BOOL)validateUrlString:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGBookResource (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveData;
- (void)setPrimitiveData:(NSData*)value;

- (NSString*)primitiveUrlString;
- (void)setPrimitiveUrlString:(NSString*)value;

@end
