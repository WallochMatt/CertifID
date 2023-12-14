<!-- Users need: last name, firstname, location group, title -->

<script>
    import ContextMenu from "../../ContextMenu.svelte";

    // api call? users will become a request -- title, group and location will likely take a numbered key
    let users = [{
        "firstName" : "Chad",
        "lastName" : "Gouin",
        "location" : "Hales Corners",
        "group" : 1,
        "title" : "Technician",
        "image" : null,
    }, 
    {
        "firstName" : "Chris",
        "lastName" : "Haliga",
        "location" : "Milwaukee",
        "group" : 1,
        "title" : "Software Engineer II",
        "image" : null,
    }
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
    <table class="data-table">
        <thead>
            <tr>
                <th>
                    <input type="checkbox" /> <!--bind to all users? -->
                </th>
                <th>Users({users.length})</th>
                <th>Locations()</th>
                <th>Groups()</th>
                <th>Title</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each users as user, index}
                <tr class="listed-user" on:contextmenu={(event) => handleRightClick(event, user)}> 
                    <td>
                        <input type="checkbox" /> <!--bind to user? -->
                    </td>
                    <td style="display: inline-flex;">

                        <!-- Come back to this with actual images -->
                        <button type="button" class="profile" style="background-color: {colors[index]}">
                            {#if user.image === null}
                                {user.firstName[0]}{user.lastName[0]}
                            {:else}
                                <img src="-{user.image}" alt="-{user.firstName}'s Profile Picture"/>
                            {/if}
                        </button>

                        <p>{user.lastName} , {user.firstName}</p>
                    </td>
                    <td>{user.location}</td>
                    <td>{user.group}</td>
                    <td>{user.title}</td>
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


