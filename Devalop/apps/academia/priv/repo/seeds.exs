alias Academia.Repo
alias Academia.Workshops.{
  Event,
  EventWorkshop,
  Workshop
}

Repo.insert!(%Event{name: "Meetup #2", event_date: Date.utc_today()})

workshops = [
  "3D Modeling",
  "Android",
  "Augmented Reality",
  "Blockchain",
  "iOS",
  "IoT",
  "Machine Learning",
  "Web Development"
]

Enum.map(workshops, fn (workshop) ->
  slug =
    String.downcase(workshop)
    |> String.replace(" ", "-")
  workshop =
    Repo.insert!(%Workshop{
      name: workshop,
      slug: slug
    })
  
  event = Repo.get_by(Event, name: "Meetup #2")

  Repo.insert!(%EventWorkshop{event_id: event.id, workshop_id: workshop.id})
end)

