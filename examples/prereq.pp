$target_file = 'C:/SQLServer2014-x64-ENU.iso'
pget{'GetSQLISO':
  source  => 'http://int-resources.ops.puppetlabs.net/QA_resources/microsoft_sql/iso/SQLServer2014-x64-ENU.iso',
  target  => 'C:/',
  timeout => 10000,
}->
acl{$target_file:
  permissions => [
    {identity => 'Administrators', rights => ['full'] },
    ],
}->
mount_iso{$target_file:
  drive_letter => 'H',
}->
sqlserver_features{'Generic':
  source => 'H:',
  features => ['Tools'],
}
windowsfeature{'VCAC-Preqreq':
  feature_name =>
   ['AS-NET-Framework',
    'NET-HTTP-Activation',
    'WAS-Config-APIs',
    'NET-Non-HTTP-Activ',
    'WAS-Process-Model',
    'Web-Default-Doc',
    'Web-ISAPI-Ext',
    'Web-ISAPI-Filter',
    'Web-Static-Content',
    'Web-Windows-Auth',
    'Web-Asp-Net45',
    'Web-WebServer'],
}
windows_java::jdk{'JDK 7u72':
  install_name => 'Java SE Development Kit 7 Update 72 (64-bit)',
  ensure       => 'present',
  install_path => 'C:\Program Files\Java\jdk1.7.0_72',
  source       => "http://download.oracle.com/otn-pub/java/jdk/7u72-b14/jdk-7u72-windows-x64.exe"
}

