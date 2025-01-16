Return-Path: <linux-watchdog+bounces-2730-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B54A144D1
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 23:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22EB71628AB
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 22:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6765B1D86F1;
	Thu, 16 Jan 2025 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU5qQ8/b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0371CEAD3;
	Thu, 16 Jan 2025 22:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737068096; cv=none; b=qVxgjUqxidzax9cazlUhmGM5hyVQxshU8LvJkxUC0gQryhyyfdKrgXFQ+URJDTjZ9pxBCIfz0JQmLixt75jngomNQjb02zjDIK/7lV1Z3BdF4atJFOev7oKpTrkN6ofk0OsPvwZibm4VrltFYPJMRVNSAGVVFu7/KUR1op5uVj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737068096; c=relaxed/simple;
	bh=Wlf/RN0XRqUETf7ciWEyTQlRqNSjWtYCRuJwDoikRik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJ35ZETo+aqR/xYQ81CO5bQ+8avJN8nJXmrXfymbSPlAvTQkt4Yqjfu+bJlPMW3BLszqiuQZJ0K8XLCEs5FjFcsHa9r7Q/XCBqDszxWhsPRP7g5eomDCF0KXdKCY3WwTc8tgk0k7bbdjhAOsJTyVszr7JpOx45p2FaxsDzzTJi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU5qQ8/b; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2161eb94cceso18241295ad.2;
        Thu, 16 Jan 2025 14:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737068094; x=1737672894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vooUBSDAWystmUYt9m7h+oCQzHQ6ZoWa1lDpIEwnSSI=;
        b=SU5qQ8/biyudXi2cazlxM/MceT+tEi2EfpqjjgM7+OVzNyBXFbQ1UTJf43H/WIJoVQ
         M0hzQHXAdpC7dp5mSZ8PDnatF0iewGWM7lLT74KPYrMIcVlugJOfEw+KvVlMndHm9UnW
         uG/3U6ljBduSEinJQvw0JtHt5ytICetOZ9veRkTwZ1OAdBs050AkXNlTqS3g3Jom9IfY
         wbNfel6UJa0AFLLmlN3S+r9hjrr/+elGKHPDnpN/Y7KNC6va1kcmErP0nRfmaomPrmv7
         YEol1Dpz55e3EqcfeuPvSZraN//BZeiJFMRYXJ9q+iTrWwRs0O1DePdNI3d8Z6i9IUh3
         YdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737068094; x=1737672894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vooUBSDAWystmUYt9m7h+oCQzHQ6ZoWa1lDpIEwnSSI=;
        b=R4azskBH4GDmwrJNdEc1In+6Q+Ayu2kQVmJIMM/rOcch6y+UdLVKLgiQ/J8Sp3SMqE
         RuceRebTVKKvCns9kPhoCXhs7UIGDlZB1DH5OBIu1H4FdR+xz6Tlkh9jCWRSoL/wPkqS
         WoYn9hKLsPQkML6kea+DimmKS3iWqq0fEyPvcnj9p5eLDLChpXgXXhW76ZB85nj3cBfH
         sV2WcQsBCWvlt4+wwJCcnNUd2OZOaZ6YYCWzkUNfCigZdgLhu6pk11hdlSXs1pfmF2CC
         nSjb1/PQ5xiUpJIRQ1CwwJD9iSs/cmg+lxqHDNd0ZSufodxuxPpuLHVHyKCfqzOkQ3v/
         xPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm5eVrdcBRlorPrZrkXOxUu6jmdHFCAp59wm4Mn2n5evj8A463PCUU1KPLlvCQ1q5i2G/DdPk6ADTM+6iPoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAnL6ZFJLskYTHRrFe/+HWm1NAm7jByr652SsIGzPkFFy6Ctnl
	C1dU0o0TrCZ5MJW964lQqtiV7G8za29Jo6GhJ4Xt6FcwM8zjX+SQ
X-Gm-Gg: ASbGnctJKblAJgsLD+NaUn5FKuHbJ+Zxnt0eTT/7jwbDh7KmWZptjpqiDebj+KxGJPJ
	ggc0+n8DMzD0dLkuiRQoTz89NY/XiYS3HcMrKEo7Q7Q7zUU3Qn5PJduNjMUS2NWDKtVdJ9YuISd
	pYhmzUgoO4eF8Rvknm94h7rgASC0wK799lR8Rrq5Xj138L7QcPyMtayOJB1JSZyeFL8Yh72K3xi
	znj8eHKymInV++p7ZvJL1EU4SjN+EqFqhrG5VLwExbe6n22ptRgPL05gjbRp26y1PY/ZModZLwx
	wcHQnuegl3dfHuCaBOmqKn6DksITLg==
X-Google-Smtp-Source: AGHT+IEbN60cvUQXENkqdzrTdbgfTwt7zOL+jE0CM5UvflK/XKxpD0BYNHTcxT/8oEdpDJJrlFva2g==
X-Received: by 2002:a05:6a20:9149:b0:1e5:ddac:1ed7 with SMTP id adf61e73a8af0-1eb2147ea8dmr527911637.12.1737068093730;
        Thu, 16 Jan 2025 14:54:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bca75c9afsm567824a12.15.2025.01.16.14.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 14:54:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b7a4c031-cc31-4a9e-8865-f23d5460ddcb@roeck-us.net>
Date: Thu, 16 Jan 2025 14:54:51 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: cros-ec: Add newlines to printks
To: Stephen Boyd <swboyd@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
 Lukasz Majczak <lma@chromium.org>, Benson Leung <bleung@chromium.org>
References: <20250116224605.110870-1-swboyd@chromium.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250116224605.110870-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 14:46, Stephen Boyd wrote:
> Add newlines to printk messages so that the next record is more easily
> readable.
> 
> Cc: Lukasz Majczak <lma@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/cros_ec_wdt.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
> index ba045e29f9a5..716c23f4388c 100644
> --- a/drivers/watchdog/cros_ec_wdt.c
> +++ b/drivers/watchdog/cros_ec_wdt.c
> @@ -58,7 +58,7 @@ static int cros_ec_wdt_ping(struct watchdog_device *wdd)
>   	arg.req.command = EC_HANG_DETECT_CMD_RELOAD;
>   	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>   	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)\n", ret);
>   
>   	return ret;
>   }
> @@ -74,7 +74,7 @@ static int cros_ec_wdt_start(struct watchdog_device *wdd)
>   	arg.req.reboot_timeout_sec = wdd->timeout;
>   	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>   	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to start watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to start watchdog (%d)\n", ret);
>   
>   	return ret;
>   }
> @@ -88,7 +88,7 @@ static int cros_ec_wdt_stop(struct watchdog_device *wdd)
>   	arg.req.command = EC_HANG_DETECT_CMD_CANCEL;
>   	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>   	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)\n", ret);
>   
>   	return ret;
>   }
> @@ -136,7 +136,7 @@ static int cros_ec_wdt_probe(struct platform_device *pdev)
>   	arg.req.command = EC_HANG_DETECT_CMD_GET_STATUS;
>   	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>   	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus");
> +		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus\n");
>   
>   	wdd->parent = &pdev->dev;
>   	wdd->info = &cros_ec_wdt_ident;
> @@ -150,7 +150,7 @@ static int cros_ec_wdt_probe(struct platform_device *pdev)
>   	arg.req.command = EC_HANG_DETECT_CMD_CLEAR_STATUS;
>   	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>   	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus");
> +		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus\n");
>   
>   	watchdog_stop_on_reboot(wdd);
>   	watchdog_stop_on_unregister(wdd);
> 
> base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532


