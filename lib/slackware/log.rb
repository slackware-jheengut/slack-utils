# encoding: UTF-8

# Copyright 2012  Vincent Batts, Vienna, VA
# All rights reserved.
#
# Redistribution and use of this source, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this source must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'logger'
require 'singleton'

module Slackware
  # Log is a subclass of Logger, but is implemented as a singleton,
  # so it can be used across library in a somewhat unified manner.
  # Example:
  #   require 'slackware/log'
  #   
  #   slog = Slackware::Log.instance
  #   slog.info("LOG ALL THE THINGS!")
  #   slog.debug('my_app') { ex.backtrace }
  #
  class Log < Logger
    include Singleton

    # Since Singleton does a lazy loader, this will not get initialized
    # until it is first used. So it'll be nil, or you can set $logdev early on.
    # It defaults to WARN level and STDERR
    def initialize(*args)
      if $logdev
        super($logdev, args)
      else
        super(STDERR, args)
      end
      self.level = Logger::ERROR
    end
  end # class Log
end # module Slackware

# vim : set sw=2 sts=2 et :
