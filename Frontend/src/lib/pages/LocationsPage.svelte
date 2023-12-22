<script>
    import ContextMenu from "../../ContextMenu.svelte";
    import PageHeader from "../PageHeader.svelte";

    export let showModal = false;

    // api call? users will become a request -- title, group and location will likely take a numbered key
    let locations = [{
        "city" : "Milwaukee",
        "state" : "WI",
        "address" : " 777 E Wisconsin Ave, Milwauke, WI 53202",
        "associatedGroup" : "Multiple(PlaceHold)",
        "accessPoints" : 5, //list of Entrance objects, has 1 associateGroup
    }, 
    ];

    let colors = ["red", "blue", "green", "pink"];
    // ^Placeholder data to be changed with backend


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
</script>

<main>
    <PageHeader currentPage = {"Locations & Access Points"}/>
    
    <table class="data-table">
        <thead>
            <tr>
                <th>
                    <input type="checkbox" /> 
                </th>
                <th>Location({locations.length})</th>
                <th>Address</th>
                <th>Associated Group</th>
                <th>Access Points</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each locations as location, index}
                <tr class="listed-item" on:contextmenu={(event) => handleRightClick(event, location)}> 
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td>{location.city}, {location.state}</td>
                    <td>{location.address}</td>
                    <td>{location.associatedGroup}</td>
                    <td>{location.accessPoints}</td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
            {#if isContextMenuVisible}
                <ContextMenu bind:isVisible={isContextMenuVisible} x={contextMenuX} y={contextMenuY} item={selectedItem} />
            {/if}
        </tbody>
    </table>
</main>
