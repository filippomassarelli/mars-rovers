# mars-rovers

> A simple programme to track and move cute robots on Mars.

<img heigh="75px" src="https://user-images.githubusercontent.com/60197762/188880679-b2eb72ee-bf94-46df-81ee-504820ed3297.gif" />


## Usage

This programme can be ran entirely from your terminal 🤓 🎉 yey!

To start, `clone` this repository and `cd` to the root of the project.

Use the `-h` or `--h` flags to check for instructions:
```
ruby mars_rovers.rb --help
```
<img width="436" alt="Screenshot 2022-09-07 at 13 17 53" src="https://user-images.githubusercontent.com/60197762/188877063-10856614-31f6-4a6c-bf4a-222e05e0f001.png">

As described in the instructions, the expected arguments are:
- the size of the map we are tracking the rovers on passed as x-axis and y-axis lengths
- any number of rover instructions, which are composed of
  - the current rover position (x, y, orientation) where orientation is one of N | E | S | W
  - the sequence of commands we want the rover to perform, eg: F (forward), R (turn right), L (turn left)

The resulting position of each rover will be printed to the terminal, together with an indication of whether the rover got 'lost' beyond the boundaries of the map we defined.

Try:
```
ruby mars_rovers.rb "4 8" "(2, 3, E) LFRFF" "(0, 2, N) FFLFRFF"
```
<img width="569" alt="Screenshot 2022-09-07 at 13 18 18" src="https://user-images.githubusercontent.com/60197762/188877016-6ce9ffc2-8461-4215-92af-6abcdcca4e4c.png">


## Validations

The programme provides only basic validations to ensure that an error is raised if:

- No rover instructions are passed
<img width="603" alt="Screenshot 2022-09-07 at 13 21 00" src="https://user-images.githubusercontent.com/60197762/188876969-f107bad5-741c-4a8c-9f10-d08e3cedd0f7.png">

- The orientation is invalid
<img width="630" alt="Screenshot 2022-09-07 at 13 20 36" src="https://user-images.githubusercontent.com/60197762/188876979-8aaef5bd-0915-4c90-a7d5-f8abfd5de56a.png">

- The command is invalid
<img width="691" alt="Screenshot 2022-09-07 at 13 38 00" src="https://user-images.githubusercontent.com/60197762/188880482-7dc9af47-61a9-4ba3-bab6-b6c36fd00c69.png">

