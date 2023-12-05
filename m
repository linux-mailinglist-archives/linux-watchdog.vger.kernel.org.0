Return-Path: <linux-watchdog+bounces-145-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD3805E6B
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 20:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D20281D88
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 19:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D030C6D1AA;
	Tue,  5 Dec 2023 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL9kMPe+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3650B0
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Dec 2023 11:13:30 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cfabcbda7bso929335ad.0
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Dec 2023 11:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701803610; x=1702408410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fbyQcjgB3+z0El6usU5vDb4Yzb0gWpexdQU8YiQEmL0=;
        b=RL9kMPe+JJjpDRc5k2EW1NZb/SpmPI5eHWkVLYlvsiY9mkdHJq+CZkQTQQ9p4tHQFq
         1DFNZET7/ep+8en9puWasAcZgUtgt6F8ygF4HR0d2IftH01TRJ3GONgx4I54TJ05InSL
         aOtaJFChaUaw32amwg8oDbLkM6nKKos5evKMyMEuttqNAoF3NzUVWVP72bA1pzwmDu61
         qcNlRCNOyUQRr4Q8img//P9a/31Hd1FT+ir7/Jos7mMb48RKyt5P/QNH5ldtDRHgbWkn
         tvJuIrbk5kijm4TlV0QxBPmC4fWEcJ67pFDQjsCIMhwKBSg+QRyqiOtIyRDAE/9keOL4
         HccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701803610; x=1702408410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbyQcjgB3+z0El6usU5vDb4Yzb0gWpexdQU8YiQEmL0=;
        b=jLZiJnV6/aaLN8MFKDJKNGaYVdUapjdGV7476dT3ERmCKcpWDkvYYSRD9FPECWZknj
         JidV43JAtEKtzFnowr73rbBfjh8xalzn3r0bpPhK6/ICqasrNtFxTb35TnMH1LYLd/yc
         JGfDKy7SXjGFxdlnaftet9fCGNi3IsvowfY+uFvf4AZ01OSs2/JYaw9YVROzW00H1BNA
         f40z863wRxFeJGdbiLG5lbfHc8I4kYxmKpz4rwyBNCtTJ0SKjIEx0RFWgu4yIMNvMZQz
         qP4fRH65UK3XN6Kj1YLB9FgNftg1ea/dQ6P1/jh6A/mJOMCDmZ6YhDzJXUgw4ArB7gkf
         T5ng==
X-Gm-Message-State: AOJu0YyU12dUAh7Ot6b5+1jPVf8E/uIvlO4NSGAXDuOn8T3jb/oGwjf7
	SW7yepR/nfJyZgPhoxq+cjw=
X-Google-Smtp-Source: AGHT+IHg8DgyfuCUgPG4ar1KFIbvPyuH0qMeH8+GSLwMtcevZJ7kmFZoLn4kaK5W11+Ba2kC7FKPWQ==
X-Received: by 2002:a17:902:ee44:b0:1d0:700b:3f6a with SMTP id 4-20020a170902ee4400b001d0700b3f6amr2112579plo.36.1701803610213;
        Tue, 05 Dec 2023 11:13:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k28-20020a635a5c000000b00528db73ed70sm9625255pgm.3.2023.12.05.11.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 11:13:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a1d11e74-9c8b-463a-a237-dae651f4cda7@roeck-us.net>
Date: Tue, 5 Dec 2023 11:13:28 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: set cdev owner before adding
Content-Language: en-US
To: Curtis Klein <curtis.klein@hpe.com>, wim@linux-watchdog.org,
 haokexin@gmail.com, linux-watchdog@vger.kernel.org
References: <20231205190522.55153-1-curtis.klein@hpe.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231205190522.55153-1-curtis.klein@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 11:05, Curtis Klein wrote:
> When the new watchdog character device is registered, it becomes
> available for opening. This creates a race where userspace may open the
> device before the character device's owner is set. This results in an
> imbalance in module_get calls as the cdev_get in cdev_open will not
> increment the reference count on the watchdog driver module.
> 
> This causes problems when the watchdog character device is released as
> the module loader's reference will also be released. This makes it
> impossible to open the watchdog device later on as it now appears that
> the module is being unloaded. The open will fail with -ENXIO from
> chrdev_open.
> 
> The legacy watchdog device will fail with -EBUSY from the try_module_get
> in watchdog_open because it's module owner is the watchdog core module
> so it can still be opened but it will fail to get a refcount on the
> underlying watchdog device driver.
> 
> Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of watchdog_core_data and cdev")
> Signed-off-by: Curtis Klein <curtis.klein@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/watchdog_dev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 15df74e11a59..e2bd266b1b5b 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1073,6 +1073,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>   
>   	/* Fill in the data structures */
>   	cdev_init(&wd_data->cdev, &watchdog_fops);
> +	wd_data->cdev.owner = wdd->ops->owner;
>   
>   	/* Add the device */
>   	err = cdev_device_add(&wd_data->cdev, &wd_data->dev);
> @@ -1087,8 +1088,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>   		return err;
>   	}
>   
> -	wd_data->cdev.owner = wdd->ops->owner;
> -
>   	/* Record time of most recent heartbeat as 'just before now'. */
>   	wd_data->last_hw_keepalive = ktime_sub(ktime_get(), 1);
>   	watchdog_set_open_deadline(wd_data);


