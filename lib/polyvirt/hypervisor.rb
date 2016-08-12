#!/usr/bin/env ruby

require 'libvirt'

class Hypervisor
  # Class methods
  @@count = 0
  def self.count()
    @@count
  end

  # Instance methods
  def initialize(name)
    @name = name
    @uri = "qemu+ssh://elsa@#{name}/system?socket=/run/libvirt/libvirt-sock"
    reopen
    @nodeinfo = @conn.node_get_info
    @@count += 1
  end
  def reopen
    if @conn == nil or @conn.closed?
      @conn = Libvirt::open(@uri)
    end
  end
  def name
    @name
  end
  def freememory
    @conn.node_free_memory
  end
  def model
    @nodeinfo.model
  end
  def memory
    @nodeinfo.memory
  end
  def cpus
    @nodeinfo.cpus
  end
  def mhz
    @nodeinfo.mhz
  end
  def numanodes
    @nodeinfo.nodes
  end
  def sockets
    @nodeinfo.sockets
  end
  def cores
    @nodeinfo.cores
  end
  def threads
    @nodeinfo.threads
  end
  def active_domain_ids
    reopen
    @conn.list_domains
  end
  def active_domain_names
    active_domain_ids.map{|d| @conn.lookup_domain_by_id(d).name}
  end
  def inactive_domain_names
    reopen
    @conn.list_defined_domains
  end

end
