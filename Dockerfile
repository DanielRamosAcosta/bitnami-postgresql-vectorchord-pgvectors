FROM pgvector/pgvector:pg17 AS builder_vector
FROM tensorchord/vchord-postgres:pg17-v0.4.3 AS builder_vchord

FROM bitnami/postgresql:17.5.0-debian-12-r16

# Copiar pgvector
COPY --from=builder_vector /usr/lib/postgresql/17/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder_vector /usr/share/postgresql/17/extension/vector* /opt/bitnami/postgresql/share/extension/

# Copiar vchord
COPY --from=builder_vchord /usr/lib/postgresql/17/lib/vchord.so /opt/bitnami/postgresql/lib/
COPY --from=builder_vchord /usr/share/postgresql/17/extension/vchord* /opt/bitnami/postgresql/share/extension/

