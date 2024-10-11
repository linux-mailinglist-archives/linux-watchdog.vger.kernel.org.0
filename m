Return-Path: <linux-watchdog+bounces-2194-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172C99A7AB
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 17:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1054283E63
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21DF19597F;
	Fri, 11 Oct 2024 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5VY3k35"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E3194C8D
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Oct 2024 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660524; cv=none; b=SGfqSKCnTHDjQZyjv9x8pB2nLkJ8ofEm3BM6qK5V2uGEqOFwy5VPG3V9/J6S7uMpDpk5bRuozdm9H1uB+6/Bukbgt0N/SqaEDcD4rRhBC2Z00kvNZgjFcnxn9zFND366QUHZXsiYzedTsdKmq2oUm+ERjJsF4QjYVox9/Ggebvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660524; c=relaxed/simple;
	bh=NOBSXKxFWYPSGkpjqQmXTnTl4WUkgIHnXpVKY+7kfCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5sq7CRxbdk+H0KaX+wodxGC85EHoaK+pYJN9rXxqGzozcmppoYEo6LZfD4oFQtobNb0KsOcOBqmj9eijn6mA3yYPYAtwn0iz3a4NVss6EXf67Amw/OPTI5dBkRCcFxMdms3J60zaFxhZqUiG9wBqtk29JmQkNOultW9lFlvDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5VY3k35; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e050190ddso1530438b3a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Oct 2024 08:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728660522; x=1729265322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GDpD74lunP+HvYWXh4Gb2AS0bafn5SzcEVVxpQvV2CY=;
        b=J5VY3k35M1apLYtG+Qu4dNQ9Mk2Y1a5+iEkyyMu7riyjDHI1JyGqPE8j9JSwC7Yv1E
         pjehn0XX9n73hwzaxabYYZ4kElnhdunOIiKDRhBgwpl7qARLCaybFOTSd6ww8FNAkEDg
         oehhqB39EJ1+SmAcvOV3cuS5vroZJwUejgcLXvBYydAUV0nyzeFQ9mMc569AxUxA+nOc
         ovbw7YphykJ1q+KA/6UeONpdUypTB2wpwyQsVJhB2DJedfYIbI7gDVicny+a2aKm1LcJ
         +db6sabsSvCEiPOok7G8Pxow5241oVnQO3onYsmnd6K4E74gUy9ok7PGBnmGBPZjT1lc
         ggxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660522; x=1729265322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDpD74lunP+HvYWXh4Gb2AS0bafn5SzcEVVxpQvV2CY=;
        b=UL2kdk+OAeLAnvMxHjoXuksYjGvVNPK9MlVAws/+tlTj7coFXqnAbHZf6oUiMGAA5d
         M0QjmJC8knfjpX4cFHQ5IfOoHgRjP70A1di+DWd5kWKg5+tL4ScalrbXHGO+vK2XPAJl
         WexYvYai8jYEs2ZqLoHp0sJRuCUxK77KKaQUycbNK+S7R3BMVf1fa4sEpC13bLDujxWH
         pG+xUagEudekYYi7uICGLfztOOFRK2FkpIMMNVGpPF6icQ/xdEIH/TFOCQNaUJMzpVgG
         eiVuBjB7Bns4aEnEirrDjXS1oVlJiB63qiMRc6PPq0tbXSLlUoxYY19Q1ZsSI/eVmght
         IasQ==
X-Gm-Message-State: AOJu0YwijoyEMW5mnglf95vWw96h3g5kgP79vgNZyiBP9AKJHN7fIYk+
	A9w4Mnh9jMYKuFwuMTs6jiiwfguSGFxHUzPxSt7Qh9U1xelyCtOwttNhXQ==
X-Google-Smtp-Source: AGHT+IF78inh9Kdrf6BD4hGb8BXJwtmmCVut8pd7Dj9KTXVjvdlRhbyJyjGZAI5vMTSORbi5BiLdVQ==
X-Received: by 2002:a05:6a00:190b:b0:71e:4a51:2007 with SMTP id d2e1a72fcca58-71e4a512125mr596429b3a.4.1728660522033;
        Fri, 11 Oct 2024 08:28:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9e953fsm2706406b3a.8.2024.10.11.08.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:28:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <30d17d53-56af-4b7d-8fa8-9aa4ec091858@roeck-us.net>
Date: Fri, 11 Oct 2024 08:28:39 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fate of cpu5wdt driver
To: Jean Delvare <jdelvare@suse.de>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org
References: <20241011170710.484a257a@endymion.delvare>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241011170710.484a257a@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 08:07, Jean Delvare wrote:
> Hi all,
> 
> I recently got to look into the cpu5wdt driver to backport a security
> fix. This driver seems to be in a pretty sorry state.
> 
> 1* The driver accesses arbitrary I/O ports without ever checking which
>     hardware it runs on. I have no idea what this "sma cpu5" thing is,
>     a quick web search did not return anything relevant, only that
>     sma.de still exists but nothing about "CPU5" specifically. The
>     Kconfig description is "TBD" (not joking...). I can only imagine
>     this is a very specific, very old and probably no longer relevant
>     piece of hardware. The driver comes with zero documentation. I tried
>     to contact the original author but did not get any answer.
> 
> 2* There's no explanation of what cpu5wdt_lock is supposed to protect,
>     but its use throughout the driver is suspiciously inconsistent. In
>     most places, the lock is held when accessing cpu5wdt_device.running,
>     ticks, cpu5wdt_device.queue, cpu5wdt_device.timer and
>     cpu5wdt_device.stop. However there are exceptions to that, with
>     cpu5wdt_trigger() using cpu5wdt_device.running and ticks without
>     holding the lock. Likewise, cpu5wdt_exit() is using
>     cpu5wdt_device.queue, cpu5wdt_device.stop and cpu5wdt_device.timer
>     without holding the lock, which could race with cpu5wdt_trigger().
>     cpu5wdt_reset() is also touching ticks without holding the lock. Not
>     sure how atomic "ticks--" is guaranteed to be on X86, if atomicity
>     isn't fully guaranteed then this is racy (FWIW ticks was originally
>     declared volatile, but volatile was removed to silent a warning).
> 
> 3* The driver doesn't implement WDIOC_SETTIMEOUT. The timeout is set
>     at module load time as an arbitrary tick count. The default is
>     10000 and the driver is ticking every (HZ/10+1) jiffies, which leads
>     to an inaccurate and undocumented 16 minutes 40 seconds timeout,
>     after which the driver stops pinging the hardware but we have no
>     idea how long it will take before the hardware watchdog actually
>     reboots the system. This is clearly incompatible with the
>     expectations of modern software stacks (systemd, high-availability
>     setups).
> 
> 4* I also found a potential integer overflow in cpu5wdt_start, using
>     WDIOS_ENABLECARD 2^64 times without closing the device would "stop
>     the watchdog", so the system would not reboot even if the watchdog
>     process stops writing to the device. Not a serious issue as nobody
>     sane would do that, but still...
> 
> The driver was added in 2003 and there's no evidence that it has any
> recent user, all changes seem to be tree-wide, subsystem-wide, or the
> result of static code analysis.
> 
> Would anyone object to the plain removal of driver cpu5wdt from the
> kernel tree?
> 

Ok with me to remove it. Unless someone objects direectly with a good reason,
I'd suggest to submit a patch to remove it and wait for the fallout.

Guenter


