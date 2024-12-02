import day_1
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  1
  |> should.equal(1)
}

pub fn solution_test() {
  day_1.solution([3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3])
  |> should.equal(11)
}

pub fn seperate_values_test() {
  day_1.seperate_values(
    "3 4
  4 3
  2 5
  1 3
  3 9
  3 3",
  )
  |> should.equal(#([3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]))
}
