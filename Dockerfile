FROM node:16.14.0-alpine as build

WORKDIR /app

# Copy package.json files

COPY modules/api/package.json modules/api/
COPY modules/console/package.json modules/console/

# Run npm install

RUN npm install --prefix modules/api --verbose
RUN npm install --prefix modules/console --verbose

# RUN npm set cache-min 9999999
# RUN --mount=type=cache,id=npm,target=/root/.npm npm install --verbose

COPY . .

####

FROM node:16.14.0-alpine as dev

WORKDIR /app

COPY --from=build /app /app

CMD (cd modules/console && npm run dev) & (cd modules/api && npm run dev)

####

FROM node:16.14.0-alpine as prod

WORKDIR /app

COPY --from=build /app /app

RUN cd modules/console && npm run build

CMD (cd modules/console && npm run start) & (cd modules/api && npm start)