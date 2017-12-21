# Desafio de programação 1

Para testar:

```

rails db:create
rails db:migrate
rails db:seed
rails s

```

Endpoints:


### Adicionar um produto ao carrinho.
Utilizar o UUID: `4ea9dca7-1f51-4f5d-8e54-336bb11974b9` no header `USER-UUID` para testar

```
POST: http://localhost:3000/api/v1/cart/add
.
Request Headers:
{
    'Content-Type': 'application/json',
    'USER-UUID': '4ea9dca7-1f51-4f5d-8e54-336bb11974b9'
}
.
Request Body:
{
    "requested_quantity": 1,
    "requested_beer_id": 15
}
.
Response Body: (200 OK)
{
    "success": true,
    "cart_id": 1
}
```

Caso adicione o mesmo produto repetidas vezes, ele não irá se repetir no carrinho, somente o atributo referente
a quantidade de items adicionados ao carrinho que será modificado (**incrementando**).

### Remover um produto do carrinho

```
POST: http://localhost:3000/api/v1/cart/remove
.
Request Headers:
{
    'Content-Type': 'application/json',
    'USER-UUID': '???'
}
.
Request Body:
{
    "requested_beer_id": 15,
    "cart_id": 1
}
.
Response Body: (200 OK)
{
    "success": true,
    "cart_was_canceled": false
}
```

Se todos os produtos de um carrinho forem removidos, este carrinho será **cancelado**, e um nov
carrinho será gerado. Desta forma, futuramente poderá ser desenvolvido uma métrica 
informando, quais usuários 'fecharam' ou desistiram de comprar os produtos que foram adicionados ao carrinho cancelado, e quais produtos
este usuário desistiu de comprar.

Lembrando que um produto após ser removido, ele não é 'removido' do carrinho, ele apenas recebe uma *flag* que foi removido.

### Consultar o carrinho
Só será possível consultar um carrinho, após adicionar um produto ao mesmo.

```
GET: http://localhost:3000/api/v1/cart/:id
.
Request Headers:
{
    'USER-UUID': '???'
}
.
Path params
:id => ID do carrinho // Pode utilizar o ID do carrinho presente no corpo da resposta do cart#ad
.
Response Body:
{
    "success": true,
    "cart": {
        "created_at": "21/12/2017 - 02:31",
        "updated_at": "21/12/2017 - 02:31",
        "status": "open",
        "id": 1,
        "items": [
            {
                "requested_quantity": 1,
                "removed": true,
                "created_at": "21/12/2017 - 02:31",
                "updated_at": "21/12/2017 - 02:32",
                "beer": {
                    "alcohol": "4,1%",
                    "price": "$ 211.2",
                    "malts": "Roasted barley",
                    "name": "Trois Pistoles"
                }
            },
            {
                "requested_quantity": 1,
                "removed": false,
                "created_at": "21/12/2017 - 02:31",
                "updated_at": "21/12/2017 - 02:31",
                "beer": {
                    "alcohol": "8,9%",
                    "price": "$ 185.9",
                    "malts": "Carapils",
                    "name": "Brooklyn Black"
                }
            }
        ]
    }
}
```
