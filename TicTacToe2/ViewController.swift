//
//  ViewController.swift
//  TicTacToe2
//
//  Created by Kevin Tian on 1/24/19.
//  Copyright © 2019 Kevin Tian. All rights reserved.
//
//Tributes to Youtuber "The Swift Guy" for some instructions on this code.
import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 //The initial step that any player takes is going to be "x".
    var gameState = [0,0,0,0,0,0,0,0,0]
    //Each 0 represents a grid on the board.
    @IBOutlet weak var label: UILabel!
    let winningCombinations = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]//All the possible combinations for winning the game.
    var gameIsActive = true //The game is initially active.
    @IBAction func action(_ sender: Any) {
        if (gameState[(sender as AnyObject).tag - 1] == 0 && gameIsActive == true)
        //Only when the grid is available, the user can change the state of the grid by clicking on it.
        {
            gameState[(sender as AnyObject).tag - 1] = activePlayer //When the grid is available, allow user to operate action.
            if activePlayer == 1{
                (sender as AnyObject).setImage(UIImage(named: "x.png"), for: UIControl.State())
                activePlayer = 2
            }else{
                (sender as AnyObject).setImage(UIImage(named: "o.png"), for: UIControl.State())
                activePlayer = 1
            }//After each action, switch to the opposite image.
            for combination in winningCombinations{
                if gameState[combination[0]] != 0 &&  gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    gameIsActive = false //When detecting that someone wins, stop the game.
                    if gameState[combination[0]] == 1{
                        label.text = "CROSS HAS WON!"
                        //Cross has won.
                    }else{
                        label.text = "NOUGHT HAS WON!"
                    }//Nought has won.
                    playAgainButton.isHidden = false
                    label.isHidden = false
                    //When the game is over, show the reset button and the label.
                }
            }
        }
        gameIsActive = false
        for i in gameState{
            if i == 0 {
                gameIsActive = true
                break
            }
        }//When there is a draw, stop the game and reset.
        if gameIsActive == false
        {
            label.text = "DRAW!"
            label.isHidden = false
            playAgainButton.isHidden = false
        }//Display the Draw state on the label.
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        label.isHidden = true
        //Hide the button and the label initially.
        for i in 1...9 {
            let button = view.viewWithTag(i) as!UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

