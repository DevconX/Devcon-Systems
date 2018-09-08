defmodule Academia.UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  alias Ueberauth.Auth
  alias Academia.{Repo, User}

  def find_or_create(%Auth{provider: :identity} = auth) do
    case validate_pass(auth.credentials) do
      :ok ->
        github_user = basic_info(auth)
        params = %{
          "github_uid" => to_string(github_user.id),
          "email" => github_user.email,
          "full_name" => github_user.name,
          "avatar" => github_user.avatar
        }

        user = create_user(params)
        {:ok, user}
      {:error, reason} -> {:error, reason}
    end
  end

  def find_or_create(%Auth{} = auth) do
    github_user = basic_info(auth)
    params = %{
      "github_uid" => to_string(github_user.id),
      "email" => github_user.email,
      "full_name" => github_user.name,
      "avatar" => github_user.avatar
    }

    user = create_user(params)
    {:ok, user}
  end

  defp basic_info(auth) do
    %{id: auth.uid, email: auth.info.email, name: name_from_auth(auth), avatar: auth.info.urls.avatar_url}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end

  defp validate_pass(%{other: %{password: ""}}) do
    {:error, "Password required"}
  end
  defp validate_pass(%{other: %{password: pw, password_confirmation: pw}}) do
    :ok
  end
  defp validate_pass(%{other: %{password: _}}) do
    {:error, "Passwords do not match"}
  end
  defp validate_pass(_), do: {:error, "Password Required"}

  defp create_user(%{"github_uid" => uid, "email" => _email, "full_name" => _full_name, "avatar" => _avatar} = params) do
    user = Repo.get_by(User, github_uid: uid)
    
    if is_nil(user) do
      changeset = User.changeset(%User{}, params)

      if changeset.valid? do
        {:ok, user} = Repo.insert(changeset)
      end
    end
    user
  end
end