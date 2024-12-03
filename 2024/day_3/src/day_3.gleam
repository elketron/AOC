import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/regexp
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  let content = simplifile.read("data.txt")

  case content {
    Ok(contents) -> {
      let sol = solution(string.replace(contents, "\n", ""))
      io.debug(sol)
      Nil
    }
    Error(_) -> Nil
  }
}

pub fn solution(input: String) -> Int {
  let terms = "mul\\((\\d{1,3}),(\\d{1,3})\\)"
  let assert Ok(re) = regexp.from_string(terms)

  let val = regexp.scan(re, input)

  val
  |> list.map(fn(item) { item.submatches })
  |> list.fold_right(0, fn(acc, item) {
    case item {
      [option.Some(first), option.Some(second)] ->
        result.unwrap(int.parse(first), 0) * result.unwrap(int.parse(second), 0)
      _ -> 0
    }
    + acc
  })
}
