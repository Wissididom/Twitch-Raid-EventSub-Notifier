FROM node:26-alpine
WORKDIR /app
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=pnpm-lock.yaml,target=pnpm-lock.yaml \
    npm ci --omit=dev
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
