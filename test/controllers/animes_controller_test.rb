require 'test_helper'

class AnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = animes(:one)
  end

  test "should get index" do
    get animes_url
    assert_response :success
  end

  test "should get new" do
    get new_anime_url
    assert_response :success
  end

  test "should create anime" do
    assert_difference('Anime.count') do
      post animes_url, params: { anime: { description: @anime.description, duration: @anime.duration, episode: @anime.episode, genre: @anime.genre, licencer: @anime.licencer, name: @anime.name, picture: @anime.picture, premiered: @anime.premiered, producer: @anime.producer, rating: @anime.rating, score: @anime.score, source: @anime.source, studio: @anime.studio, type: @anime.type } }
    end

    assert_redirected_to anime_url(Anime.last)
  end

  test "should show anime" do
    get anime_url(@anime)
    assert_response :success
  end

  test "should get edit" do
    get edit_anime_url(@anime)
    assert_response :success
  end

  test "should update anime" do
    patch anime_url(@anime), params: { anime: { description: @anime.description, duration: @anime.duration, episode: @anime.episode, genre: @anime.genre, licencer: @anime.licencer, name: @anime.name, picture: @anime.picture, premiered: @anime.premiered, producer: @anime.producer, rating: @anime.rating, score: @anime.score, source: @anime.source, studio: @anime.studio, type: @anime.type } }
    assert_redirected_to anime_url(@anime)
  end

  test "should destroy anime" do
    assert_difference('Anime.count', -1) do
      delete anime_url(@anime)
    end

    assert_redirected_to animes_url
  end
end
