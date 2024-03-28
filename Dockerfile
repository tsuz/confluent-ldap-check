#
# Build stage
#
FROM maven:3.8.3-openjdk-17 AS build
COPY src /home/app/src
COPY docker-entrypoint.sh /home/app
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN chmod +x /home/app/docker-entrypoint.sh


# ENV verifier_type verifier_type
# ENV ldap_java_naming_provider_url ldap_java_naming_provider_url
# ENV ldap_java_naming_security_principal ldap_java_naming_security_principal
# ENV ldap_java_naming_security_credentials ldap_java_naming_security_credentials
# ENV ldap_java_naming_security_authentication ldap_java_naming_security_authentication
# ENV ldap_search_mode ldap_search_mode
# ENV ldap_group_search_scope ldap_group_search_scope
# ENV ldap_group_search_base ldap_group_search_base
# ENV ldap_group_object_class ldap_group_object_class
# ENV ldap_group_name_attribute ldap_group_name_attribute
# ENV ldap_group_member_attribute_pattern ldap_group_member_attribute_pattern
# ENV ldap_group_member_attribute ldap_group_member_attribute
# ENV ldap_user_search_scope ldap_user_search_scope
# ENV ldap_user_search_base ldap_user_search_base
# ENV ldap_user_object_class ldap_user_object_class
# ENV ldap_user_name_attribute ldap_user_name_attribute

ENTRYPOINT [ "/home/app/docker-entrypoint.sh" ]

#
# Package stage
#
# FROM openjdk:11-jre-slim
# COPY --from=build /home/app/target/confluent-ldap-check-1.0.0.jar /usr/local/lib/demo.jar
# COPY --from=build /home/app/docker-entrypoint.sh /usr/local/lib/docker-entrypoint.sh
# ARG kind
# ENV kind_var=$kind
# EXPOSE 8080
# ENTRYPOINT [ "/usr/local/lib/docker-entrypoint.sh" ]
# ENTRYPOINT ["java","-cp","/usr/local/lib/demo.jar"]