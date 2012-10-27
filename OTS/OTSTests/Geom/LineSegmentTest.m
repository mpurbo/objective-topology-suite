//
//  LineSegmentTest.m
//  OTS
//
//  Created by Purbo Mohamad on 3/16/10.
//  Copyright 2010 objgeo.org. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "OTSCoordinate.h"
#import "OTSLineSegment.h"
#import "OTSCoordinateSequence.h"

@interface LineSegmentTest : SenTestCase {	
}
@end

@implementation LineSegmentTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testClosestPoints {
	
	OTSCoordinate *c00 = [OTSCoordinate coordinateWithX:1.1 Y:2.2];
	OTSCoordinate *c01 = [OTSCoordinate coordinateWithX:3.3 Y:4.4];
	
	OTSCoordinate *c10 = [OTSCoordinate coordinateWithX:11.1 Y:12.2];
	OTSCoordinate *c11 = [OTSCoordinate coordinateWithX:13.3 Y:14.4];
	
	OTSLineSegment *seg0 = [[OTSLineSegment alloc] initWithCoordinate:c00 toCoordinate:c01];
	OTSLineSegment *seg1 = [[OTSLineSegment alloc] initWithCoordinate:c10 toCoordinate:c11];
	OTSCoordinateSequence *closestPt = [seg0 closestPoints:seg1];
	[seg0 release];
	[seg1 release];
	
    STAssertEquals([closestPt size], 2, @"Expecting 2 points");
    
    OTSCoordinate *c1 = [closestPt getAt:0];
    OTSCoordinate *c2 = [closestPt getAt:1];
    
    STAssertTrue([c1 isEqual2D:c01], @"Invalid point");
    STAssertTrue([c2 isEqual2D:c10], @"Invalid point");
}

@end
