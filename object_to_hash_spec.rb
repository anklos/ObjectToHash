require './object_to_hash'

class Account
  include ObjectToHash
  attr_accessor :num, :name, :account
end

class PlanA
  attr_accessor :name, :manager
end

class PlanB
  attr_accessor :name, :manager
end

class RequestData
  include ObjectToHash
  attr_accessor :plan_a, :plan_b
end

describe ObjectToHash do

  context "#to_hash" do

    let(:account)       { Account.new }
    let(:plan_a)        { PlanA.new }
    let(:plan_b)        { PlanB.new }
    let(:request_data)  { RequestData.new }

    it "should convert a simple object to hash" do
      account.num = 1
      account.name = "shane"
      account.to_hash.should eq({"num" =>1, "name" => "shane"})
    end

    it "should convert a complex object to hash" do
      plan_a.name = "plan a"
      plan_a.manager = "manager a"

      plan_b.name = "plan b"
      plan_b.manager = "manager b"

      request_data.plan_a = plan_a
      request_data.plan_b = plan_b

      request_data.to_hash.should eq({"plan_a" => {"name" => "plan a", "manager" => "manager a"}, "plan_b" => {"name" => "plan b", "manager" => "manager b"}})
    end

    it "should ignore if assigned self instance" do
      account.name = "david"
      account.account = account
      account.to_hash.eq ({"name" => "david"})
    end
  end
end

