#!/usr/bin/env ruby

$:.insert(0, File.expand_path(File.dirname(File.expand_path(__FILE__)) + "/../lib/"))

require 'test/unit'
require 'slackware/log'

def log(msg)
    Slackware::Log.instance.info(File.basename(__FILE__)) { msg }
end

class TestVersion < Test::Unit::TestCase
  def setup
    @root_prev = ENV["ROOT"]
    ENV["ROOT"] = File.join(File.dirname(File.expand_path(__FILE__)), 'samples')
    log( "ROOT: #{ENV["ROOT"]} ")
  end
  def teardown
    ENV["ROOT"] = @root_prev
  end

  def test_version
    # sticking it here, so that the variable is setup *after* the ROOT environment is declared
    require 'slackware/version'
    a = Slackware::SLACKWARE_VERSION
    log(a)
    assert_equal("13.37.314159", a, "the version of slackware deduced, does not match")
  end
end

# vim : set sw=2 sts=2 et :
