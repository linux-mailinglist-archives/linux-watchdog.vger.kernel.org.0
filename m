Return-Path: <linux-watchdog+bounces-4580-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E9C5B037
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 03:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 628C84E6B7E
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB8621E087;
	Fri, 14 Nov 2025 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4o7E+En"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E5238D42
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 02:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763087729; cv=none; b=XOl0JEqB22gE5wXEVcPYGzC6RlMWsRQYeifKBGwoEVb/yJ70MGPZxVvTnjMy87zZenkFugT0vgY19cSsolPJpxzyxFQUBkoBU9TBcqbuKthqqsdJkVPfEuOQk3AjJZHLHSAt3R26jV8kyiLex7DUYRINo4psTXn87H5M/bdr4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763087729; c=relaxed/simple;
	bh=r7x4ckwDajKWu479F7GM+sLfVn2nuLbFA3b8WCI23mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWxd+MazhQe2JCzKPbai56oWpaoin6ir85jCQWNw7/P8GkTV35vBAEBKQigoJa7YctRrM8ISvRljdYNFgLpMKT9sd77NISTYqGBBEQJsHVjmmVWuN7+ONvr4MwOtee4ksdXLUd9u9JY4FTnFlJszkDPrOX9Rg+pCCpNGCPzfF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4o7E+En; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1284207b3a.3
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 18:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763087727; x=1763692527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zOPhgYRoOZ3uABVgA2RKGspwk5uZccQpCMCFeXNr0wI=;
        b=i4o7E+EnCsl+oxt7WXgNumaMWNgxwAkxnxfl19+jnEj4qs5lvtuckYMzlWdLRY49US
         YhlTYP2/5Pa00cH8lEnY8v8iuxh1DngbqS/UNCqjcfM+k6uaIi0/8Fwm7VW8ZEEA8u5X
         4GqnRpMLNX11EpKCLxz4U1mI5V8x4oVykOZ3vQZHko3BDP8pNnGjm6At97jZOzE5+84U
         EFQbLIM86JQQriBsSN/rJUD7RcaqLTeRvNS8NSP/e/xrAcRL1IB8nhCcboO3uX97t8Zr
         L+1zgktvvpOeSHULYjNyb+jIUKb/xu4YoKZ1r6J/gA2kl1xOzN4WGb6rhw6HujsPQ/PE
         I4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763087727; x=1763692527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOPhgYRoOZ3uABVgA2RKGspwk5uZccQpCMCFeXNr0wI=;
        b=qDHqfXB3aOL9duMUNVuoHdKbP7lHXjZDy/qKM16hcXhh7XJwKoNt9RG5sgHvZZ+4xc
         SRp3JDVzOV82EkiRATDOBSmgeQq347ndPcQ5s+N58Tm6bLQ9BVMxjlf0SkoxXtj6onq9
         sWlWySiD/mvMFljqBhBh3c8QAzjHXmwdugeadQxPhX7rjH+6+7hSwrGwUwH8Nn9TP+3M
         vuJmcKGDmeqQya0RYi/IN3ZgsqQAxW6GbFDv8jkjq2e6Eh6EGwmt1dtLFjX4OVrpemYF
         B7m7g3q3b/gtgokLJhbJkwECG/2PFWRGgc3gCjaOXqHXDHV9oWBNxxa05sUQQOZa4KHz
         B1cA==
X-Gm-Message-State: AOJu0YzedbjAifrVGZEwuz52LU/8VpOmu5w6YlMTnc9SdVYzeKCr1Kc0
	c2hHjXYy8f2oIZq+zP8WHor5RndhEGdyUtbv/bKZ+ruUlUPSebjIt1//hpP2MQ==
X-Gm-Gg: ASbGncvW975fP30FlluEo13USFyS0yfm3GuU63KpeOokv5vSVVuru+NxmoPCkbP6zhb
	Aw4cbmWWIK98dbVGPeh38CuRtPvDhsjIogt+UcSQLzpidhZe3TqZjfZlBoIB9ae76T4RqkS8MlQ
	WlWVigqIYFb31bFU/cbdT+IesqHIELM65ghR1NrGGoRJVfhmojuaHWOhhbYQ/ZXOrpl/L+fM+I5
	ON2B5GuVIwIvx/fD4gNbVjhGQTbsT5d3coVhqwh6x5TqFxFXxDsENMzv8aNDRFHr3P9snxEvauP
	2+zbhDB7TyveQeIZT0Y/+JHx547BV4K5F9WXrxbO3LsXHpJGODj5xX2BNUQ5etiFNHhBFxKka24
	hPCpe83pL4HdkY/gzEQcxd/uYx5geKHGKlqzdYsVGiz8VPbw77v0csuN4UxFfkmUnaVM49kME7m
	eW0j4fVTCCMpRh584y3YlWlhvcKfzcDYq5OjD5/HXe1zxWhTmm
X-Google-Smtp-Source: AGHT+IE1dbTj8n1s9HTCgjDgzm3UFXmNyRyZStP/kMGncoCRkJ+4n0V+IsqiATX01fXA55nUNlKIcw==
X-Received: by 2002:a05:7301:d195:b0:2a4:3593:6451 with SMTP id 5a478bee46e88-2a4ab880e5amr454257eec.1.1763087726542;
        Thu, 13 Nov 2025 18:35:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db102f5sm4168426eec.4.2025.11.13.18.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 18:35:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a9c63688-40bc-4865-b208-a39612a4cd2b@roeck-us.net>
Date: Thu, 13 Nov 2025 18:35:24 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: bd96081: Fix a spelling mistake
To: Chu Guangqing <chuguangqing@inspur.com>, mazziesaccount@gmail.com,
 wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114020502.2009-1-chuguangqing@inspur.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251114020502.2009-1-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/25 18:05, Chu Guangqing wrote:
> The spelling of the word "initializate" is incorrect; the correct spelling is
> "initialize".
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---

Change log goes here, even for trivial patches.

>   drivers/watchdog/bd96801_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
> index 12b74fd2bc05..43ec23c53e62 100644
> --- a/drivers/watchdog/bd96801_wdt.c
> +++ b/drivers/watchdog/bd96801_wdt.c
> @@ -370,7 +370,7 @@ static int bd96801_wdt_probe(struct platform_device *pdev)
>   
>   		set_bit(WDOG_HW_RUNNING, &w->wdt.status);
>   	} else {
> -		/* If WDG is not running so we will initializate it */
> +		/* If WDG is not running so we will initialize it */
>   		ret = init_wdg_hw(w);
>   		if (ret)
>   			return ret;


