local dummy, data = turtle.inspect()
success = false

print("Place paper in the inventory above and the fragment in the inventory to the left.")
print("The output will be placed in the inventory below.")
-- Checks to make sure the turtle is in the correct orientation.
repeat
  sleep(1)
  local dummy, data = turtle.inspect()
  if data.name == "Mariculture:limestone" then
    success = true
    print("Facing the correct direction. Starting.")
    break
  end
  -- print("Block was: ", data.name, "... Turning left.")
  turtle.turnLeft()
until(success == true)

turtle.turnLeft()
turtle.select(1)
turtle.suck()

turtle.select(2)
turtle.suckUp()
craftsRemaining = turtle.getItemCount()

turtle.select(3)
turtle.dropUp()

turtle.select(1)
turtle.craft()
craftsRemaining = craftsRemaining - 1
turtle.dropDown()


while(true) do
  turtle.suck()
  if turtle.craft() then 
    craftsRemaining = craftsRemaining - 1
  end
  turtle.dropDown()

  if craftsRemaining < 1 then
    print("Resupplying secondary ingredient")
    turtle.select(2)
    turtle.suckUp()
    turtle.select(1)
  end
end
  