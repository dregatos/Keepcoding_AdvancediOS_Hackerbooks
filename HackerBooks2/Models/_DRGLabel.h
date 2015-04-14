// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGLabel.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGLabelAttributes {
	__unsafe_unretained NSString *name;
} DRGLabelAttributes;

extern const struct DRGLabelRelationships {
	__unsafe_unretained NSString *tags;
} DRGLabelRelationships;

@class DRGTag;

@interface DRGLabelID : NSManagedObjectID {}
@end

@interface _DRGLabel : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGLabelID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _DRGLabel (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(DRGTag*)value_;
- (void)removeTagsObject:(DRGTag*)value_;

@end

@interface _DRGLabel (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
