require 'activesupport'

class Base
  
  #recursion to convert any level of nested objects to hash
  def to_hash
    h = Hash.new
    instance_variables.each do |attribute|    
    attribute = attribute.to_s.delete('@')
    instance = send(attribute)
    unless instance.instance_variables.empty?
      h[attribute] = instance.to_hash
    else
      h[attribute] = instance
      end
    end
    h
  end
end


#sample 
class Account < Base
  attr_accessor :num, :name 
end

class RatePlan < Base
  attr_accessor :plan_b, :plan_c
end

class PlanB < Base
  attr_accessor :testlala
end

class Testlala < Base
  attr_accessor :omg
end

class RequestData < Base
  attr_accessor :account, :rate_plan
end

account = Account.new
account.num = '1111'
account.name = 'shane'

testlala = Testlala.new
testlala.omg = 'oooo'
plan_b = PlanB.new
plan_b.testlala = testlala

rate_plan = RatePlan.new
rate_plan.plan_b = plan_b
rate_plan.plan_c = 'ff'

request_data = RequestData.new
request_data.account = account
request_data.rate_plan = rate_plan

hash = request_data.to_hash
#hash = account.to_hash
puts hash.inspect #-->{:account=>{:num=>"1111", :name=>"shane"}, :rate_plan=>{:plan_b=>{:testlala=>{:omg=>"oooo"}}}}
