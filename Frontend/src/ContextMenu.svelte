

<script>
    export let x;
    export let y;
    export let isVisible = false;
    export let item;

    let editItem = () => alert(`Edit: ${Object.values(item)[0]}`);
    
    let dupeItem = () => alert(`Duplicate: ${Object.values(item)[0]}`);
    
    let removeItem = () => alert(`Removed: ${Object.values(item)[0]}`);
    // Note: These functions will need to change backend data, these alerts are 
    //just to show what the on-screen messages may look like/show some effect

    let menuItems = [
        {
            'name': 'editItem',
            'onClick': editItem,
            'displayText': "Edit",
            'icon': 'font awesome'
        },
        {
            'name': 'duplicateItem',
            'onClick': dupeItem,
            'displayText': "Duplicate",
            'icon': 'font awesome'
        },
        // {
        //     'name': 'hr',   
        // },
        {
            'name': 'trash',
            'onClick': removeItem,
            'displayText': "Remove",
            'icon': 'font awesome'
        },
    ];
</script>

{#if isVisible}
    <div style="top: {y}px; left: {x}px; " class="context-menu">
        <nav class="context-nav" id="context-nav">
            <ul>
                {#each menuItems as item}
                    {#if item.name == "hr"}
                    <!-- For separating sections: 'name': 'hr',  as commented out above -->
                        <hr>
                    {:else}
                        <li><button on:click={item.onClick}><i class={item.class}></i>{item.displayText}</button></li>
                    {/if}
                {/each}
            </ul>
        </nav>
    </div>
{/if}

<svelte:window on:click={() => isVisible = false} />

<style>
    hr{
        border: none;
        border-bottom: 1px solid #ccc;
        margin: 5px 0px;
    }
</style>