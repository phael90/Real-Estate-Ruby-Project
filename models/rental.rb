require_relative( '../db/sql_runner' )

class Rental

  attr_reader( :id )
  attr_accessor( :flat_id, :tenant_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @flat_id = options['flat_id'].to_i
    @tenant_id = options['tenant_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
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

  def tenant()
    sql = "SELECT * FROM tenants WHERE id = $1"
    tenant = Tenant.find(@tenant_id)
    return tenant
  end

  def update()
    sql = "UPDATE rentals
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
      sql = "DELETE FROM rentals
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM rentals"
      results = SqlRunner.run( sql )
      return results.map { |hash| Rental.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM rentals
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Rental.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM rentals"
      SqlRunner.run( sql )
    end


end
