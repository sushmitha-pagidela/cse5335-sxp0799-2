require 'mongo'
require 'json'

class MaincontrollerController < ApplicationController
  def output
    client = Mongo::Client.new([ 'ds041144.mlab.com:41144' ],:database =>'heroku_jqxh7hrz',:user=>'heroku_jqxh7hrz',:password=>'gebv85nl1vseql8474b5101jbj');
    db = client.database
     stats=db.collection('demo_statistics')
     puts "Retrieve successful"
     result = stats.find()
     puts "JURISDICTION | PARTICIPANTS | FEMALE | PERCENT_FEMALE | MALE | PERCENT_MALE "
     result.each do |document|
         puts "#{document['slno']} | #{document['jurisid']} | #{document['partid']} | #{document['femid6']} | #{document['perfem']} | #{document['mal']} | #{document['permal']} " 	end
	render json: result
end
end