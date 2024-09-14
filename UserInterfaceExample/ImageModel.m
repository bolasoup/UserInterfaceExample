//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reservekld.
//  bola was here
//  Travis was here

//Cady was here

#import "ImageModel.h"
@interface ImageModel ()

@property (strong, nonatomic) NSArray* imageNames;

@property (strong, nonatomic) NSDictionary* imagesDict;

@end

@implementation ImageModel
@synthesize imageNames = _imageNames;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff"];
    
    return _imageNames; 
}


-(UIImage*)getImageWithName:(NSString*)name{
    
    return self.imagesDict[name];
    
//    UIImage* image = nil;
//
//    image = [UIImage imageNamed:name];
//
//    return image;
}

-(NSDictionary*)imagesDict{
    
    if(!_imagesDict){
        _imagesDict = @{
            @"Bill": [UIImage imageNamed:@"Bill"],
            @"Eric": [UIImage imageNamed:@"Eric"],
            @"Jeff": [UIImage imageNamed:@"Jeff"],
            @"Giraffe": [UIImage imageNamed:@"Giraffe"],
            @"Alligator": [UIImage imageNamed:@"Alligator"],
            @"Elephant": [UIImage imageNamed:@"Elephant"]
        };
    }
    
    return _imagesDict;
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    //nameForImage = _getImageNameForIndex[index];
    return self.imagesDict[self.imageNames[index]];
}

-(NSInteger)numberOfImages{
    return [self.imageNames count];
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}

@end
