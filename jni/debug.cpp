#include <stdio.h>
#include <string.h>
#include <openssl/sha.h>
#include <curl/curl.h>


size_t write_callback(void* data, size_t size, size_t nmemb, void* userp) {
    fwrite(data, size, nmemb, stdout);
    return size * nmemb;
}

int main() {
    const char* text = "ทดสอบ OpenSSL";
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((const unsigned char*)text, strlen(text), hash);

    printf("SHA256: ");
    for (int i = 0; i < SHA256_DIGEST_LENGTH; i++)
        printf("%02x", hash[i]);
    printf("\n");

    CURL* curl = curl_easy_init();
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, "https://pastebin.com/raw/Hf5nY0kT");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L); 
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
        curl_easy_perform(curl);
        curl_easy_cleanup(curl);
    } else {
        printf("init curl failed.\n");
    }
    return 0;
}