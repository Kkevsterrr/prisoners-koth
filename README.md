# Evolutationary Prisoners Dilemma
An evolutaionary approach to an iterated <a href="https://en.wikipedia.org/wiki/Prisoner%27s_dilemma">prisoner's dilemma game</a>.  This is a King of the Hill (KOTH) programming competition - the best algorithm will be the last man standing. 

# The Story
Two criminals robbed a bank and are captured, but refuse to speak to the police. Each prisoner is put in a separate cell and is each told by the police that they had two options. They could choose to stay silent (cooperating with their partner), or they could defect on their partner and rat them out.  If they both stayed silent, they would each recieve 5 years in prison, and if they each ratted each other out, they would recieve 15 years in prison. But if one prisoner rats on the other while the other stayed silent, the snitch would go free while the silent prisoner would get 20 years.  These prison times are only examples, but illustrate the general payoffs.

In this game, these prison times are represented by the payoff matrix below, describing the total number of points each prisoner would recieve in each possible scenario. 

| P1/P2 | Cooperate | Defect |
| ------ | --------- |------ |
| Cooperate | 3, 3 | 0, 5 |
| Defect | 5,0 | 1,1 |

As such, the best possible total outcome is if both players cooperate with one another, as they will recieve a total of 6 points, even though each player would only recieve three.  The best personal outcome is if you defect and the other prisoner cooperates - a total personal score of 5. The worst overall scenario is when both prisoners rat on each other, as each will only recieve a single point. 

Therefore, there is an incentive to defect on the other prisoner, as it gaurantees the best possible personal score.  However, if both defect, each player will recieve the worst score. There is also an incentive for both to cooperate, as that gives the best total score, but if the other player defects, the cooperating prisoner is left with nothing.  

# The Game
Every player will write the strategy of a prisoner for a <a href="https://en.wikipedia.org/wiki/Prisoner%27s_dilemma">prisoner's dilemma game</a>. You will decide if your prisoner is to cooperate (C) or to defect (D). Your prisoner and a random other prisoner (potentially a copy of yourself) will face off 100 times, and the winner has the most points at the end of the round. 


# Evolution
For every round, each player's prisoner will be spawned 100 times in the arena to start. All programs will be randomly paired against one another, and play Prisoner's Dilemma 100 times. For each prisoner program, a total payoff for each of the 100 games played is tabulated, and the total number of points scored by every prisoner is totaled. The percentage of total points that each prisoner's program recieves will determine it's representation in the next round.  This iteration continues round by round until every prisoner is killed off except the winner.

For example, if two programs are spawned in an arena (100 copies each), and Prisoner1 scores a total of 750 points, and Prisoner2 scores only 250 points, the in the next round, Prisoner1 make up 75% of the spawned programs in the next round, or 150 programs, and Prisoner2 will only be spawned 50 copies.  This process will continue until Prisoner1 makes up 100% of the pool of programs and effectively kills off Prisoner2. 

# Examples

