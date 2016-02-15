module SongsHelper
  def lyric_format(string)
    string = string.split /\//
    string = string.map { |phrase| "<span class='phrase'>#{phrase}</span>" }.join
    simple_format(string)
  end
end
