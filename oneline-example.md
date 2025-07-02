# stdin
```bash
echo -n ok | node --input-type=module -e 'const buffers=[]; for await (const chunk of process.stdin) {buffers.push(chunk)} const buffer=Buffer.concat(buffers).toString(); console.log(buffer);'
```
