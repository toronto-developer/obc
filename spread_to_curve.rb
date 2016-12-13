#!/usr/bin/env ruby

require "csv"
require "interpolate"

csv_input = ""

while (input = STDIN.gets)
  csv_input += input
end

csv_rows = CSV.parse(csv_input, headers: true)

corporate_bonds = csv_rows.select { |row| row["type"] == "corporate" }
government_bonds = csv_rows.select { |row| row["type"] == "government" }

interpolations = Hash[government_bonds.map { |row| [row["term"].to_f, row["yield"].to_f] }]
points = Interpolate::Points.new(interpolations)

benchmark_bonds = corporate_bonds.map do |corporate_bond|
  interpolized_yield = points.at(corporate_bond["term"].to_f)
  spread_to_curve = corporate_bond["yield"].to_f - interpolized_yield

  [corporate_bond["bond"], "%0.2f" % spread_to_curve].join(",")
end

puts "bond,spread_to_curve"
puts benchmark_bonds.join("\n")
