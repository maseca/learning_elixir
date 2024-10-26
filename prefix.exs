prefix = fn a ->
           fn b ->
             "#{a} #{b}"
           end
         end

doctor = prefix.("Dr")

IO.puts doctor.("Dude")
IO.puts prefix.("School").("Sucks")
