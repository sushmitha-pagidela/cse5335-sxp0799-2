require 'mongo'
require 'csv'


mongo_uri = 'mongodb://heroku_jqxh7hrz:gebv85nl1vseql8474b5101jbj@ds041144.mlab.com:41144/heroku_jqxh7hrz'

begin
    #Connecting to the Mongo Client
    client = Mongo::Client.new([ 'ds041144.mlab.com:41144' ],:database =>'heroku_jqxh7hrz',:user=>'heroku_jqxh7hrz',:password=>'gebv85nl1vseql8474b5101jbj');  
    puts "Successfully connected to mongo db"
    db = client.database
    db.collection_names.each{|name| puts name }
        stats=db.collection('demo_statistics')
        
    CSV.foreach('data.csv', :headers => true) do |csv_obj|
               result=stats.insert_one({ :slno => csv_obj['SLNO'], :jurisid => csv_obj['JURISID'], :partid => csv_obj['PARTID'], :femid6 => csv_obj['FEMID6'], :perfem => csv_obj['PERFEM'], :mal => csv_obj['MAL'], :permal => csv_obj['PERMAL']})
                
        end    
        puts "Insertion into mongo db successful"

end
