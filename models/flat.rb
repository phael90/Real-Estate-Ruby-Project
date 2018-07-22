require_relative( '../db/sql_runner' )

class Flat

  attr_reader( :id, :location, :avalible_space, :animal_friendly, :smokers_friendly )
  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @location = options['location']
    @avalible_space = options['avalible_space'].to_i if options['avalible_space']
    @animal_firendly = options['animal_firendly']
    @smokers_friendly = options['smokers_friendly']
  end

  def save()
    sql = "INSERT INTO flats
    (
      location,
      avalible_space,
      animal_friendly,
      smokers_friendly
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@location, @avalible_space, @animal_firendly, @smokers_firendly]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

end
