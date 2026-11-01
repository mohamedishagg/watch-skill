---
name: watch
description: Watch a video from a link (Instagram reels/posts, TikTok, YouTube, X, anything yt-dlp supports). Use when the user pastes a video link and wants it watched, summarized, copied for style, or analysed ("watch this", "look at this reel", "what's in this video").
---

# watch — see a video from a link

The user gives a link; you run one command and then actually look at the result.

1. Run (quote the link — zsh treats `?` and `&` as special):

   ```bash
   watch '<link>'
   ```

   It downloads the video, then prints a report: who posted it, the caption, length, counts, the **spoken words with timestamps**, and the paths of **contact sheets** (`sheet_1.jpg`, …) and full-size frames.
2. **Read the contact sheet image(s)** with the Read tool — that is how you see the video. Each tile is stamped with its timestamp. If a moment matters, read the matching file in `frames/` (file name = seconds × 100), or re-run with `--at 3.2 7.5` to pull exact moments.
3. Answer from the caption + transcript + frames together. Say what you could not see (a video with no speech, a few sampled frames) instead of guessing between them.

Options: `--frames 36` for more frames, `--at <seconds…>` for exact full-size frames, `--no-transcript`, `--cookies chrome` (or safari/firefox/brave/edge).

## Instagram

Instagram often refuses logged-out downloads, even for public reels. If the command says it wants a login, ask the user to be signed in to Instagram in their browser and re-run with `--cookies chrome` (or whichever browser). Cookies are read locally by yt-dlp and never leave the Mac. Never ask the user for their Instagram password.

Private accounts only work if the signed-in account follows them. Stories and some carousels may return only one slide.

## Always delete when done

Downloaded videos can fill a disk fast, so **delete the video once you have finished with it.** When you have answered, or finished whatever you were building from it, run:

```bash
watch --clean
```

That removes the video, the frames and the report. Do it as soon as you no longer need the frames (not before — you may want `--at` frames while working). If you used it for an edit that still needs the file, delete it the moment that work is done.
