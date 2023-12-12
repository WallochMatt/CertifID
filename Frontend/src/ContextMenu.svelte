<script>
    //NOTE: Add in Font Awesome later
    let position = { x: 0, y: 0 };

    let menu = { w: 0, h: 0 };

    let browser = { w: 0, h: 0 };

    let showMenu = false;
    
    let content;

    function rightClickContextMenu(e){
        showMenu = true;
        browser = {
            w: window.innerWidth,
            h: window.innerHeight
        };

        position = {
            x: e.clientX,
            y: e.clientY
        };
    }


    function offMenuClick(e){
        showMenu  = false;
    }

    function getContextMenuDimension(node){
        let height = node.offsetHeight;
        let width = node.offWidth;
        menu = {
            h: height,
            w: width
        }
    }

    function addItem(){
        content.textContent = "Add and item..."
    }
    function editItem(){
        content.textContent = "Printed..."
    }
    function removeItem(){
        content.textContent = "Removed..."
    }
    function setting(){
        content.textContent = "Settings..."
    }

    let menuItems = [
        {
            'name': 'addItem',
            'onClick': addItem,
            'displayText': "Add Item",
            'icon': 'font awesome'
        },
        {
            'name': 'addItem',
            'onClick': editItem,
            'displayText': "Edit Item",
            'icon': 'font awesome'
        },
        {
            'name': 'trash',
            'onClick': removeItem,
            'displayText': "Delete",
            'icon': 'font awesome'
        },
    ]
</script>


<style>
    * {
        padding: 0;
        margin: 0;
    }
    .navbar{
        display: inline-flex;
        border: 1px #999 solid;
        width: 170px;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        flex-direction: column;
    }
    .navbar ul{
        margin: 6px;
    }
    ul li{
        display: block;
        list-style-type: none;
        width: 1fr;
    }
    ul li button{
        font-size: 1rem;
        color: #222;
        width: 100%;
        height: 30px;
        text-align: left;
        border: 0px;
        background-color: #fff;
    }
    ul li button:hover{
        color: #000;
        text-align: left;
        border-radius: 5px;
        background-color: #eee;
    }
    ul li button i{
        padding: 0px 15px 0px 10px;
    }
    ul li button i.fa-square{
        color: #fff;
    }
    ul li button:hover > i.fa-square{
        color: #eee;
    }
    ul li button:hover > i.warning{
        color: crimson;
    }
    :global(ul li button.info:hover){
        color: navy;
    }
    hr{
        border: none;
        border-bottom: 1px solid #ccc;
        margin: 5px 0px;
    }
</style>



{#if showMenu}
<nav use:getContextMenuDimension style="position: absolute; top:{position.y}px; left:{position.x}px">
    <div class="navbar" id="navbar">
        <ul>
            {#each menuItems as item}
                {#if item.name == "hr"}
                    <hr>
                {:else}
                    <li><button on:click={item.onClick}><i class={item.class}></i>{item.displayText}</button></li>
                {/if}
            {/each}
        </ul>
    </div>
</nav>
{/if}

<svelte:window on:contextmenu|preventDefault={rightClickContextMenu} 
on:click={offMenuClick} />