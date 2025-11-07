# Railway Deployment Guide

This guide will help you deploy the Credit Card Fraud Detection application to Railway.

## Prerequisites

1. A Railway account (sign up at [railway.app](https://railway.app))
2. Your project pushed to GitHub/GitLab/Bitbucket
3. Your OpenAI API key (for the explanation feature)

## Step-by-Step Deployment

### 1. Prepare Your Repository

Make sure your code is committed and pushed to a Git repository (GitHub, GitLab, or Bitbucket).

**Important**: Ensure your `models/` directory with the trained models is committed to Git:
- `LogisticRegression_model.pkl`
- `RandomForest_model.pkl`
- `XGBoost_model.pkl`
- `scaler.pkl`

### 2. Create a New Project on Railway

1. Go to [railway.app](https://railway.app) and sign in
2. Click "New Project"
3. Select "Deploy from GitHub repo" (or your Git provider)
4. Choose your repository: `creditCardFraudDetection`

### 3. Configure Environment Variables

In Railway dashboard, go to your project → Variables tab and add:

```
OPENAI_API_KEY=your-openai-api-key-here
FLASK_DEBUG=False
PORT=8080
```

**Note**: Railway automatically provides the `PORT` environment variable, but setting it explicitly won't hurt.

### 4. Configure Build Settings

Railway will automatically detect:
- **Dockerfile** (for Docker-based deployment)
- **Procfile** (alternative deployment method)

Railway will use the `Dockerfile` by default.

### 5. Deploy

1. Railway will automatically start building and deploying
2. Watch the build logs in the Railway dashboard
3. Once deployed, Railway will provide you with a URL (e.g., `https://your-app.railway.app`)

### 6. Access Your Application

Your app will be available at the Railway-provided URL. You can:
- View the dashboard
- Make predictions
- Test the fraud detection models

## Troubleshooting

### Issue: Models not found
**Solution**: Make sure all `.pkl` files in the `models/` directory are committed to Git.

### Issue: Build fails
**Solution**: 
- Check build logs in Railway dashboard
- Ensure `requirements.txt` has all dependencies
- Verify Dockerfile is correct

### Issue: App crashes on startup
**Solution**:
- Check Railway logs
- Verify environment variables are set correctly
- Ensure `OPENAI_API_KEY` is configured

### Issue: Port binding errors
**Solution**: Railway automatically handles PORT - your app already uses `os.environ.get("PORT", 8080)` which is correct.

## Alternative: Deploy Without Docker

If you prefer not to use Docker, Railway can deploy directly using Python:

1. Remove or rename `Dockerfile` temporarily
2. Railway will detect `Procfile` and use it
3. Make sure `Procfile` contains: `web: python app.py`

## Cost Considerations

- Railway offers a free tier with $5 credit per month
- After free tier, pricing is based on usage
- Monitor your usage in the Railway dashboard

## Next Steps

After successful deployment:
1. Test all three models (Logistic Regression, Random Forest, XGBoost)
2. Verify OpenAI explanations are working
3. Share your deployed URL with your team!

---

**Deployment Status**: ✅ Ready for Railway deployment

