defmodule Token do
  @moduledoc """
  Functions for generating and hashing strings

  ### Configuration

  The module can be configured under the `:token` namespace
  with the following options:

  * `:algorithm` – A hashing algorithm, can be either:
    `:md5`, `:sha`, `:sha224`, `:sha256`, `:sha384`,
    `:sha512`
  * `:secret` – A secret is used to sign a hash
    *(required)*
  
  Example `config/config.exs`:

  ```
  config :token,
    algorithm: :sha256,
    token: "token_secret"
  ```
  """

  @doc """
  Generates a cryptographically secure pseudorandom string

  This function generates bytes using the
  `:crypto.strong_rand_bytes/1` function and the bytes
  are converted into a hexadecimal string.
  The result is 64 characters long
  """
  @spec generate!() :: String.t
  def generate!() do
    :crypto.strong_rand_bytes(32)
    |> Base.encode16(case: :lower)
  end

  @doc """
  Hashes the passed string with a secret

  The hash is signed using HMAC with the algorithm
  defined in the configuration file.
  The default algorithm is `:sha512`

  To be able to hash, you need to define a secret
  in your configuration file. See also
  [Configuration](#module-configuration).

  **This function is not intended to hash passwords,
  or any user-passed string. If you are looking
  for a way to hash passwords, use `Comeonin.Bcrypt`,
  or `Comeonin.Argon2`.**
  """
  @spec hash!(String.t) :: String.t
  def hash!(token) when is_binary(token) do
    secret = Application.get_env(:token, :secret) || raise "A secret is not defined, please define it in config under the :secret key of your application"
    type = Application.get_env(:token, :algorithm, :sha512)

    :crypto.hmac(type, secret, token)
    |> Base.encode16(case: :lower)
  end
end