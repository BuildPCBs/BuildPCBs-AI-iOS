# GitHub Actions Setup Guide

This repository has automated notifications set up for X (Twitter) and Telegram when you push to GitHub.

## Required GitHub Secrets

You need to add these secrets to your GitHub repository:

### For X (Twitter) Integration

1. Go to https://github.com/BuildPCBs/BuildPCBs-AI-iOS/settings/secrets/actions
2. Click "New repository secret" and add each of these:

- `TWITTER_API_KEY` - Your X API Key
- `TWITTER_API_SECRET` - Your X API Secret
- `TWITTER_ACCESS_TOKEN` - Your X Access Token
- `TWITTER_ACCESS_SECRET` - Your X Access Token Secret

**To get X API credentials:**

1. Go to https://developer.twitter.com/en/portal/dashboard
2. Create a new app or use existing one
3. Enable "Read and Write" permissions
4. Generate API keys and access tokens

### For Telegram Integration

Add these secrets:

- `TELEGRAM_BOT_TOKEN` - Your Telegram bot token
- `TELEGRAM_CHAT_ID` - Your Telegram chat/channel ID

**To get Telegram credentials:**

1. **Create a bot:**

   - Open Telegram and search for `@BotFather`
   - Send `/newbot` and follow instructions
   - Copy the bot token (looks like: `123456789:ABCdefGHIjklMNOpqrsTUVwxyz`)

2. **Get your chat ID:**
   - Add your bot to a group/channel, or message it directly
   - Visit: `https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates`
   - Find your chat ID in the response (looks like: `123456789` or `-123456789`)

## What Happens

When you push to the `main` or `develop` branch:

1. **X Post:** Automatically tweets:

   ```
   🚀 BuildPCBs Update!

   New commit to BuildPCBs-AI-iOS

   📝 [Your commit message]
   👤 by [Your name]

   🔗 [Link to commit]

   #BuildPCBs #AI #Hardware #Web3
   ```

2. **Telegram Message:** Sends notification to your Telegram chat/channel with the same info

## Testing

Once you've added the secrets:

1. Make a small change to the repo
2. Push to main or develop
3. Check the Actions tab: https://github.com/BuildPCBs/BuildPCBs-AI-iOS/actions
4. Verify the notification appears on X and Telegram

## Customization

Edit `.github/workflows/notify-on-push.yml` to:

- Change which branches trigger notifications
- Customize the message format
- Add more notification channels
- Filter which commits trigger notifications

## Troubleshooting

If notifications don't work:

1. Check GitHub Actions logs for errors
2. Verify all secrets are correctly added
3. Ensure X app has "Read and Write" permissions
4. Verify Telegram bot is added to the chat/channel
