require_relative( '../db/sql_runner' )

class Tenant

  attr_reader( :id )
  attr_accessor( :first_name, :last_name, :age, :nationality, :gender, :preferred_location, :animal, :can_live_with_animal, :smoke, :can_live_with_smokers)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i if options['age']
    @nationality = options['nationality']
    @gender = options['gender']
    @preferred_location = options['preferred_location']
    @profession = options['profession']
    @animal = options['animal']
    @can_live_with_animal = options['can_live_with_animal']
    @smoke = options['smoke']
    @can_live_with_smokers = options['can_live_with_smokers']
    @flat_id = options['flat_id'].to_i if options['flat_id']
  end

  def save()
    sql = "INSERT INTO tenants
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
      can_live_with_smokers,
      flat_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @nationality, @gender, @preferred_location, @profession, @animal, @can_live_with_animal, @smoke, @can_live_with_smokers, @flat_id]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def flat()
    sql = "SELECT * FROM flats WHERE id = $1"
    values = [@flat_id]
    results = SqlRunner.run( sql, values )
    return results.map { |hash| Flat.new( hash ) }
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
      can_live_with_smokers,
      flat_id
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12
      )
      WHERE id = $13"
      values = [@first_name, @last_name, @age, @nationality, @gender, @preferred_location, @profession, @animal, @can_live_with_animal, @smoke, @can_live_with_smokers, @flat_id, @id]
      SqlRunner.run(sql, values)
    end

    # def delete()
    #   sql = "DELETE FROM tenants
    #   WHERE id = $1"
    #   values = [@id]
    #   SqlRunner.run(sql, values)
    # end
    #
    # def self.all()
    #   sql = "SELECT * FROM tenants"
    #   results = SqlRunner.run( sql )
    #   return results.map { |hash| Tenant.new( hash ) }
    # end
    #
    # def self.find( id )
    #   sql = "SELECT * FROM tenants
    #   WHERE id = $1"
    #   values = [id]
    #   results = SqlRunner.run( sql, values )
    #   return Tenant.new( results.first )
    # end
    #
    # def self.delete_all
    #   sql = "DELETE FROM tenants"
    #   SqlRunner.run( sql )
    # end

  end
