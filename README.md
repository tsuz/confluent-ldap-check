# Confluent Pre-flight checks

Set of check lists per Confluent components to validate if configurations are working as expected.

## Modules

- ldap-group-manager

## How to run

Package JAR:

```shell
mvn clean install
```


Start LDAP locally:

```shell
docker-compose up -d
```

Run `LdapGroupManagerPreFlight` from your IDE or use `run-class.sh` to execute the checks.

```shell
export KAFKA_LOG4J_OPTS=-Dlog4j.configuration=file:src/main/resources/log4j.properties
CLASSPATH=target/preflight-check-0.1.0-SNAPSHOT.jar \
  $CONFLUENT_HOME/bin/kafka-run-class io.confluent.security.auth.provider.ldap.LdapGroupManagerPreFlight \
  configs/ldap-group-manager.properties \
  configs/ldap-group-manager.yml
```

output:
```shell
Results:
CheckResult{title="ldap-group-manager: find groups for [cn=alice,ou=it,ou=users,dc=confluent,dc=io]",passed=true}
CheckResult{title="ldap-group-manager: find groups for [cn=charlie,ou=it,ou=users,dc=confluent,dc=io]",passed=false, reason=Not all groups found for User cn=charlie,ou=it,ou=users,dc=confluent,dc=io: Group expected: [ops1] Groups found: [], exception=}
```