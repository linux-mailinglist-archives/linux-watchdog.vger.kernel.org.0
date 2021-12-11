Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7D471724
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 23:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhLKW0A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 17:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhLKW0A (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 17:26:00 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A0EC061714;
        Sat, 11 Dec 2021 14:26:00 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso13351101otf.12;
        Sat, 11 Dec 2021 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OX+mKtiZUzK8Porib1AcYmE4TJG7CjsggDCcDMGdQrk=;
        b=mCdD/9RNyfEPbC0EwkyW4RLUELkgn4wu+r+wCrlfWMpTJ1NL0BDZwqqf3Ozps2+4FS
         bzEsuq7FtF4tIfZBkFPbNgdJ6L2XtQF8JfpViY1O3d2dIsBHLmlqJ1SS1kRFjEcl1Dcu
         kbtCjnKljsWvKy6sThHgmZhfq5lU1o8sSivVTLb40WLpGoYCtWsSmHcIIJXSmZddK79p
         fh2IxP/gh4YX0teNxdc2cH1MQd5eUB1p2QD1hjXCAPZIPXlHGRzYl1gyHy90PSbkirAX
         5wnO8np6ziYMJpAnN89moYyaOHgYdg33RbMi3ZNlLzyhso5Arh/yhMzATuwsItPCmCIZ
         YClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OX+mKtiZUzK8Porib1AcYmE4TJG7CjsggDCcDMGdQrk=;
        b=oU3dq0600U4riQgJBQ2ZkhgbJBDYdJh/+fx3t0YN7hMl7bqA/6gECXTgmJ7C2ofjWz
         RhhSBXxDnXB+zhCz5IRRhLHqNs+7cbPQo0KZduPRP+DGsu+b1rC2jhC7fNoCQdm4qSfb
         9Y4l0msPeXkyH7Fi0QptlxjOFzNhlpcvOkfjE2oKEG75RztDf1Sf+PCC802/aVD9u8JH
         SgedBXapGIIpRR8gSD7khpjfIQsIl9Ry4XYtm1z9G4FPplDVhTCRMLlJyMtDNXD72uPl
         z0hDQWCgyNtICHRiODoxfp9ggr5NCqkQvEnk/nIOaOZTr7/eQWVMtc0ihJkW6l3OFYL/
         ZAhw==
X-Gm-Message-State: AOAM530AtdhvigShV4N9j2XWo17tMlFxyPXc7FZYNmln+7ICRDiOntan
        lYkqwEHXavv90vTGixIRTws1sFaXj4A=
X-Google-Smtp-Source: ABdhPJyGcv2YKK3r6MK5MMN1FOoo4S2/55ujqK9ZFhv8yhw8RS04Fgu0SpGJyt/xctdBXQlOatujgw==
X-Received: by 2002:a9d:744f:: with SMTP id p15mr17348158otk.314.1639261559090;
        Sat, 11 Dec 2021 14:25:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p14sm1370232oou.31.2021.12.11.14.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 14:25:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-2-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <960186bd-8ac8-42d8-edba-90c81eadfac1@roeck-us.net>
Date:   Sat, 11 Dec 2021 14:25:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211212617.19639-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/21 1:26 PM, Biju Das wrote:
> If reset_control_deassert()/reset_control_reset() fails, then we
> won't be able to access the device registers. Therefore check the
> return code of reset_control_deassert()/reset_control_reset() and
> return the error code to caller in case of error.
> 
> While at it remove the unnecessary pm_runtime_resume_and_get()
> from probe(), as it turns on the clocks.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

See note below, though.

> ---
>   drivers/watchdog/rzg2l_wdt.c | 37 +++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 96f2a018ab62..58fe4efd9a89 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -85,8 +85,14 @@ static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
>   static int rzg2l_wdt_start(struct watchdog_device *wdev)
>   {
>   	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret) {
> +		dev_err(wdev->parent, "failed to deassert");
> +		return ret;
> +	}
>   
This patch introduces an error return into rzg2l_wdt_start().
If it is indeed necessary to call this function when setting
the timeout, the error return needs to be checked there.

Guenter

> -	reset_control_deassert(priv->rstc);
>   	pm_runtime_get_sync(wdev->parent);
>   
>   	/* Initialize time out */
> @@ -115,9 +121,15 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>   			     unsigned long action, void *data)
>   {
>   	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
>   
>   	/* Reset the module before we modify any register */
> -	reset_control_reset(priv->rstc);
> +	ret = reset_control_reset(priv->rstc);
> +	if (ret) {
> +		dev_err(wdev->parent, "failed to reset");
> +		return ret;
> +	}
> +
>   	pm_runtime_get_sync(wdev->parent);
>   
>   	/* smallest counter value to reboot soon */
> @@ -151,12 +163,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
>   	.restart = rzg2l_wdt_restart,
>   };
>   
> -static void rzg2l_wdt_reset_assert_pm_disable_put(void *data)
> +static void rzg2l_wdt_reset_assert_pm_disable(void *data)
>   {
>   	struct watchdog_device *wdev = data;
>   	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>   
> -	pm_runtime_put(wdev->parent);
>   	pm_runtime_disable(wdev->parent);
>   	reset_control_assert(priv->rstc);
>   }
> @@ -204,13 +215,11 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
>   				     "failed to get cpg reset");
>   
> -	reset_control_deassert(priv->rstc);
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert");
> +
>   	pm_runtime_enable(&pdev->dev);
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret < 0) {
> -		dev_err(dev, "pm_runtime_resume_and_get failed ret=%pe", ERR_PTR(ret));
> -		goto out_pm_get;
> -	}
>   
>   	priv->wdev.info = &rzg2l_wdt_ident;
>   	priv->wdev.ops = &rzg2l_wdt_ops;
> @@ -222,7 +231,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>   
>   	watchdog_set_drvdata(&priv->wdev, priv);
>   	ret = devm_add_action_or_reset(&pdev->dev,
> -				       rzg2l_wdt_reset_assert_pm_disable_put,
> +				       rzg2l_wdt_reset_assert_pm_disable,
>   				       &priv->wdev);
>   	if (ret < 0)
>   		return ret;
> @@ -235,12 +244,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>   		dev_warn(dev, "Specified timeout invalid, using default");
>   
>   	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> -
> -out_pm_get:
> -	pm_runtime_disable(dev);
> -	reset_control_assert(priv->rstc);
> -
> -	return ret;
>   }
>   
>   static const struct of_device_id rzg2l_wdt_ids[] = {
> 

