Return-Path: <linux-watchdog+bounces-2560-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7CA9EE81A
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 14:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED9F163E63
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 13:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B547320ADCD;
	Thu, 12 Dec 2024 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZH+s+RcN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF521748D;
	Thu, 12 Dec 2024 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734011779; cv=none; b=OrGkjcrlFQ7zmZxres6/q6ohvVC9wuh7ObhVEMUP9uAzHxelu5+2XZqYuW2Dy0yhqWYx1IzLmaS14nQkakDoXNPIFr3obs13Om+H+F+XeSTRYim31HTFCje/eeNfvG4tZVxIPBinQE8DzoqPhcOIHhx+uvDOox5knrgtneVfq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734011779; c=relaxed/simple;
	bh=4sdDL+SdPk2aGNtCFb1wT7FzhMXuVBy3l4AT/jIgv+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gGN1orCUsp0D6EbKCwUNFz0DGL4QWiKYfmyyMDyl7JmcqQOOnPhIyrP87UrTRkD0YQEYmeivp44UN/mfV3rrFjXlu9784PqM8nIG3q4Eq3hHWYlLU2LxKkM4e2v6FpsJOi3Abz6eHG6FEW2J8uokUrwq6vpYnLGSKSG2DFLfFls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZH+s+RcN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21634338cfdso6631435ad.2;
        Thu, 12 Dec 2024 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734011777; x=1734616577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=e4O93T3nWN1CvVNDoucw7J8PWjYgMeFXCoydStFkkYU=;
        b=ZH+s+RcNzGTl/DvC+QUJFGDcZu4nSgpIKJeD3dqQ4a8pu9kcvZfBGzrsJcE8sXrzAN
         PE1a35Wxm8p3hUsyPvj+LubXQ84F2YbVl7Tyi27vVOyaffu5oeio8ndfNw7LCk8F9vrS
         6MqqGbW0DjUelz132fXt7kEe6OK6M1h1Ig9+GNZrrQLwC7JotVi3AwM6P+43Kl8tZOa/
         WtX9uXp7/fsXwsgenRE0f/ybB1/nGIPpwT+d5tnXLEFSGiDDBsnTPxxNlBKzLzZjbNUE
         WC9v+JlBLUSHXm12BjhKLcJfUkQ4ins91ctZn1Lg8OWfjv7zfOXVNWtqfFnVhCNo5HNh
         Q1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734011777; x=1734616577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4O93T3nWN1CvVNDoucw7J8PWjYgMeFXCoydStFkkYU=;
        b=TmKpSH3RusJR3XEjwXxo4h6/Vqm6TFSjTiaVKTBHrnaBKnRKpvEc1alHHNqCk2DJ0v
         kRfXUfTi2qq9te0GWPO7gRgnAu1NZWm7DsPlrybijvOM9iyGyhQ/x6TH6BtVLi7Vo92G
         LuHqIBqlOGOoapPkaHH/5w1Of/gNGUds52rC3JFQbuakvnmmKzfKhTpHbqkY6wdOvlOQ
         Mb8c1hnj0lUxxqOFbmQvcOlthzw4avB7wBVz8kibj0xoNOEBrV1hotIQURvbmBl/D7eD
         vF225usLOlPKvfXg0ABB0NM8RD+qrv10ByeCLjjB+vQEXn7QDQF2M5EQYE1d9qRWY8KO
         Bdsw==
X-Forwarded-Encrypted: i=1; AJvYcCUtcYSx8tRLaz4QA06fxXR+y0DQ2X9M6Tuc5INm0SV0ZIm4iTRpzUjxYqaMetnyhba//eou7xLP2j2Q6EE=@vger.kernel.org, AJvYcCVekfU4cS9cu5b7TSdW4YV5a2qpCtAZdFXnunEnkxLXvBvglf2ZWcfAXcsD9vRJY1mrX/C+qsAEZPKXO9VWus0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyFJ4Vl0R+TBhqWMtd8i6Wb88+E7wWgts5mOxL8eg2yKD4ESj
	LQouzvqWdn8dB/KKWstB/PWaMPxUfCOok8PUyIB0hVFXjiJfENeePfY3Bw==
X-Gm-Gg: ASbGnctLBdE3IQC28Q7Lfx4Hr/Qke/rCCKsZBTwRC4WfWHrPtG5z3H50aCohn1bhOaA
	oFtV81iEJoAuokBvEFaBqBbGXfMv2q70td5GyTY+yQDMMA56hc+sADKI+9JevUuJueV6Dz9UInw
	RA3OkoHjNBDB633pcBYsbbyXJKc48cxh6SOrsAv+GFIoAfYV3gaYRbPK1F6QD2khc+xj4NVa+ET
	mDLG7SmQGWpMKTG46gYzxrdCCbeQzRMzLyKia6yyK5gZjgSLi5xEZ34BUIdqV2iy9SjTr2FsI5u
	K/k230pjZeg5xKaHti3yuIntTIH6tw==
X-Google-Smtp-Source: AGHT+IG9t76dpjEFCQdDLx6ycmXDuEQ02DE+EnhOu+AEhkJ/qd7d7+aSme/4j39HQkmI44uCAwy+5w==
X-Received: by 2002:a17:902:db10:b0:216:7ee9:21ff with SMTP id d9443c01a7336-2177899ae0fmr107634975ad.49.1734011777022;
        Thu, 12 Dec 2024 05:56:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21669ca7be3sm53985785ad.234.2024.12.12.05.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 05:56:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
Date: Thu, 12 Dec 2024 05:56:14 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: replace mdelay with msleep
To: Phil Eichinger <phil@zankapfel.net>, wim@linux-watchdog.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20241212113014.1075414-1-phil@zankapfel.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212113014.1075414-1-phil@zankapfel.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/24 03:30, Phil Eichinger wrote:
> Since it is not called in an atomic context the mdelay function
> can be replaced with msleep to avoid busy wait.
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>   drivers/watchdog/aspeed_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..98ef341408f7 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -208,7 +208,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
>   	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
>   
> -	mdelay(1000);
> +	msleep(1000);
>   
>   	return 0;
>   }
This is a _restart_ handler. The only purpose of the delay is to wait
for the reset to trigger. It is not supposed to sleep.

NACK.

Guenter




