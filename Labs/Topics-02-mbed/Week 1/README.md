# Practical 1 - Blocking, Polling and State Machines in C/C++


## Equipment
You will need the following equipment:

* Nucleo FZ429ZI Development Board
* Prototyping wires
* RED, YELLOW and GREEN LED + current limiting resistors
* 2x Push Switches + Pull Down Resistors

## Notes and Tasks
Please refer to the practical notes in this repository. *Note* the following:

- Chapter 1 is a refresher (for week 1). 
- If you are comfortable using mbed, then you could go straight to Chapter 2 and attempt all task. This is estimated to take 6Hrs (2Hrs lab + 4Hrs self-study). 

If you feel you need to do some revision, or if you are a direct entry student, you are advised to start at Chapter 1 and do some catch up in your own time. 

## A TODO list for you:

* Make sure you can log into mbed.com
* [Bookmark this link](https://os.mbed.com/teams/University-of-Plymouth-Stage-2-and-3/code/?sort=title) to the sample code and solutions 

## Key Points
By the end of this, you should be able to:
* Understand the practical meaning of the terms 
  * blocking / spinning
  * rapid polling loops
* Using C, you can block on a device (such as a switch or Timer) using a BUSY-WAIT (spinning) method.
  * You understand the problems associated with this approach.
* Implement a non-blocking rapid-polling loop to interrogate multiple devices at once.
* Use a switch-case statement to implement a Moore/Mealy machines to manage real-time events (such as switch presses and timers) without blocking
