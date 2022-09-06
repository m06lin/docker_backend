FROM node:lts
# 使用最後一版 node docker image

RUN mkdir /website 
# 建立一個 /website 來放置檔案

WORKDIR /website 
# 將初始工作環境設置在 /website

COPY package.json /website 
# 將本機 website 拷貝到 image /website 中

COPY server.js /website 

RUN npm install 
# 跑一次 npm install

EXPOSE 8080

# CMD ["npm", "run", "start"] 
CMD ["node", "server.js"]
# 啟動伺服器 npm run start