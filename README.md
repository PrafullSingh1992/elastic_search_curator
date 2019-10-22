This image will periodically run [elasticsearch-curator](https://www.elastic.co/guide/en/elasticsearch/client/curator/5.0/about.html).

### Configuration Environment Variables

* **PERIOD** : defines period (in seconds) between runs of curator; default is 86400 seconds (1 day)
* **ES_HOST** : defines the hostname of the Elasticsearch node to contact; default is master
* **DELETE_AGE** : defines what age (and older) of indices will be deleted; defaul is 45

### Configuration filters

The image comes with basic, but functional, configuration files that utilize
the environment variables above. The actions configuraion will delete indices
that are prefixed with "logstash-" or "metricbeat-" that are older than
`$DELETE_AGE`.

The configuration files are:

* **/etc/curator/config.yml**
* **/etc/curator/actions.yml**

One or both may be replaced by extending images or with `-v` attachment over
the directory or file.
