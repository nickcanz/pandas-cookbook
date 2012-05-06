%w{ build-essential python-dev cython git python-pip }.each{ |pkg|
  apt_package pkg do
    action :install
  end
}

git "/home/vagrant/pandas_src" do
  repository "git://github.com/pydata/pandas.git"
  reference "master"
  action :sync
end

bash "build and install pandas" do
  cwd "/home/vagrant/pandas_src"
  code <<-EOH
  pip install 'python-dateutil < 2'
  pip install numpy
  python setup.py install
  EOH
end

