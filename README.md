# Evolutationary Prisoners Dilemma
An evolutaionary approach to an iterated prisoner's dilemma game. 

# The Story
Two criminals robbed a bank and are captured, but refuse to speak to the police. Each prisoner is put in a separate cell and is each told by the police that they had two options. They could choose to stay silent (cooperating with their partner), or they could defect on their partner and rat them out.  If they both stayed silent, they would each recieve 5 years in prison, and if they each ratted each other out, they would recieve 15 years in prison. But if one prisoner rats on the other while the other stayed silent, the snitch would go free while the silent prisoner would get 20 years.  These prison times are represented by a payoff matrix below, describing the total number of points each prisoner would recieve in each  

| Prisoner1/Prisoner2 | Cooperate | Defect |
| ------ | --------- |------ |
| Cooperate | 1, 1 | 0, 5 |
| Defect | 5,0 | 3,3 |

# The Game
Every player will write the strategy of a prisoner for a <a href="https://en.wikipedia.org/wiki/Prisoner%27s_dilemma">prisoner's dilemma game</a>. You will decide if your prisoner is to cooperate or to defect. 


# Evolution
For every round, each player's prisoner will be spawned 100 times in the arena to start. All programs will be randomly paired against one another, and play Prisoner's Dilemma 100 times. For each prisoner program, a total payoff for each of the 100 games played is tabulated, and the total number of points scored by every prisoner is totaled. The percentage of total points that each prisoner's program recieves will determine it's representation in the next round.  This iteration continues round by round until every prisoner is killed off except the winner.

For example, if two programs are spawned in an arena (100 copies each), and Prisoner1 scores a total of 750 points, and Prisoner2 scores only 250 points, the in the next round, Prisoner1 make up 75% of the spawned programs in the next round, or 150 programs, and Prisoner2 will only be spawned 50 copies.  This process will continue until Prisoner1 makes up 100% of the pool of programs and effectively kills off Prisoner2. 


