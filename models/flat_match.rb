require_relative( '../db/sql_runner' )

class FlatMatch

  attr_reader( :id )
  attr_accessor( :flat_id, :tenant_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @flat_id = options['flat_id'].to_i
    @tenant_id = options['tenant_id'].to_i
  end

  def save()
    sql = "INSERT INTO flat_matches
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
    sql = "UPDATE flat_matches
    SET
    (
      flat_id,
      tenant_id
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@flat_id, @tenant_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM flat_matches
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM flat_matches"
      results = SqlRunner.run( sql )
      return results.map { |hash| FlatMatch.new( hash ) }
    end

    # def self.find( id )
    #   sql = "SELECT * FROM flat_match
    #   WHERE id = $1"
    #   values = [id]
    #   results = SqlRunner.run( sql, values )
    #   return flat_match.new( results.first )
    # end
    #
    # def self.delete_all
    #   sql = "DELETE FROM flat_match"
    #   SqlRunner.run( sql )
    # end


end
