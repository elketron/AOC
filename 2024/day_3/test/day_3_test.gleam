import day_3
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn parser_one_digit_test() {
  day_3.solution("mul(1,1)") |> should.equal(1)
}

pub fn parser_two_digit_test() {
  day_3.solution("mul(12,2)") |> should.equal(24)
}

pub fn parser_wrong_data_test() {
  day_3.solution("xmul(123,1)") |> should.equal(123)
}

pub fn parser_multiple_muls_test() {
  day_3.solution("xmul(123,1)xyzmul(2,2)") |> should.equal(127)
}

pub fn parser_wrong_data_spaces_test() {
  day_3.solution("mul( 123,1)") |> should.equal(0)
}

pub fn final_test() {
  day_3.solution(
    "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))",
  )
  |> should.equal(161)
}
