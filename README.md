# Home_Server

My home server includes some features like, video streaming, ddns with cloudflare, network level ad-blocker, and a organizer to see everything in the same place

# Streaming Service

## QbitTorrent

First of all i configure qbittorrent ( Downloader ), in genereal its a simple configuration, you should only change some of configs in **tools** to relocate automatically, adjust the trackers to reannounce and change the port ( you can randomize, only remember to reload docker opening the specified port

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c27ca5b1-0421-4caa-9447-9f1b69e9a6ac" width="100%"></td>
    <td><img src="https://github.com/user-attachments/assets/5afe3a41-ddb4-4f0a-898c-75f957e371e0" width="100%"></td>
    <td><img src="https://github.com/user-attachments/assets/f25a8af4-979b-4b78-8eda-88cf31c98975" width="100%"></td>
  </tr>
</table>

## Sonarr & Radarr

Sonnarr and Radarr are basically the engines to search series ( Sonarr ) and movies ( Radarr ), the configurations are simple and almost identical, you have only to fill out the form and configure the download client with the qbittorrent data ( obs: i defined the folders in docker compose, you should change it to your own configs )

![image](https://github.com/user-attachments/assets/e2e7ef73-9bff-41f9-8568-2efb8592aff3)

## Prowlarr

This guy right here is the responsible for almost everything related to indexers, the initial config is very similar to the arr's, just fill out the forms, but in prowlar we need to go in apps area and connect with the arr's ( the api key is located in general of each arr ) and add your indexers, and before you ask: no, i don't know any indexer. Oh, I've added a flaresolverr container to help y'all to skip some cloudflare verifications

![image](https://github.com/user-attachments/assets/339444db-6fee-4976-ac23-c6a4f6c04d29)

## Plex

Plex is basically a media player, as you can see in compose the plex folders are synced with sonarr and radarr folders, only fill out the forms and you will be good, if you want different media players for this type of application you should see jellyfin and jellyseer ( if you're trying to use plex and cannot access try typing the ip:port/manage )

![image](https://github.com/user-attachments/assets/e6d2f82f-a469-4a3c-9fbb-093cb501db3c)

## Overseer

Okay, now we have the search engines, media player, downloader but it's just too simple, we don't have any movie catalogue with sinopsis and everything else, so to do this we add overseer to the compose, overseer is the responsible for doing it all, just connect with the other containeres do preety much of the same, and voila, we have a full application to see our movies and series, if you want to stream while downloading just adjust the download to prioritize the first pieces and make shure that your arr app is listening to incomplete files

![image](https://github.com/user-attachments/assets/1ca3c272-828e-41cb-aa82-1efd649de207)

# Network Level Add-Blocker

## Pihole

Pihole is a network level add blocker, its a bit simple, you just have to configure it and add to your own router as a dns

# Dynamic Domain Name System

## Configuration

Its just a simple .sh script that uses your cloudflare api to change the ip linked to your domain

# Organizer

Organizer is a simple tool to organize all the links in one page, its simple to configure and depends on your own, so, try it!

![image](https://github.com/user-attachments/assets/40d3d2ed-2acb-449a-833b-c57cff53a385)

