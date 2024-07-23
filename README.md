# Rock-Paper-Scissors
Flutter implementation of popular rock-paper-scissors game for web

## Features
- Up to 10 players
- Easy GUI to enable playing

## UI Samples
![Game logo showing three arms in a game and a textbox to enter number of players](./readme-files/home-page.png)
> Homepage

![9 images representing players arranged in two rows with a yellow tag at the top of each saying standby](./readme-files/stand-by.png)
> Standby state before the game "runs"

![9 images representing players arranged in two rows with a blue tag at the top of each saying draw](./readme-files/draw.png)
> A draw happens if all 3 possible hands are available

![9 images representing players in a game, arranged in two rows with a tags at the top saying either lose or win](./readme-files/in-progress.png)
> A win/loss is determined when all players consist of any of two hands

![9 images representing players arranged in two rows with a red tag at the top of eight saying lose and an orange tag on one saying winner](./readme-files/winner.png)
> A single winnner is realized with the orange tag


## Comments
- Not a very well commented codebase as this was my first "real" project
- When a final winner is gotten the run still occurs and switches to a new hand before identifying as a winner; need to work on that bug.
- Would be interesting to implement ability for players on two different devices to play against each other.