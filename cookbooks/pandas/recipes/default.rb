%w{ build-essential python-dev cython git python-pip python-matplotlib python-scipy libzmq1 libzmq-dev }.each{ |pkg|
  apt_package pkg do
    action :install
  end
}

git "/home/vagrant/pandas_src" do
  repository "git://github.com/pydata/pandas.git"
  reference "master"
  action :sync
end

['"python-dateutil < 2"', 'numpy', 'scikits.statsmodels', 'ipython', 'tornado', 'pyzmq' ].each{ |util|
  bash "installing #{util}" do
    cwd '/tmp'
    code <<-EOH
    sudo pip install #{util}
    EOH
  end
}

bash "build and install pandas" do
  cwd "/home/vagrant/pandas_src"
  code <<-EOH
  python setup.py install
  EOH
  not_if "ls /usr/local/lib/python2.7/dist-packages/ | grep pandas"
end

