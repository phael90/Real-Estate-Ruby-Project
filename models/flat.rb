require_relative( '../db/sql_runner' )

class Flat

  attr_reader( :id )
  attr_accessor( :location, :available_space, :animal_friendly, :smokers_friendly)
  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @location = options['location']
    @available_space = options['available_space'].to_i if options['available_space']
    @animal_firendly = options['animal_firendly']
    @smokers_friendly = options['smokers_friendly']
  end

  def save()
    sql = "INSERT INTO flats
    (
      location,
      available_space,
      animal_friendly,
      smokers_friendly
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@location, @available_space, @animal_firendly, @smokers_firendly]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def tenants()
    sql = "SELECT * FROM tenants WHERE flat_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return results.map { |hash| Tenant.new( hash ) }
  end

  def update()
    sql = "UPDATE flats
    SET
    (
      location,
      available_space,
      animal_friendly,
      smokers_friendly
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@location, @available_space, @animal_firendly, @smokers_firendly, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM flats
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM flats"
      results = SqlRunner.run( sql )
      return results.map { |hash| Flat.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM flats
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Flat.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM flats"
      SqlRunner.run( sql )
    end

  end
