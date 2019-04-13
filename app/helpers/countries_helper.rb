module CountriesHelper
  def countries_for_select
    Country.all.collect {|c| [ c.name, c.id ] }
  end
end
