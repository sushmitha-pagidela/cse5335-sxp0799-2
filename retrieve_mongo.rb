require 'mongo'
require 'csv'

mongo_uri = 'mongodb://heroku_jqxh7hrz:gebv85nl1vseql8474b5101jbj@ds041144.mlab.com:41144/heroku_jqxh7hrz'

begin
    client = Mongo::Client.new([ 'ds041144.mlab.com:41144' ],:database =>'heroku_jqxh7hrz',:user=>'heroku_jqxh7hrz',:password=>'gebv85nl1vseql8474b5101jbj');
    db = client.database
    stats=db.collection('demo_statistics')
    puts "Retrieve successful"
    result = stats.find()
    puts " JURISID | PARTID | FEMID6 | PERFEM | MAL | PERMAL "              
    result.each do |document|
  		puts "#{document['slno']} | #{document['jurisid']} | #{document['partid']} | #{document['femid6']} | #{document['perfem']} | #{document['mal']} | #{document['permal']} "
    end
end
