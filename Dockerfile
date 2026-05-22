FROM ghcr.io/pnpm/pnpm:latest
RUN pnpm runtime set node lts
WORKDIR /app
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=pnpm-lock.yaml,target=pnpm-lock.yaml \
    pnpm ci --prod
COPY . .
EXPOSE 3000
CMD ["pnpm", "start"]
