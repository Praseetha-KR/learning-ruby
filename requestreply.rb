#!/usr/bin/env ruby

#############################################################
#   Application: Client-server blocking I/O (simple-demo)   #
#   Compiler   : Ruby 2.0.0p0                               #
#############################################################

class RequestReply
	attr_accessor :packets

	def initialize(packets = "Anonymous")
		@packets = packets
	end

	def request
		if @packets.nil?
			puts "No packet recieved!"
		elsif @packets.respond_to?("each")
			@packets.each do |packet|
				puts "Request from #{packet}..."
			end
		else
			puts "Request from #{@packets}..."
		end
	end

	def reply
		if @packets.nil?
			puts "No reply send!"
		elsif @packets.respond_to?("join")
			puts "Reply to #{@packets.join(", ")} sent"
		else
			puts "Reply to #{packets} sent\n\n"
		end
	end
end

if __FILE__ == $0
	puts "Client-server blocking I/O demo:\n"
	puts "---------------------------------\n"

	rr = RequestReply.new
	rr.request
	rr.reply

	rr.packets = "imagineer"
	rr.request
	rr.reply

	rr.packets = ["Harry Potter", "Hermione Granger", "Ronald Weasely", "Neville Longbottom", "Ginny Weasely"]
	rr.request
	rr.reply

	rr.packets = nil
	rr.request
	rr.reply
end
			