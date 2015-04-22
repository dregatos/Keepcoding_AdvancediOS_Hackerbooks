// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGBook.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGBookAttributes {
	__unsafe_unretained NSString *title;
} DRGBookAttributes;

extern const struct DRGBookRelationships {
	__unsafe_unretained NSString *annotations;
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *cover;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *tags;
} DRGBookRelationships;

@class DRGAnnotation;
@class DRGAuthor;
@class DRGCover;
@class DRGPdf;
@class DRGTag;

@interface DRGBookID : NSManagedObjectID {}
@end

@interface _DRGBook : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGBookID* objectID;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;

@property (nonatomic, strong) DRGCover *cover;

//- (BOOL)validateCover:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGPdf *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _DRGBook (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(DRGAnnotation*)value_;
- (void)removeAnnotationsObject:(DRGAnnotation*)value_;

@end

@interface _DRGBook (AuthorsCoreDataGeneratedAccessors)
- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(DRGAuthor*)value_;
- (void)removeAuthorsObject:(DRGAuthor*)value_;

@end

@interface _DRGBook (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(DRGTag*)value_;
- (void)removeTagsObject:(DRGTag*)value_;

@end

@interface _DRGBook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;

- (DRGCover*)primitiveCover;
- (void)setPrimitiveCover:(DRGCover*)value;

- (DRGPdf*)primitivePdf;
- (void)setPrimitivePdf:(DRGPdf*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
