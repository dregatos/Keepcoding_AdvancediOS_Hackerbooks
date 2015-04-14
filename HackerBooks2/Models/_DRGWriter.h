// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGWriter.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGWriterAttributes {
	__unsafe_unretained NSString *name;
} DRGWriterAttributes;

extern const struct DRGWriterRelationships {
	__unsafe_unretained NSString *authors;
} DRGWriterRelationships;

@class DRGAuthor;

@interface DRGWriterID : NSManagedObjectID {}
@end

@interface _DRGWriter : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGWriterID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;

@end

@interface _DRGWriter (AuthorsCoreDataGeneratedAccessors)
- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(DRGAuthor*)value_;
- (void)removeAuthorsObject:(DRGAuthor*)value_;

@end

@interface _DRGWriter (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;

@end
