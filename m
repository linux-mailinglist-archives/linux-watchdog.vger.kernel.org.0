Return-Path: <linux-watchdog+bounces-415-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E58323E4
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 04:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 543671F24573
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 03:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AF6184E;
	Fri, 19 Jan 2024 03:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLZ1CteD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36244A05;
	Fri, 19 Jan 2024 03:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705636544; cv=none; b=u3y0SXT3JkVABIOrT80H/WSIRiEmA9eO6/x7otI1C0wlUBJGKqNbtbbbBj/ARvRSDEKyPUVW5QT7ViZn/Q/eJPDiJY24O7pv2oqfK3HpR7Fp0kWtezRk3pd0lpgzDHk8cmWFF/CiTBTWro3yz+36eZFjoz8UR+4HdAljq44L3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705636544; c=relaxed/simple;
	bh=LEp+IFUixBwxj3KTg1RY5B7h6X5qF78QMjxYKEYNR5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i76ygO0NlbavQuhAUk57uS6AzBfshuHLc7yX/Jh17WVmcqU9YBm0y3jQE3NxYIU65PxqJnEnAg8ThiC7QlkFBvuNtu5+g5Mv65uMGTRMzYxdkW5OYyiJ0606TvA80n8UmElV+l9VO9ced6qK33g5c4b/2DxfZr4cb5t+gC0TvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLZ1CteD; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bd3b34a58dso276763b6e.3;
        Thu, 18 Jan 2024 19:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705636542; x=1706241342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OLPr4eFnKtXkfj5+z8aEyNATm6TJXGVUAQJQl386BuA=;
        b=KLZ1CteDcDymv10kNcG5XnVsnSfLKtWmhCIR2p6BFwMw19tJIBFBZQAeQMQiGKPiXW
         L41JC0scPPXlMdNTUjH5TvrurF0gOl2QFsDPj1WelGeu8kbzRq7lslktcc/egaC8EVws
         0FLHr0NUbJF4OL5we255fNyMjE724NmDaH96gttY/EZoAwaGpB2FvZGKMu00VvXXcb7C
         qQEN9pNzWsSyrv1Kqzdtj9fUE3jktjIkl+VoHNa/w4x2xi36H/r6jmHv7tWq9zduKHBE
         0yGZhv6bsE1vgCE0PSNKq/H87+30q2PwMAPmZ26j7s9heaJr5b+u/bnYXh7kLWeIzg99
         mp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705636542; x=1706241342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLPr4eFnKtXkfj5+z8aEyNATm6TJXGVUAQJQl386BuA=;
        b=i7nhYSBh5mmFLHnVLSjBwCLMGofazDYTRk/GSOAq6OIiSE4rypNaywjGPgPupwJt6p
         Id+jKlwUKT5qwn4zk56C7aiJiS7AusOFYBvGe/qxYqy0niMi8qiaCx0P66OQJVbark3W
         GXU4AzPD6YuM1yWrbGpSq8RuQKUwvmkhDwfwnmIotOWubeYGjJRSGuITfI1Oc1qsDMhS
         ePTIDnNpwjy1z/wlT+CWcR+feJSRF1pEZelLV4nHCMVY00HtQTeX+FzVJ7FLKKm0CEt0
         zu8ieIGlY2oSOMRDXu/iWBlHJXw2b9BhNdFMXPppruWvV90pqhIOzMDAgdDQhb8535dS
         S8sw==
X-Gm-Message-State: AOJu0YzVc07aSOfe9mQXhCZC12GdjWZNOnJibVejKrlarJy4Cgj+qyXj
	RHdP9+jw6tQgVfWGd/HSpBInyGODj1RJPihma0fga6LQHHIhhBdzrymkAdx/
X-Google-Smtp-Source: AGHT+IFuUpNGfjvDU9oB/pWFzBbeHN+ptfo2uTMeA/h27qWIRbYSKnrqLB16qiiIDP76gGqq7+oigA==
X-Received: by 2002:a05:6808:f0c:b0:3bd:9fd1:3abe with SMTP id m12-20020a0568080f0c00b003bd9fd13abemr1563744oiw.5.1705636541669;
        Thu, 18 Jan 2024 19:55:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y14-20020a056a00190e00b006d9a0902937sm4198602pfi.149.2024.01.18.19.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 19:55:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <17e323d8-f8d3-4e5a-91aa-0788b8026f21@roeck-us.net>
Date: Thu, 18 Jan 2024 19:55:39 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] watchdog: Add ChromeOS EC-based watchdog driver
Content-Language: en-US
To: Tzung-Bi Shih <tzungbi@kernel.org>, Lukasz Majczak <lma@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Radoslaw Biernacki <biernacki@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20240118195325.2964918-1-lma@chromium.org>
 <20240118195325.2964918-3-lma@chromium.org> <Zanvi4ih0zhC4aG7@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zanvi4ih0zhC4aG7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/18/24 19:42, Tzung-Bi Shih wrote:
> On Thu, Jan 18, 2024 at 07:53:23PM +0000, Lukasz Majczak wrote:
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 7d22051b15a2..4700b218340f 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -181,6 +181,17 @@ config BD957XMUF_WATCHDOG
>>   	  watchdog. Alternatively say M to compile the driver as a module,
>>   	  which will be called bd9576_wdt.
>>   
>> +config CROS_EC_WATCHDOG
>> +	tristate "ChromeOS EC-based watchdog"
>> +	select WATCHDOG_CORE
>> +	depends on CROS_EC
>> +	help
>> +	  Watchdog driver for Chromebook devices equipped with embedded controller.
>> +	  Trigger event is recorded in EC and checked on the subsequent boot.
> 
> Perhaps unrelated to the patch, but I'm curious what the mechanism is.  Does
> it use any existing paths for checking the saved events in EC?  What it does
> if there is a saved WDT reset event?
> 

Reporting the reason of the previous reset/restart is part of the watchdog API.

>> diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
> [...]
>> +static int cros_ec_wdt_ping(struct watchdog_device *wdd)
>> +{
> [...]
>> +	arg.req.command = EC_HANG_DETECT_CMD_RELOAD;
>> +	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>> +	if (ret < 0)
>> +		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)", ret);
> 
> I think this would be worth dev_info() or dev_warn()?
> 
>> +static int cros_ec_wdt_start(struct watchdog_device *wdd)
>> +{
> [...]
>> +	/* Prepare watchdog on EC side */
>> +	arg.req.command = EC_HANG_DETECT_CMD_SET_TIMEOUT;
>> +	arg.req.reboot_timeout_sec = wdd->timeout;
>> +	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
>> +	if (ret < 0)
>> +		dev_dbg(wdd->parent, "Failed to start watchdog (%d)", ret);
> 
> Same here: dev_info() or dev_warn()?
> 

We had that before. It is just noise. If it fails, it will likely
fail continuously, causing log spam. We don't do that kind of
continuous error messages for other watchdog drivers and should not
start doing it here.

Thanks,
Guenter


