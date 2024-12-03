import day_2
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn is_valid_test() {
  day_2.is_valid([7, 6, 4, 2, 1]) |> should.equal(True)
}

pub fn is_invalid_test() {
  day_2.is_valid([1, 2, 7, 8, 9]) |> should.equal(False)
}

pub fn is_invalid_order_test() {
  day_2.is_valid([1, 3, 2, 4, 5]) |> should.equal(False)
}

pub fn solution_test() {
  day_2.solution([
    [7, 6, 4, 2, 1],
    [1, 2, 7, 8, 9],
    [9, 7, 6, 2, 1],
    [1, 3, 2, 4, 5],
    [8, 6, 4, 4, 1],
    [1, 3, 6, 7, 9],
  ])
  |> should.equal(4)
}
