// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGPhoto.m instead.

#import "_DRGPhoto.h"

const struct DRGPhotoAttributes DRGPhotoAttributes = {
	.photoData = @"photoData",
};

const struct DRGPhotoRelationships DRGPhotoRelationships = {
	.annotation = @"annotation",
};

@implementation DRGPhotoID
@end

@implementation _DRGPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (DRGPhotoID*)objectID {
	return (DRGPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic annotation;

- (NSMutableSet*)annotationSet {
	[self willAccessValueForKey:@"annotation"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotation"];

	[self didAccessValueForKey:@"annotation"];
	return result;
}

@end

