require 'test_helper'

class Spree::OptionTypeTest < ActiveSupport::TestCase
  context "color metadata" do

    setup do
      @option_type = create(:option_type, name: 'color', presentation: 'Color')
      @option_value = create(:option_value, name: 'red', presentation: 'Red', option_type: @option_type)
    end

    should "updates option value via attributes" do
      @option_type.update_attributes(option_values_attributes: {"0"=>{"name"=>"yellow", "presentation"=>"Yellow", "color"=>"#yellow", "_destroy"=>"false", "id"=> @option_type.id }})
      assert_equal 'yellow', @option_value.reload.name
      assert_equal '#yellow', @option_value.color
    end

    should "updates option value color via attributes" do
      @option_type.update_attributes(option_values_attributes: {"0"=>{"name"=>"red", "presentation"=>"Red", "color"=>"#red", "_destroy"=>"false", "id"=> @option_type.id }})
      assert_equal '#red', @option_value.reload.color
    end

    should "unset option value color via attributes when blank" do
      @option_value.update_attributes color: '#red'
      @option_type.update_attributes(option_values_attributes: {"0"=>{"name"=>"red", "presentation"=>"Red", "color"=>"", "_destroy"=>"false", "id"=> @option_type.id }})
      assert_equal nil, @option_value.reload.color
    end

  end
end