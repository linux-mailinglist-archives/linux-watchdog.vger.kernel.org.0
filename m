Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E50261CB5
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 21:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732018AbgIHTZ0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Sep 2020 15:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731081AbgIHQAn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Sep 2020 12:00:43 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F208BC061A1A;
        Tue,  8 Sep 2020 07:07:41 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id c10so14913154otm.13;
        Tue, 08 Sep 2020 07:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DILJcZjpTuCBnwPDDLNvyTFD5CoE9GNhgHdbL48gtl4=;
        b=F7FMJTCncBqbxKoFICGeDj9Peb9aYNWF8ivFc+je5E9LJKg1K0w/TLP/P2O63d+gyA
         WrM8nlwCcVlcpqilq6T6O7rGGsuyiBoBqWQls3p6ueHQA3cQRbMDglwKlWQ6+nvBb7bX
         JiTjodGLzflNoTCNB0dlHMd8oWDvdKSFHzzfwgZGphNmUmVUh6yqMOpfXEfheWQYMv+M
         pVZEpMYcM3qmSw3qtEwVn5rbIMYZEKhebOWGLnCpQ7JauFy3nixv+iUH1yTY2nVGbgjy
         NCjZ7/zVu85GSi9Wu7iYdfRQ8zCgus5sN2//4gK5j9/7lOgnZyPMkR9/hViJaklOwjNj
         Z4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DILJcZjpTuCBnwPDDLNvyTFD5CoE9GNhgHdbL48gtl4=;
        b=hMXzyUW8c+Mp+hyh8CoedBikAWIH02bPYvDEyz5YfIKaYQHdK2XnUblbtyMnYioSjE
         AVzGvpH9H9RCYgsEcOPovv3BuKHRQaOk3UwRRAnRCg/uLv5GBIbydl5L6VxPn7t18zf2
         pxk6S3H1Bj+RBLARzoYVVZifcD+BK/Eru9yUfM1xB5J1zENBFIVz0DMPzb8XuwQateK8
         eIvjxmfcB62j7fOjsOQyNva3c0mm0G1jCvChl2bf15rEm1wKuX2+LURhQ7EOGvekKpe1
         zOeOfsss49snecEiWw3T35uR3wBL+RBYLcUftD32IH3BEdvHwrVVF7jT52JG41AHx9DO
         zdaQ==
X-Gm-Message-State: AOAM533b2ipV3TxgjlAGoAsRMq7aT7swSZIwA1vEcjynUq42BOlLjdnW
        YRQy56V6SMW5UtpaKEgoYn8=
X-Google-Smtp-Source: ABdhPJwpJQ+O+wGfw2GBxMoyE5PxwIvPkUxhxXlGgV0IfoVmN9zgp5uWtL7QxqNyxc4dSuAUrsRbkg==
X-Received: by 2002:a9d:7dcd:: with SMTP id k13mr7574304otn.236.1599574061373;
        Tue, 08 Sep 2020 07:07:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e60sm3458360otb.28.2020.09.08.07.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 07:07:40 -0700 (PDT)
Subject: Re: [PATCH RESEND v2] watchdog: renesas_wdt: support handover from
 bootloader
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
References: <20200908095615.31376-1-wsa+renesas@sang-engineering.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5d02f667-087f-c320-1450-d2d261b3cdc6@roeck-us.net>
Date:   Tue, 8 Sep 2020 07:07:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908095615.31376-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/8/20 2:56 AM, Wolfram Sang wrote:
> Support an already running watchdog by checking its enable bit and set
> up the status accordingly before registering the device.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> This is the same patch as V2 sent out nearly one year ago. There was one
> issue when probe() failed and the clocks were disabled, so the WDT
> wouldn't fire despite the FW set it up before. We fixed this at clk
> driver level and all the commits are upstream now. I tested this on a
> Renesas Salvator-XS board (R-Car M3N) with all combinations of
> HANDLE_BOOT_ENABLED, open_timeout values and injected failures I could
> think of. This patch is now good to go IMO.
> 
>  drivers/watchdog/renesas_wdt.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 00662a8e039c..47fce4de0110 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -194,6 +194,7 @@ static int rwdt_probe(struct platform_device *pdev)
>  	struct clk *clk;
>  	unsigned long clks_per_sec;
>  	int ret, i;
> +	u8 csra;
>  
>  	if (rwdt_blacklisted(dev))
>  		return -ENODEV;
> @@ -213,8 +214,8 @@ static int rwdt_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  	priv->clk_rate = clk_get_rate(clk);
> -	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
> -				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
> +	csra = readb_relaxed(priv->base + RWTCSRA);
> +	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
>  	pm_runtime_put(dev);
>  
>  	if (!priv->clk_rate) {
> @@ -252,6 +253,13 @@ static int rwdt_probe(struct platform_device *pdev)
>  	/* This overrides the default timeout only if DT configuration was found */
>  	watchdog_init_timeout(&priv->wdev, 0, dev);
>  
> +	/* Check if FW enabled the watchdog */
> +	if (csra & RWTCSRA_TME) {
> +		/* Ensure properly initialized dividers */
> +		rwdt_start(&priv->wdev);
> +		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
> +	}
> +
>  	ret = watchdog_register_device(&priv->wdev);
>  	if (ret < 0)
>  		goto out_pm_disable;
> 

