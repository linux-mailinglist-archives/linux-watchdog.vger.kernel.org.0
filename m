Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817C1797587
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Sep 2023 17:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237750AbjIGPvr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Sep 2023 11:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbjIGPj6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Sep 2023 11:39:58 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0952733;
        Thu,  7 Sep 2023 08:37:30 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1c4cd0f6cb2so561000fac.0;
        Thu, 07 Sep 2023 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694101008; x=1694705808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ije11m2dJHIRUBhbKjnCtBLajU/SOG5fYp+6ZMnYu94=;
        b=bfyh7YbvQHv6K2Hilm8W8ODsr8m3x3GVivBs2HHUPAA/mwPSnv/ol4wlExlOK3OrN8
         OVdOwHYLKSWaK6eyToiOemjmAmCVJOmwWC8jwL1A7cMIR7THLtKYQh3z2hrrrpojg5/A
         G0NYkX7Tpw4bkFzEcSj8nehVrObCK4ZWgFCqRN9jN1SdfK9ExlfyRWV67+84QugBDQqs
         2KiDEbGb/rI3Io7EHUwuDvBquOAuxOxUAGvlzs4GfyRcwm3agAOhUcp5jVS/4m/4u65c
         XneddAwpAe7mPqDZSaKejq+g/bau7lk9c1QYlHaPkP9riwL2QRPxq0VB1LkG1SIEPwc9
         SHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101008; x=1694705808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ije11m2dJHIRUBhbKjnCtBLajU/SOG5fYp+6ZMnYu94=;
        b=cfCrAwZj31ji2buwqMy+KY57DENKkhU+NvAcKU0Z+AedvHDSNeAUAN5YcHF9SYdUd7
         ENhyRXfztI/Mb0VVRzp0XK7gbqgM532cbrlTDIB1j/7RM/OC3FD4lefwX3m8elKbIK8U
         h6qcHHY3d79KHDrzicU2rtURkyquybtze+GYeGfo0Nr0OT32l/GuCBGuE7SHju1ZCovz
         ObF3tS5sNXHszfRjyH03pvweu4tulO0kYAaoO2KX5GKrnfWIRN4f+vqobYUZyJi1XfO3
         DyG9bUg/F5tJk86ZykKO2K36vmb/SIXp26v4Gjjq/EEOzEPC1PVZqKzFUdCAoDJfAg79
         d99g==
X-Gm-Message-State: AOJu0YygOD5K2t8BJjy5UlVimmXkEqwRCh8dqz3xuG1Ba3tP1xO8fd4Z
        oaliducVzq+MFud7eELMSZPWnMpM3Nc=
X-Google-Smtp-Source: AGHT+IE0wyur8SddnB7DKaXqnaG9wVQJXrBPrrxn8sfCzESUzgNQEQbmpEk1rhv1ZNOsSu2KKZ1oTw==
X-Received: by 2002:a05:6a20:8e0d:b0:f0:50c4:4c43 with SMTP id y13-20020a056a208e0d00b000f050c44c43mr3279856pzj.5.1694085901243;
        Thu, 07 Sep 2023 04:25:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h3-20020a63b003000000b0056c466b09a4sm12571178pgf.59.2023.09.07.04.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 04:25:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <41dcef20-1a16-71be-e658-6fa84405f1a5@roeck-us.net>
Date:   Thu, 7 Sep 2023 04:24:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] watchdog: marvell_gti_wdt: Fix error code in probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Bharat Bhushan <bbhushan2@marvell.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <af326fd7-ac71-43a1-b7de-81779b61d242@moroto.mountain>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <af326fd7-ac71-43a1-b7de-81779b61d242@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/7/23 02:53, Dan Carpenter wrote:
> This error path accidentally returns success.  Return -EINVAL instead.
> 
> Fixes: ef9e7fe2c890 ("Watchdog: Add marvell GTI watchdog driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/marvell_gti_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/marvell_gti_wdt.c b/drivers/watchdog/marvell_gti_wdt.c
> index d7eb8286e11e..1ec1e014ba83 100644
> --- a/drivers/watchdog/marvell_gti_wdt.c
> +++ b/drivers/watchdog/marvell_gti_wdt.c
> @@ -271,7 +271,7 @@ static int gti_wdt_probe(struct platform_device *pdev)
>   				   &wdt_idx);
>   	if (!err) {
>   		if (wdt_idx >= priv->data->gti_num_timers)
> -			return dev_err_probe(&pdev->dev, err,
> +			return dev_err_probe(&pdev->dev, -EINVAL,
>   				"GTI wdog timer index not valid");
>   
>   		priv->wdt_timer_idx = wdt_idx;

