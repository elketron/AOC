import gleam/int
import gleam/io
import gleam/list
import gleam/order
import gleam/result
import gleam/string
import simplifile

pub type Direction {
  Forward
  Backward
}

pub fn main() {
  let content = simplifile.read("data.txt")

  let input = read_number_grid(result.unwrap(content, ""))

  case input {
    Ok(grid) -> {
      io.debug(solution(grid))
      Nil
    }
    Error(_) -> Nil
  }
}

pub fn solution(input: List(List(Int))) -> Int {
  let val =
    input
    |> list.fold([], fn(acc, el) {
      io.debug(acc)
      let val = case is_valid(el) {
        True -> 1
        False -> 0
      }
      io.debug(val)

      list.append(acc, [val])
    })
  io.debug(val)
  int.sum(val)
}

pub fn is_valid(input: List(Int)) -> Bool {
  is_ok(input) && !difference_smaller_than(input, 4)
}

pub fn is_ok(input: List(Int)) -> Bool {
  let result =
    input
    |> list.window(2)
    |> list.map(fn(val) {
      int.compare(
        result.unwrap(list.first(val), 0),
        result.unwrap(list.last(val), 0),
      )
    })

  list.all(result, fn(x) { x == order.Gt })
  || list.all(result, fn(x) { x == order.Lt })
}

pub fn difference_smaller_than(input: List(Int), by: Int) -> Bool {
  input
  |> list.window(2)
  |> list.map(fn(val) {
    let new_val =
      result.unwrap(list.first(val), 0) - result.unwrap(list.last(val), 0)

    let abs = int.absolute_value(new_val)

    abs > 0 && abs < 4
  })
  |> list.contains(False)
}

pub fn read_number_grid(content: String) -> Result(List(List(Int)), Nil) {
  // Split the content into lines
  let lines = string.split(content, "\n")

  // Remove any empty lines
  let non_empty_lines = list.filter(lines, fn(line) { line != "" })

  // Convert each line to a list of integers
  let parsed_grid =
    list.try_map(non_empty_lines, fn(line) {
      line
      |> string.split(" ")
      |> list.try_map(fn(num_str) { int.parse(num_str) })
    })

  // Return the result
  parsed_grid
}
