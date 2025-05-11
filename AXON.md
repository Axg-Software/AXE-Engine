# Axon (Custom scriping language for AXE Engine)
Axon is a custom programming / scripting language made specifcly for AXE Engine.

Written by [Axuko](https://github.com/Ethan-makes-music)

## Uses for Axon
Currently, there are 2 things you can use Axon for in the engine:

- Making a custom Player without having to edit source code.
- Making a enemy without having to use source code.

## How to use Axon
This will teach you how to make a custom player and enemy using Axon.
### How to make a custom player
- To make a custom player, you have to make a file called: `playerData.axh` in the data folder in assets.
- To establish a player, you need to put `XP` in your script to tell it that its a player script your making.
- Next you need to establish your width and height.
- For example, you need to put: `X8`, `X16`, `X32`, `X64`, or `X128` to make it either 8x8 16x16 etc.
- So, at the end of all of this your script should look something like this: `XP X64`. And then once you reload the game you should see your new player!
### How to make a custom enemy
- To make a custom enemy, you have to make a file called: `enemyData.axh` in the data folder in assets.
- To establish a enemy, you need to put `XE` in your script to tell it that its a enemy script your making.
- Next you need to establish your width and height.
- For example, you need to put: `X8`, `X16`, `X32`, `X64`, or `X128` to make it either 8x8 16x16 etc.
- So, at the end of all of this your script should look something like this: `XE X64`. And then once you reload the game you should see your new enemy!