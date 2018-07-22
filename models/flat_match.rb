require_relative( '../db/sql_runner' )

class FlatMatch

  attr_reader( :id, :flat_id, :tenant_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @flat_id = options['flat_id'].to_i
    @tenant_id = options['tenant_id'].to_i
  end

  def save()
    sql = "INSERT INTO FlatMatch
    (
      flat_id,
      tenant_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@flat_id, @tenant_id]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def find()
    tenant = Tenant.find(@flat_id)
    return house
  end

  def update()
    sql = "UPDATE tenants
    SET
    (
      first_name,
      last_name,
      age,
      nationality,
      gender,
      preferred_location,
      profession,
      animal,
      can_live_with_animal,
      smoke,
      can_live_with_smokers
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
      )
      WHERE id = $12"
      values = [@first_name, @last_name, @age, @nationality, @gender, @preferred_location, @profession, @animal, @can_live_with_animal, @smoke, @can_live_with_smokers]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM flat_match
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM flat_match"
      results = SqlRunner.run( sql )
      return results.map { |hash| flat_match.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM flat_match
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return flat_match.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM flat_match"
      SqlRunner.run( sql )
    end


end
