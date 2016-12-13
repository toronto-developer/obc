#!/usr/bin/env ruby

require 'csv'

csv_input = ""

while (input = STDIN.gets)
  csv_input += input
end

csv_rows = CSV.parse(csv_input, headers: true)

corporate_bonds = csv_rows.select { |row| row["type"] == "corporate" }
government_bonds = csv_rows.select { |row| row["type"] == "government" }

benchmark_bonds = corporate_bonds.map do |corporate_bond|
  best_government_bond = government_bonds.min_by do |government_bond|
    (corporate_bond["term"].to_f - government_bond["term"].to_f).abs
  end

  spread_to_benchmark = corporate_bond["yield"].to_f - best_government_bond["yield"].to_f

  [corporate_bond["bond"], best_government_bond["bond"], "%0.2f" % spread_to_benchmark].join(",")
end

puts "bond,benchmark,spread_to_benchmark"
puts benchmark_bonds.join("\n")
