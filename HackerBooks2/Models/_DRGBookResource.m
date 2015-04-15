// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGBookResource.m instead.

#import "_DRGBookResource.h"

const struct DRGBookResourceAttributes DRGBookResourceAttributes = {
	.data = @"data",
	.urlString = @"urlString",
};

@implementation DRGBookResourceID
@end

@implementation _DRGBookResource

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookResource" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookResource";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookResource" inManagedObjectContext:moc_];
}

- (DRGBookResourceID*)objectID {
	return (DRGBookResourceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic data;

@dynamic urlString;

@end

