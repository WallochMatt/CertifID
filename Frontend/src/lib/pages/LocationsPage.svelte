<script>
    import ContextMenu from "../../ContextMenu.svelte";
    import PageHeader from "../PageHeader.svelte";
    import ExpandableRow from "../ExpandableRow.svelte";

    export let groups;
    export let locations;
    export let showModal = false;


    let colors = ["red", "blue", "green", "pink"];
    // ^Placeholder data to be changed with backend

    let showMinis = false;


    let contextMenuX = 0;
    let contextMenuY = 0;
    let isContextMenuVisible = false;
    let selectedItem;

    function handleRightClick(event, item) {
        event.preventDefault();
        contextMenuX = event.clientX;
        contextMenuY = event.clientY;
        selectedItem = item;
        isContextMenuVisible = true;
    };

    function toggleMinis(){
        showMinis = !showMinis;
        console.log();
    };

</script>

<main>
    <PageHeader currentPage = {"Locations & Access Points"}/>
    
    <table class="data-table">
        <thead>
            <tr>
                <th class="checkbox-spacer">
                    <input type="checkbox" /> 
                </th>
                <th>Location({locations.length})</th>
                <th>Address</th>
                <th>Associated Group(s)</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each locations as location}
                <ExpandableRow 
                    city={location.city} state={location.state} address={location.address} zip={location.zip} 
                    children={location.accessPoints}
                    bind:isChecked={location.checked}/>
            {/each}
            {#if isContextMenuVisible}
                <ContextMenu bind:isVisible={isContextMenuVisible} x={contextMenuX} y={contextMenuY} item={selectedItem} />
            {/if}
        </tbody>
    </table>
</main>
