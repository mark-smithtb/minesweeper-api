# Minesweeper

This is a description of the "Minesweeper Clone" API.

# Group Game API

## POST /game

Create a new game

+ Parameters
  + difficulty: `1` (number) - Permitted values are: `0` (Easy - 8x8, 10 mines), `1` (Intermediate - 16x16, 40 mines), and `2` (Expert - 24x24, 99 mines)

+ Response 201 (application/json)

        {
          "id": 1,
          "board": [
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "]
          ],
          "state": "new",
          "score": 500,
          "mines": 10
        }

## GET /game/{id}

Retrieve an already created game.

The `state` will be one of "new", "playing", "won", or "lost".

Cell values:

- ` ` (empty space) An unrevealed cell
- `_` An empty revealed cell
- `F` An unrevealed flagged cell
- `*` A cell with a bomb in it
- `1`-`8` The number of neighboring cells that contain a mine.

+ Parameters
  + id: `1` (number) - The unique ID for the game

+ Response 200 (application/json)

        {
          "id": 1,
          "board": [
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  "1", "2", "1", "F",  " ", " "],
            [" ", "1",  "_", "_", "_", "2",  " ", " "],
            [" ", "1",  "_", "_", "_", "1",  " ", " "],
            [" ", " ",  "1", "_", "_", "2",  " ", " "],
            [" ", " ",  " ", "1", "1", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "]
          ],
          "state": "new",
          "score": 500,
          "mines": 9
        }

## POST /game/{id}/check

+ Parameters
  + id: `1` (number) - The unique ID for the game
  + row: `5` (number) - The horizontal row the player is checking.
  + col: `7` (number) - The vertical column the player is checking.

+ Request (application/json)

        {
          "row": 5,
          "col": 7
        }

+ Response 200 (application/json)

        {
          "id": 1,
          "board": [
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  "1", "2", "1", "F",  " ", " "],
            [" ", "1",  "_", "_", "_", "2",  " ", " "],
            [" ", "1",  "_", "_", "_", "1",  " ", " "],
            [" ", " ",  "1", "_", "_", "2",  " ", " "],
            [" ", " ",  " ", "1", "1", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "]
          ],
          "state": "playing",
          "score": 500,
          "mines": 9
        }

## POST /game/{id}/flag

+ Parameters
  + id: `1` (number) - The unique ID for the game
  + row: `5` (number) - The horizontal row the player is flagging.
  + col: `7` (number) - The vertical column the player is flagging.

+ Request (application/json)

        {
          "row": 5,
          "col": 7
        }

+ Response 200 (application/json)

        {
          "id": 1,
          "board": [
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  "1", "2", "1", "F",  " ", " "],
            [" ", "1",  "_", "_", "_", "2",  " ", " "],
            [" ", "1",  "_", "_", "_", "1",  " ", " "],
            [" ", " ",  "1", "_", "_", "2",  " ", " "],
            [" ", " ",  " ", "1", "1", "F",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "],
            [" ", " ",  " ", " ", " ", " ",  " ", " "]
          ],
          "state": "playing",
          "score": 500,
          "mines": 8
        }