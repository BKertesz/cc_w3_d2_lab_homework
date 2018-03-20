require('pg')
require 'pry'
class Bounty

  attr_accessor :id, :name, :species, :bounty_value, :homeworld

  def initialize(objects)
    @id = objects['id']
    @name = objects['name']
    @species = objects['species']
    @bounty_value = objects['bounty_value']
    @homeworld = objects['homeworld']
  end

  def save()
    db = PG.connect({dbname:'bounty_hunter', host:'localhost'})
    sql = "INSERT INTO bounties (name,species,bounty_value,homeworld) VALUES ($1,$2,$3,$4);"
    values = [@name,@species,@bounty_value,@homeworld]
    db.prepare('save',sql)
    db.exec_prepared('save',values)
    db.close()
  end

  def update()
    db = PG.connect({dbname:'bounty_hunter', host:'localhost'})
    sql = "UPDATE bounties SET (name,species,bounty_value,homeworld)=($1,$2,$3,$4) WHERE id=$5;"
    values = [@name,@species,@bounty_value,@homeworld,@id]
    db.prepare('update',sql)
    db.exec_prepared('update',values)
    db.close()
  end

  def delete()
    db = PG.connect({dbname:'bounty_hunter', host:'localhost'})
    sql = "DELETE FROM bounties WHERE id=$1;"
    value = [@id]
    db.prepare('delete',sql)
    db.exec_prepared('delete',value)
    db.close()
  end

  def Bounty.find_by_name(name_to_find)
    db = PG.connect({dbname:'bounty_hunter',host:'localhost'})
    sql = "SELECT * FROM bounties WHERE name = $1;"
    value = [name_to_find]
    db.prepare('find_by_name',sql)
    object = db.exec_prepared('find_by_name',value)
    db.close()
    bountie_objects = object.map{|hash| Bounty.new(hash)}
    return bountie_objects if bountie_objects.length > 0
    return nil
  end

  def Bounty.find(id_to_find)
    # binding.pry
    db = PG.connect({dbname:'bounty_hunter',host:'localhost'})
    sql = "SELECT * FROM bounties WHERE id = $1;"
    value = [id_to_find.to_i]
    db.prepare('find_by_id',sql)
    object = db.exec_prepared('find_by_id',value)
    db.close()
    found = object.map{|hash| Bounty.new(hash)}
    return found
  end

  def Bounty.load
    db = PG.connect({dbname:'bounty_hunter',host:'localhost'})
    sql = "SELECT * FROM bounties ORDER BY id;"
    db.prepare('load',sql)
    hashes = db.exec_prepared('load')
    db.close()
    return all_bounties = hashes.map{|x| Bounty.new(x)}

  end


end
