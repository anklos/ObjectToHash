#Convert complex ruby object into hash

##sample usage
	class Account
      attr_accessor :num, :name
    end

    class RatePlan
      attr_accessor :plan_b, :plan_c
    end

    class PlanB
      attr_accessor :testlala
    end

    class Testlala
      attr_accessor :omg
    end

    class RequestData
      include ObjectToHash
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
    puts hash.inspect #-->{"account"=>{"num"=>"1111", "name"=>"shane"},"rate_plan"=>{"plan_b"=>{"testlala"=>{"omg"=>"oooo"}}, "plan_c"=>"ff"}}

