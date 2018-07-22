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

end
