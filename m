Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195AD4716D9
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 22:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhLKVkV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 16:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhLKVkU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 16:40:20 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646F3C061714;
        Sat, 11 Dec 2021 13:40:20 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id e17-20020a4a8291000000b002c5ee0645e7so3274208oog.2;
        Sat, 11 Dec 2021 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m0lAQz9ez3dmzX+7GUHcuHUfPxE4y+fs88QN8IC0fN8=;
        b=Tknqt20DmDlcw13xVwtEbuZWHyfyYebAPMzi3THs/0fBP6rAtlu4Sfg1BNwHDzDWBc
         btF8fGuLYk29BMyvj1lgQIHxHk8RAvR3FeZtq9MTx6n5t2HVtJtmrhljsObOO1cjdKte
         9rN/Iilse4Wk+lkJJZjKAn+5K7ENTcFSYhe4YAmxbHoSob3cRyiDRtjpydOYTpDYKCXB
         J8Hlelx+jLo/gIF6G5VgjEwwirofizAknPtFGTuSG1FJJvOJ4VlQrPsekK2B7VNX4OW4
         KJraFrF6gEm8qLX4YgfkS8UlTZ8P9IKm9GFLViwGEHhCaOlfN+iLySC14XJHyJ9Wlu81
         2o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m0lAQz9ez3dmzX+7GUHcuHUfPxE4y+fs88QN8IC0fN8=;
        b=bSJkVye8c2mMwD74KoMMXNZVK+GrVk0UlwpITozFSB2vYLG/gg7EfgONuwGYIWkvta
         wnjeMM8jCAb+xOytNa0w3BZ5BbercpXL65l/tFy7yKsXoyu3+J1bVVFI1gIwJz74Tpv/
         3PsAl8WAghbb4Fyu0568lTr+gBeXfIFj9twworBSM2202Jcbo3jK5P0Ky1NIUTmjbLho
         f5J8kxvpkBGpvAmJG2FYt+vuVzMM1jBHrDfVJyDO/rg/b11GcbEKpFHC71gTXbjR+tG6
         Uqw3yZxopY540tya7J06I/iz4/WehNvwrDXqlSPyoL1AXoqij/PZUJq+zsI7JcIePQ/x
         QexQ==
X-Gm-Message-State: AOAM531//FWI1AyNYgA8LgBkNr33tYJbX6v5KK2JOPUPO+sFP/2rNrs5
        OpJSj7Jg8NS74u5BMQm3GnUNgAvtrMM=
X-Google-Smtp-Source: ABdhPJxYL4XsOfevkjIgJO2tNO9Xd8miwa/tICN4zmRISnDLO8bXAVU3nkNBUuuJx5fFG0Y8gn9H6A==
X-Received: by 2002:a05:6820:1609:: with SMTP id bb9mr13617933oob.37.1639258819514;
        Sat, 11 Dec 2021 13:40:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o14sm1279880ote.41.2021.12.11.13.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 13:40:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/4] watchdog: rzg2l_wdt: Fix Reboot failed message
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-4-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1f11fe7b-8b2d-1d64-d4ef-23ab890f9971@roeck-us.net>
Date:   Sat, 11 Dec 2021 13:40:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211212617.19639-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/21 1:26 PM, Biju Das wrote:
> This patch fixes the message "Reboot failed -- System halted"
> by triggering WDT reset by enabling force reset(WDTRSTB).
> 

That is really misleading. The patch does not fix the message - it fixes
the reboot handler to make it actually execute the reboot.

Guenter

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/watchdog/rzg2l_wdt.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index c81b9dd05e63..497c86129f20 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -21,8 +21,11 @@
>   #define WDTSET		0x04
>   #define WDTTIM		0x08
>   #define WDTINT		0x0C
> +#define PECR		0x10
> +#define PEEN		0x14
>   #define WDTCNT_WDTEN	BIT(0)
>   #define WDTINT_INTDISP	BIT(0)
> +#define PEEN_FORCE_RST	BIT(0)
>   
>   #define WDT_DEFAULT_TIMEOUT		60U
>   
> @@ -130,22 +133,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>   			     unsigned long action, void *data)
>   {
>   	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> -	int ret;
>   
> -	/* Reset the module before we modify any register */
> -	ret = reset_control_reset(priv->rstc);
> -	if (ret) {
> -		dev_err(wdev->parent, "failed to reset");
> -		return ret;
> -	}
> +	/* Generate Reset (WDTRSTB) Signal */
> +	rzg2l_wdt_write(priv, 0, PECR);
>   
> -	pm_runtime_get_sync(wdev->parent);
> -
> -	/* smallest counter value to reboot soon */
> -	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> -
> -	/* Enable watchdog timer*/
> -	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +	/* Force reset (WDTRSTB) */
> +	rzg2l_wdt_write(priv, PEEN_FORCE_RST, PEEN);
>   
>   	return 0;
>   }
> 

