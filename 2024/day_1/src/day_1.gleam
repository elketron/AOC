import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  let contents = case simplifile.read("data.txt") {
    Ok(val) -> val
    Error(_) -> panic as "Failed to read file"
  }

  let #(left_values, right_values) = seperate_values(contents)
  io.debug(left_values)
  io.debug(right_values)

  let result = solution(left_values, right_values)
  io.debug(result)
}

pub fn solution(list1: List(Int), list2: List(Int)) -> Int {
  list.map2(
    list.sort(list1, int.compare),
    list.sort(list2, int.compare),
    fn(x, y) { int.absolute_value(x - y) },
  )
  |> int.sum
}

pub fn seperate_values(input: String) -> #(List(Int), List(Int)) {
  input
  |> string.split(on: "\n")
  |> list.map(string.trim)
  |> list.filter(fn(line) { line != "" })
  |> list.map(fn(line) {
    let parts = string.split(line, on: " ")
    #(
      int.parse(result.unwrap(list.first(parts), "")),
      int.parse(result.unwrap(list.last(parts), "")),
    )
  })
  |> list.map(fn(tuple) {
    let #(left, right) = tuple
    #(result.unwrap(left, 0), result.unwrap(right, 0))
  })
  |> list.unzip
}
