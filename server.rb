#!/usr/bin/env ruby

require 'monitor'
require 'thread'
require 'timeout'

#TODO:
# Send out invitation/spec to students

$stdout.sync = true
Thread.abort_on_exception = true

INITIAL_COUNT_OF_EACH_PROGRAM = 20
NUM_ROUNDS = 100
PAYOFFS = {
  ["C\n", "C\n"] => [3, 3], ["C\n", "D\n"] => [0, 5],
  ["D\n", "C\n"] => [5, 0], ["D\n", "D\n"] => [1, 1],
}

class_files = Dir["./prisoners/*.class"]
programs = class_files.map { |file_path| /.*\/(.*).class/.match(file_path)[1] }
population = programs * INITIAL_COUNT_OF_EACH_PROGRAM
population.shuffle!


1.times { puts }
puts "Lets run an evolutionary game of Iterated Prisoner's Dilemma"
2.times { puts }
sleep 1
puts "Our contestants are:"
sleep 0.75
programs.sort.each { |p|
  puts p
  sleep 0.75
}
puts
sleep 2
puts
puts "It looks like this'll be a rough competition!"
puts
sleep 2
puts
print "Loading." ; 72.times { sleep 0.02 ; print "." }
puts
puts
sleep 1.3
puts
puts
puts "[press Enter to begin]"
puts
gets
sleep 0.7
puts

results = Array.new
mon = Monitor.new

until population.uniq.one?
  scores = Hash.new(0)

  assoc = population.group_by { |p| p }.map { |p,l| [p,l.length] }
  best, _ = assoc.max_by { |_,l| l }
  puts "Running generation #{results.size}, the best so far is #{best}!"
  puts assoc.sort_by { |p,l| -l }.map { |p,l| "[#{p} #{l}]" }.join(" ")
  puts

  population.each_slice(2).map { |p1, p2|
    Thread.new {
      p1_score = 0
      p2_score = 0

      begin
        Timeout.timeout(20) {
          # holy fuck processes are annoying
          IO.popen("java -cp prisoners/ #{p1}", "r+") { |io_1|
            IO.popen("java -cp prisoners/ #{p2}", "r+") { |io_2|

              io_1.puts NUM_ROUNDS
              io_2.puts NUM_ROUNDS

              move = [io_1.gets, io_2.gets]
              payoff_1, payoff_2 = PAYOFFS[move]
              p1_score += payoff_1
              p2_score += payoff_2

              (NUM_ROUNDS - 1).times {
                io_1.puts move[1]
                io_2.puts move[0]

                move = [io_1.gets, io_2.gets]
                payoff_1, payoff_2 = PAYOFFS[move]
                p1_score += payoff_1
                p2_score += payoff_2
              }
            }
          }
        }
        
        mon.synchronize {
          scores[p1] += p1_score
          scores[p2] += p2_score
        }   
      rescue Timeout::Error
        puts "A program, either #{p1} or #{p2}, timed out"
      end
    }
  }.each { |t| t.join }

  results << { :population => population, :scores => scores }

  puts results.last[:scores].sort_by { |p,l| -l }.map { |p,l| "{#{p} #{l}}" }.join(" ")
  proportions = population.group_by { |p| p }.merge(scores) { |p, arr, scrs| scrs.fdiv(arr.length) }
  puts proportions.sort_by { |p,l| -l }.map { |p,l| "<#{p} #{(l*100).round.fdiv(100).to_s}>" }.join(" ")

  candidates = scores.inject([]) { |memo, (p, n)| memo + Array.new(n, p) }
  population = candidates.shuffle.take(population.length)

  puts
  puts
  puts
end

puts "And the winner is #{population.first} after #{results.length} generations!"
puts
