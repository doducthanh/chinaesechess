//
//  ChessCell.h
//  ChineseChess
//
//  Created by Admin on 9/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChessCell : NSObject

@property (nonatomic) NSString *nameCell;

@property (strong, nonatomic) UIImageView *imageCell;
@property (strong, nonatomic) UIImageView *imageCellShadow;

@property (nonatomic) int idCell;  //idCell se anh xa sang nameCell
@property (nonatomic) int status;  
@property (nonatomic) int row;
@property (nonatomic) int collum;

@property (nonatomic) float width;
@property (nonatomic) float height;


@end
