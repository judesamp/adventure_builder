module AdventuresHelper

  def adventure_description(adventure)
    adventure.description || 'There is no description available for this adventure.'
  end

end
