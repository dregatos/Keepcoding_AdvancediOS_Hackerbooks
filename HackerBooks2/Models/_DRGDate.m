// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGDate.m instead.

#import "_DRGDate.h"

const struct DRGDateAttributes DRGDateAttributes = {
	.creation = @"creation",
	.modification = @"modification",
};

const struct DRGDateRelationships DRGDateRelationships = {
	.annotation = @"annotation",
};

@implementation DRGDateID
@end

@implementation _DRGDate

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Date";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Date" inManagedObjectContext:moc_];
}

- (DRGDateID*)objectID {
	return (DRGDateID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creation;

@dynamic modification;

@dynamic annotation;

@end

