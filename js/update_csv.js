function uploadToGitHub() {
    const GITHUB_USERNAME = "JohnBummit";
    const GITHUB_REPO = "Twitter_Song_DB";
    const FILE_NAME = "music_data.json"; // Name of the file to create/update in the repo
    const GITHUB_TOKEN = "Your github token";

    const sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
    const data = sheet.getDataRange().getValues();
    const jsonData = JSON.stringify(data);

    const url = `https://api.github.com/repos/${GITHUB_USERNAME}/${GITHUB_REPO}/contents/${FILE_NAME}`;
    const payload = {
        message: "Update data from Google Sheets",
        content: Utilities.base64Encode(jsonData)
    };

    const options = {
        method: "PUT",
        headers: {
            Authorization: `token ${GITHUB_TOKEN}`
        },
        payload: JSON.stringify(payload)
    };

    const response = UrlFetchApp.fetch(url, options);
    Logger.log(response.getContentText());
}
