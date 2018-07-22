require_relative( '../db/sql_runner' )

class Tenant

  attr_reader( :id, :first_name, :last_name, :age, :nationality, :gender, :preferred_location, :animal, :can_live_with_animal, :smoke, :can_live_with_smokers)

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
      can_live_with_smokers
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @nationality, @gender, @preferred_location, @profession, @animal, @can_live_with_animal, @smoke, @can_live_with_smokers]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end
end
