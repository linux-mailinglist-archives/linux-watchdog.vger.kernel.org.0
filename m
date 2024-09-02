Return-Path: <linux-watchdog+bounces-1664-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B138968CBA
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 19:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CB971C21E9F
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 17:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D161AB6D3;
	Mon,  2 Sep 2024 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ6UEj4b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55A1CB53C;
	Mon,  2 Sep 2024 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725297356; cv=none; b=HAZqpsPYFcxMU11ywhC8KKfKL5jx2gqmGuZD/USMvV+tMhe6DmKmk8fG1NOitRRTxYx4yRMluYkgBeYvHagUFN6Gnpz4gM+ZtVBz+CtE4UraZ+lb5vFhIMTlq0LsOOgUcbteHjfPdi8uom9+GI48LlGaYQOUBilZMvY3Ckcvr58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725297356; c=relaxed/simple;
	bh=Y3F+jiEbHV2sGQ4WdGXMqHKNU7egSLTAGwP8v4w0xXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a42wApDrNRw1zRrzys7Ryj3k7qMlsiPRAtu5RKyZ1yuyZOY3O4geG8n3OIHyIKxmTXFmk5SZlH6AFWB60wG9PvEpIiXPs7HjJhvzu0pMLD3I/MOZU0iPnLDdpl25Tk0WfNSdrzNoV9Z+I0gov8vpMEEvuVXKTNNlBph8E9Kg4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ6UEj4b; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-39f540795afso6456865ab.0;
        Mon, 02 Sep 2024 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725297354; x=1725902154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G6p3ko4LFyBY+04TDWxCHzAk1B2NviZe/YEXobAMJ/Q=;
        b=hJ6UEj4bswGYq88W4W8E95+ilx8SxO0csU33MPXGJHVz3QnNYKEczTI0z2WnoRwGX2
         YmbHW6cRHVtpN1Ewh10C9iKzP3U8kJQpG7LR7wnOV7ADxJO5xxzoYgLkbxBpsTO8E/NS
         nQIRWrU70F8vGZtqw+1O+TXTkAZ4SaKyA0QF5WAyuZ/YQxh7O4rWNciNCYoE7LV8trBk
         uEcQbLXksFXJndkyfA93DUM1h1VtBv8uRoX6GDxYHJicL54SsHk59zLOsoAM2uO1jK68
         7Db9tIEbdn/BLH3/3/u1zreDYXlruvsZOK+GLxXoEBudbm9lf1BWhT6JzsTz3QOV1zyc
         6tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725297354; x=1725902154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6p3ko4LFyBY+04TDWxCHzAk1B2NviZe/YEXobAMJ/Q=;
        b=TWfsWv6Wx0fZLNGfAujYaqYDF0iD5DT/mBG2oui+5zhfRyOtvgfyneLTQVN9l1FQaw
         S82w6lY8++tUlG2+MsdFeZsiOpZqkVQqVzyM4A62G/dCAIVX9CKpAg6uAsuyk76CKW3v
         1f/canmrzko5196tmjjC+zFbAmOkZl8EiCQhLWN5OJ4QbVg9c6NwVAnkc3fDtm6NjEpn
         juUb5pxo5ZUzfaeX5GAdowroDB9davebP6X0FIzOt1Tl31fbWNKkX1YUlv0tYXKI42Q6
         HjICee5OxB5uLX14L4GEeGd8iGKVm8Ahm96kdQbUjXMnEIqF5VLEG0b3ZRewo7Q06Uba
         l2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWafpd4/tsdf61q8vqwprWWRoRLReoaTi/RtKweTeiLPXXQaStFwZ0gYdsMcVtaBGMqZqCQOjln8j7uf50=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMIrjnbzOe17GegtOb9ufBucPCrGpkj1ouXrTvws7hqpEM3rbd
	5JAirn0J2U07VEnHQg3IP+ycRtRyvxJcLiuaJKMj8Y4vG1CG4OEg
X-Google-Smtp-Source: AGHT+IEx6OXmg99LFEPVaW8McXtbZQqOVa9NAPxuzNHTv+u7Il4NcUIsJ1SyuJTNrFTJUjiVXjLSLg==
X-Received: by 2002:a92:cd83:0:b0:39a:eb4d:4335 with SMTP id e9e14a558f8ab-39f4f5169c3mr96647745ab.4.1725297353598;
        Mon, 02 Sep 2024 10:15:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e77f33asm7871052a12.39.2024.09.02.10.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 10:15:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2896d0a9-5e92-41d9-8dcb-c804ac2a606b@roeck-us.net>
Date: Mon, 2 Sep 2024 10:15:51 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: iTCO_wdt: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, wim@linux-watchdog.org,
 andy.shevchenko@gmail.com
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240902081051.3824822-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240902081051.3824822-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/24 01:10, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: ce1b95ca23c1 ("watchdog: iTCO_wdt: Use allocated data structures")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

The patch is ok, but it doesn't _fix_ anything. The fixes tag should be dropped
when applying.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter


>   drivers/watchdog/iTCO_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 264857d314da..35b358bcf94c 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -563,8 +563,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	ident.firmware_version = p->iTCO_version;
> -	p->wddev.info = &ident,
> -	p->wddev.ops = &iTCO_wdt_ops,
> +	p->wddev.info = &ident;
> +	p->wddev.ops = &iTCO_wdt_ops;
>   	p->wddev.bootstatus = 0;
>   	p->wddev.timeout = WATCHDOG_TIMEOUT;
>   	watchdog_set_nowayout(&p->wddev, nowayout);


