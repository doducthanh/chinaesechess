//
//  ViewController.m
//  ChineseChess
//
//  Created by Admin on 9/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>{
    ChessCell *arrayChessCell[10][9];
    float heightCell;
    float widthCell;
}

@end

@implementation ViewController

#pragma mark cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init variable
    heightCell = 0;
    widthCell = 0;
    [self animation];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    heightCell = self.imgBoard.frame.size.height/10;
    widthCell = self.imgBoard.frame.size.width/9;
    // call function instance
    [self setupBoardChess];
    [self drawBoardChess];
}

- (void) animation{
    self.imgBoard.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:1 animations:^{
        self.imgBoard.transform = CGAffineTransformMakeRotation(180);
        
        
    } completion:^(BOOL finished) {
        self.imgBoard.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.imgBoard.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    }];
}
#pragma mark config board chess
- (void) setupBoardChess{
    for (int i = 0; i < 10; i++) {
        for ( int j = 0; j < 9; j++) {
            ChessCell *cellChess = [[ChessCell alloc] init];
            cellChess.imageCell = [[UIImageView alloc] initWithFrame:CGRectMake(j * widthCell,  (9 - i) * heightCell, widthCell, heightCell)];
            [self.imgBoard addSubview:cellChess.imageCell];
            arrayChessCell[i][j] = cellChess;
        }
    }
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRespone:)];
    tapgesture.delegate = self;
    self.imgBoard.userInteractionEnabled = true;
    tapgesture.numberOfTapsRequired = 1;
    [self.imgBoard addGestureRecognizer:tapgesture];
}

- (void) drawBoardChess{
    for (int i = 0; i<10; i++) {
        for (int j = 0; j<9; j++) {
            if ((i+j)%2 == 0) {
                arrayChessCell[i][j].imageCell.image = [UIImage imageNamed:@"btn_loadgame"];
            }
            [self.imgBoard addSubview:arrayChessCell[i][j].imageCell ];
        }
    }
    //arrayChessCell[2][0].imageCell.image = [UIImage imageNamed:@"btn_loadgame"];
}

- (void)tapRespone :(UITapGestureRecognizer *)sender{
    CGPoint location = [sender locationInView:sender.view];
    int row = 10-location.y/heightCell;
    int collum = location.x/heightCell;
    arrayChessCell[row][collum].imageCell.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
