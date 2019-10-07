{
  "Z_PK"=>210,
  "Z_ENT"=>11,
  "Z_OPT"=>2,
  "ZDELETEDCALL"=>0,
  "ZLOCATIONAQUIRED"=>1,
  "ZLOCATIONAQUISITIONATTEMPTED"=>1,
  "ZPICTURE"=>nil,
  "ZUSER"=>1,
  "ZMOSTRECENTRETURNVISITDATE"=>591367220.268303,
  "ZLATTITUDE"=>-29.70129,
  "ZLONGITUDE"=>-51.143288,
  "ZAPARTMENTNUMBER"=>"",
  "ZCITY"=>"Novo Hamburgo",
  "ZCONTACTIDENTIFIER"=>nil,
  "ZHOUSENUMBER"=>"48",
  "ZLOCATIONLOOKUPTYPE"=>"Locate using google Maps",
  "ZNAME"=>"Dona Geneci ",
  "ZSTATE"=>"RS",
  "ZSTREET"=>"Rua Esteio",
  "ZCOLOR"=>nil,
  "ZCALL"=>108,
  "ZDATE"=>591367220.268303,
  "ZNOTES"=>"Is 46:10. Somos sempre bem vindos",
  "ZTYPE"=>"Initial Visit"
}

module MyTime
  class Call
    def initialize(data)
      @data = data
    end

    def name
      attribute(:name)
    end

    def notes
      attribute(:notes)
    end

    def address
      parts = ["#{street}, #{house_number}"]

      unless apartment_number.to_s.empty?
        parts.push(apartment_number)
      end

      parts.join(" Apto: ")
    end

    def street
      attribute(:street)
    end

    def apartment_number
      attribute(:apartmentnumber)
    end

    def house_number
      attribute(:housenumber)
    end

    def date
      value = attribute(:date) + 24*60*60
      Time.at(value)
    end

    def deleted?
      attribute(:deletedcall).positive?
    end

    def to_s
      "<#{self.class} @data=#{@data.inspect}>"
    end

    private

    def attribute(key)
      @data.fetch("Z#{key.to_s.upcase}")
    end
  end
end
