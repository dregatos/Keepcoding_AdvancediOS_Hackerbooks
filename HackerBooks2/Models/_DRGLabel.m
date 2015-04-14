// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGLabel.m instead.

#import "_DRGLabel.h"

const struct DRGLabelAttributes DRGLabelAttributes = {
	.name = @"name",
};

const struct DRGLabelRelationships DRGLabelRelationships = {
	.tags = @"tags",
};

@implementation DRGLabelID
@end

@implementation _DRGLabel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Label";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Label" inManagedObjectContext:moc_];
}

- (DRGLabelID*)objectID {
	return (DRGLabelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic tags;

- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];

	[self didAccessValueForKey:@"tags"];
	return result;
}

@end

