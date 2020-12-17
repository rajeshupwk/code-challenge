require 'byebug'

require_relative '../lib/search_parser'

class SearchParserSpec

  describe SearchParser do
    filepath = "./files/van-gogh-paintings.html"

    parser = SearchParser.new File.read(filepath)
    result = parser.parse

    it "returns hashmap" do
      expect(result.class.to_s).to eq "Hash"
    end

    it "has key named 'artworks'" do
      expect(result[:artworks]).not_to eq nil
    end

    it "has artworks type = array" do
      expect(result[:artworks].class.to_s).to eq "Array"
    end

    it "returns correct number of results (51)" do 
      expect(result[:artworks].length).to eq 51
    end

    it "correctly parses the artwork" do
      artwork = result[:artworks][1]
      expect(artwork["name"]).to eq "Irises"
      expect(artwork["extensions"][0]).to eq '1889'
      expect(artwork["link"]).to eq 'https://www.google.com/search?gl=us&hl=en&q=Irises+(painting)&stick=H4sIAAAAAAAAAONgFuLQz9U3MI_PNVLiBLGMzUvMi7WUspOt9Msyi0sTc-ITi0qQmJnFJVbl-UXZxY8YI7kFXv64JywVMGnNyWuMXlxEaBJS4WJzzSvJLKkUkuLikYLbrcEgxcUF5_EsYhX0LMosTi1W0ChIzASqz0vXBADZ_49eqwAAAA&npsic=0&sa=X&ved=0ahUKEwiL2_Hon4_hAhXNZt4KHTOAACwQ-BYIMg'
    end
  end
end
