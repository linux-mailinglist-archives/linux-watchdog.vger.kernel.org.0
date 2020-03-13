Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070591848E6
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Mar 2020 15:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgCMOLX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Mar 2020 10:11:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36159 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgCMOLX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Mar 2020 10:11:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id c7so5064603pgw.3
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Mar 2020 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FTKY3YkAlafsgosuFjP5uUDEOjG0HFSYscQxdlyRPLo=;
        b=sb4PTElMGB5EyeKk5xsrEV38tFDrN2kSLZebPKee4/N1pRo20T7gFtrP61NTUi43Ne
         CwG2pHoo/cxPOKKFFgNPY0ze4yo7T22cQSpf9NqDiXQRKOviruBr22fpfYXBX+mIiNL+
         CyMQLMFz/uI8mNB5lRRxOm+wAPkv580EYq3XzQu6s+Yyfc9eUtC/0XJxZdUaBIqAw/rL
         tgyMMU7SjAn6jg3Lm06WOOuejDkrDzYDRD+Br+cQByK1ueYR7AJ+GP3xmGKEAgimxFwK
         EI1NudoGWXfog8LXsUCgLg/w8P4Qpqs3hA7dSWlr9Q0Jr9V75IE9jQrPZFzrKV6n8RGQ
         CpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FTKY3YkAlafsgosuFjP5uUDEOjG0HFSYscQxdlyRPLo=;
        b=SgeJovUTQtIEx7xQe3xp44VCXontsyARy8ToFVbgLMU1T44D9Tq8z7QtZd+D6F/hCw
         pOc6e+3GEHI/fZdhfPOG1uFrJsSX7jKrpNPfKEEiiBhRQyuwbEWm/tuA/vGtPJ21f6gJ
         2TZzloDiUcHJS5GOo4fDnPaKyPbTDtTxs5tEebZfhfra5nKWw42qwE3dGlZfitlqH4Vs
         IdGrq+KwWsOEONnMcGmtz5Plppkfa5V7dDH8KPXM+iE3u3ZmDOwEV1rHip1LCsAMrgj4
         lOp8o6tYCZcTMoj5Ta8zsn2aNiY1cPP6pyvowDpgifzfBwXBB2ZHkb7/x3QtPDjeJYgY
         SSfA==
X-Gm-Message-State: ANhLgQ34O+uwuFueEyFomBlJZObmcUsY/I0v7FrxgSLi8vszkf7jo/Fp
        H46c2hKoWtReXydML8wQMlNVjpPw
X-Google-Smtp-Source: ADFU+vs0nLgzgnKiTWNn1i5oClEiMmZFm7nc/yUUUGGoAc8HErs2HAng0Fus+cTC09d+RkEzmIFS9g==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr1355191pgc.365.1584108679970;
        Fri, 13 Mar 2020 07:11:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm56353444pgh.34.2020.03.13.07.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 07:11:18 -0700 (PDT)
Subject: Re: [PATCH] watchdog: ziirave_wdt: change name to be more specific
To:     Lucas Stach <l.stach@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
References: <20200313101138.25915-1-l.stach@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <24f8bf88-2bf5-fa7f-3cbd-db224420942e@roeck-us.net>
Date:   Fri, 13 Mar 2020 07:11:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313101138.25915-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/13/20 3:11 AM, Lucas Stach wrote:
> The RAVE watchdog is not a full system watchdog, but is used to reset
> ethernet switch when required. Change the name to better reflect this
> usage.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 4a363a8b2d20..cab86a08456b 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -422,7 +422,7 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
>  
>  static const struct watchdog_info ziirave_wdt_info = {
>  	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
> -	.identity = "Zodiac RAVE Watchdog",
> +	.identity = "RAVE Switch Watchdog",
>  };
>  
>  static const struct watchdog_ops ziirave_wdt_ops = {
> 

