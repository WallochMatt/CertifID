<script>
    // api call? users will become a request -- title, group and location will likely take a numbered key
    let locations = [{
        "city" : "Milwaukee",
        "state" : "WI",
        "address" : " 777 E Wisconsin Ave, Milwauke, WI 53202",
        "associatedGroup" : "Multiple(PlaceHold)",
        "accessPoints" : 5, //list of Entrance objects, has 1 associateGroup
    }, 
    ];
</script>

<main>
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
                <tr> 
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
        </tbody>
    </table>
</main>

