CoordsToWeather::Application.routes.draw do
  get("/weather", { :controller => "coords", :action => "fetch_weather" })
  get("/local_weather", { :controller => "coords", :action => "local_weather" })
end
