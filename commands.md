## Commands

Build the image

```
./build_with_env.sh
```

Run the image

```
export $(cat env | xargs) && docker-compose up
```
