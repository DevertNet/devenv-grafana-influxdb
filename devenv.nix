{ pkgs, lib, config, inputs, ... }:

{
  env.INFLUXD_ENGINE_PATH = "${toString (config.env.DEVENV_STATE)}/influxdbv2/engine";
  env.INFLUXD_BOLT_PATH = "${toString (config.env.DEVENV_STATE)}/influxdbv2/influxd.bolt";

  packages = [ 
    pkgs.git
    pkgs.grafana
    pkgs.influxdb2
  ];

  processes.influxdb.exec = "influxd";
  processes.influxdbsetup = {
    exec = (pkgs.writeShellScript "complex-process" ''
        PATH="${lib.makeBinPath [ pkgs.coreutils ]}:$PATH"

        while ! influx ping | grep -q "OK"; do sleep 1; done

        influx setup \
        --username admin \
        --password influxdb \
        --token "1QNm2IeLFILnRemdGjgAo2e38gwW95rVmaypwRaMTkVrAHKrEqf3NmS7k1D090WQ-MpdgCL5AlBS6Ax4X4uemg==" \
        --org predict \
        --bucket predict \
        --force
    '').outPath;
  };

  processes.grafana.exec = ''
    grafana server --homepath=${pkgs.grafana}/share/grafana \
    --configOverrides "cfg:default.paths.logs=${toString (config.env.DEVENV_STATE)}/grafana/data/log \
    cfg:default.paths.data=${toString (config.env.DEVENV_STATE)}/grafana/data \
    cfg:default.paths.plugins=${toString (config.env.DEVENV_STATE)}/grafana/data/plugins \
    cfg:default.paths.provisioning=${toString (config.env.DEVENV_STATE)}/grafana/conf/provisioning"
  '';
}
