Facter.add(:postgres_role) do
  confine kernel: 'Linux'

  setcode do
    standby_file = '/var/lib/pgsql/standby.signal'
    if File.exist?(standby_file)
      'replica'
    else
      'primary'
    end
  end
end
