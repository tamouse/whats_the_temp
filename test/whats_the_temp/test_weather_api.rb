# frozen_string_literal: true

# weather_ap_test file for weather_api

require "test_helper"
require "json"

module WhatsTheTemp
  class TestWeatherApi < Minitest::Test
    def setup
      @w = WhatsTheTemp::WeatherApi.new
      @zip = "55118" # St. Paul, MN
    end

    def test_current_temp_for
      weather = @w.current_temp_for(@zip)
      # puts weather.inspect

      refute_nil weather
    end

    def test_create_url
      # assert_equal "http://api.weatherapi.com/v1/current.json?key=d83c18de62814e559d1143220240404&q=55118&aqi=no",
      assert_equal  "http://api.weatherapi.com/v1/current.json?key=d83c18de62814e559d1143220240404&q=55118&aqi=no",
                    @w.create_url(@zip).to_s
    end

    def test_get_weather_for
      response = @w.get_weather_for @zip

      refute_nil response

      assert_equal "Saint Paul", response.dig("location", "name")
    end
  end
end
