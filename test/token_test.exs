defmodule TokenTest do
  use ExUnit.Case, async: true

  test("generated token is a string") do
    Token.generate!()
    |> is_binary()
    |> assert()
  end

  test("generated token is 64 characters long") do
    token = Token.generate!()

    assert(String.length(token) === 64)
  end

  test("hash is generated based on a string, not randomness") do
    result = "1686e3e0106632a8ecb5d10bb0bbea1ad75365972a549a67db351e6cf070095db6d1aae24b3ccb121e7c44626f0eb24e57c043056baba911722f1d571c68ef48"
    text = "test_string"

    assert(Token.hash!(text) === result)
  end

  test("hashed token is a string") do
    Token.generate!()
    |> Token.hash!()
    |> is_binary()
    |> assert()
  end

  test("hashed token (sha512) is 128 chars long") do
    hash = Token.hash!(Token.generate!())

    assert(String.length(hash) === 128)
  end
end
