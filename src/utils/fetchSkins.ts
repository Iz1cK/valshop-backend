import axios from "axios";

export const fetchSkins = async () => {
  let include: string[] = [];
  let finalData: { gunid: string; gunname: string }[] = [];
  (
    await axios
      .get("https://valorant-api.com/v1/weapons/skinlevels")
      .then(({ data }) => data.data)
  )
    .map((gun) => {
      return { gunid: gun.uuid, gunname: gun.displayName.split(" Level")[0] };
    })
    .forEach((gun: { gunid: string; gunname: string }) => {
      if (!include.includes(gun.gunname)) {
        finalData.push(gun);
        include.push(gun.gunname);
      }
    });
  console.log(finalData);
};

fetchSkins();
